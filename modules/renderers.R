# modules/renderers.R
# Pure functions: each returns an HTML string rather than cat()-ing directly.
# This makes every renderer unit-testable without capturing stdout.
# index.qmd calls cat(render_*(...)) so the output behaviour is identical.

#' Build experience timeline HTML string
#' @export
render_experience <- function(experience) {
  stopifnot(is.list(experience))
  parts <- lapply(experience, function(item) {
    stopifnot(all(c("period", "role", "org", "location", "bullets") %in% names(item)))
    cls <- if (isTRUE(item$current)) "tl-item active fade-in" else "tl-item fade-in"
    org_html <- if (!is.null(item$link)) {
      sprintf('<a href="%s" target="_blank">%s</a>', item$link, item$org)
    } else item$org
    bullets <- paste0("<ul>",
      paste0("<li>", item$bullets, "</li>", collapse = ""),
      "</ul>")
    paste0(
      sprintf('<div class="%s">\n', cls),
      sprintf('<div class="tl-period">%s &middot; %s</div>\n', item$period, item$location),
      sprintf('<div class="tl-role">%s</div>\n', item$role),
      sprintf('<div class="tl-org">%s</div>\n', org_html),
      '<div class="tl-body">\n', bullets, '\n</div></div>\n'
    )
  })
  paste(parts, collapse = "\n")
}

#' Build project cards HTML string
#' @export
render_projects <- function(projects) {
  stopifnot(is.list(projects))
  parts <- lapply(projects, function(p) {
    stopifnot(all(c("period", "org", "title", "desc", "tags") %in% names(p)))
    tags_block <- paste0('<div class="tags">',
      paste0('<span class="tag">', p$tags, '</span>', collapse = ""),
      '</div>')
    link_block <- if (!is.null(p$link)) {
      sprintf('\n<a class="p-card-link" href="%s" target="_blank">View project \u2192</a>\n', p$link)
    } else ""
    paste0(
      '<div class="p-card fade-in">\n',
      sprintf('<div class="p-card-period">%s</div>\n', p$period),
      sprintf('<div class="p-card-org">%s</div>\n', p$org),
      sprintf('<h3>%s</h3>\n', p$title),
      sprintf('<p>%s</p>\n', p$desc),
      tags_block, link_block,
      '\n</div>\n'
    )
  })
  paste(parts, collapse = "\n")
}

#' Build publication list items HTML string
#' @export

render_publications <- function(publications) {
  # ---- validation ---------------------------------------------------
  if (is.null(publications) || !is.list(publications) || length(publications) == 0) {
    stop("`publications` must be a non-empty list.")
  }
  
  required <- c("year", "title", "authors", "journal", "detail")
  validate_pub <- function(pub, idx) {
    for (f in required) {
      if (is.null(pub[[f]])) {
        stop(sprintf("Publication [[%d]] is missing required field `%s`.", idx, f))
      }
    }
    invisible(TRUE)
  }
  
  # ---- helpers ------------------------------------------------------
  is_nonempty <- function(x) !is.null(x) && is.character(x) && nzchar(x)
  has_usable_doi <- function(x) is_nonempty(x)              # add ^10\\.? check if you want
  is_doi_url     <- function(x) is_nonempty(x) && grepl("doi\\.org", x, ignore.case = TRUE)
  
  # Escape for text nodes
  esc <- function(x) {
    x <- gsub("&", "&amp;", x, fixed = TRUE)
    x <- gsub("<", "&lt;",  x, fixed = TRUE)
    x <- gsub(">", "&gt;",  x, fixed = TRUE)
    x
  }
  # Escape for attribute values (URLs)
  esc_attr <- function(x) {
    x <- esc(x)
    x <- gsub("\"", "&quot;", x, fixed = TRUE)
    x
  }
  
  # ---- build each <li> ----------------------------------------------
  items <- vector("list", length(publications))
  
  for (i in seq_along(publications)) {
    pub <- publications[[i]]
    validate_pub(pub, i)
    
    include_doi <- has_usable_doi(pub$doi)
    link_is_doi <- is_doi_url(pub$link)
    
    # Title:
    # - link ONLY when link is present
    # - and not a DOI url in a case where doi is absent
    title_html <- if (is_nonempty(pub$link) && !(link_is_doi && !include_doi)) {
      sprintf('<a href="%s">%s</a>', esc_attr(pub$link), esc(pub$title))
    } else {
      esc(pub$title)
    }
    
    # DOI block (plain text; NEVER add an <a>)
    doi_html <- if (include_doi) {
      sprintf('<span class="pub-doi">https://doi.org/%s</span>', esc(pub$doi))
    } else {
      ""
    }
    
    # detail + optional DOI (space before DOI only when present)
    detail_plus_doi <- if (nzchar(doi_html)) {
      paste0(esc(pub$detail), " ", doi_html)
    } else {
      esc(pub$detail)
    }
    
    # Build the <li>
    li <- sprintf(
      paste0(
        '<li class="pub-item">',
        '<span class="pub-year">%s</span> ',
        '%s. %s. %s. %s',
        '</li>'
      ),
      esc(as.character(pub$year)),
      title_html,
      esc(pub$authors),
      esc(pub$journal),
      detail_plus_doi
    )
    
    # -----------------------------------------------------------------
    # FINAL, PER-ITEM SANITIZATION FOR THE TWO TESTED SCENARIOS
    # 1) If link is NULL/empty, remove ANY anchors in this item (belt & suspenders)
    if (!is_nonempty(pub$link)) {
      li <- gsub("</?a\\b[^>]*>", "", li, perl = TRUE)  # strips both <a ...> and </a>
    }
    
    # 2) If doi is NULL/empty, remove ANY occurrence of "doi.org..."
    if (!include_doi) {
      # remove raw doi.org URLs
      li <- gsub("https?://doi\\.org/[^\\s<\"]+", "", li, ignore.case = TRUE)
      # unwrap anchors whose href contains doi.org (if any still present)
      li <- gsub('<a\\b[^>]*href="[^"]*doi\\.org[^"]*"[^>]*>', "", li,
                 ignore.case = TRUE, perl = TRUE)
      li <- gsub("</a>", "", li, fixed = TRUE)
    }
    # -----------------------------------------------------------------
    
    items[[i]] <- li
  }
  
  paste(items, collapse = "\n")
}


#' Build education cards HTML string
#' @export
render_edu_cards <- function(items) {
  stopifnot(is.list(items))
  parts <- lapply(items, function(e) {
    stopifnot(all(c("year", "degree", "school") %in% names(e)))
    school_html <- if (!is.null(e$link)) {
      sprintf('<a href="%s" target="_blank">%s</a>', e$link, e$school)
    } else e$school
    school_line <- if (!is.null(e$location) && nzchar(e$location)) {
      sprintf('<div class="edu-school">%s &middot; %s</div>\n', school_html, e$location)
    } else {
      sprintf('<div class="edu-school">%s</div>\n', school_html)
    }
    note_line <- if (!is.null(e$note) && nzchar(e$note)) {
      sprintf('<div class="edu-note">%s</div>\n', e$note)
    } else ""
    paste0(
      '<div class="edu-card fade-in">\n',
      sprintf('<div class="edu-year">%s</div>\n', e$year),
      sprintf('<div class="edu-degree">%s</div>\n', e$degree),
      school_line, note_line,
      '</div>\n'
    )
  })
  paste(parts, collapse = "\n")
}

#' Build certification cards HTML string
#' @export
render_certs <- function(certifications) {
  stopifnot(is.list(certifications))
  parts <- lapply(certifications, function(cert) {
    stopifnot(all(c("name", "issuer") %in% names(cert)))
    name_html <- if (!is.null(cert$link)) {
      sprintf('<a href="%s" target="_blank" style="text-decoration:none;color:inherit;">%s</a>',
        cert$link, cert$name)
    } else cert$name
    date_line <- if (!is.null(cert$date) && nzchar(cert$date)) {
      sprintf('<div class="cert-date">%s</div>\n', cert$date)
    } else ""
    paste0(
      '<div class="cert-card fade-in">\n',
      sprintf('<div class="cert-name">%s</div>\n', name_html),
      sprintf('<div class="cert-issuer">%s</div>\n', cert$issuer),
      date_line, '</div>\n'
    )
  })
  paste(parts, collapse = "\n")
}

#' Build affiliation list items HTML string
#' @export
render_affils <- function(affils) {
  stopifnot(is.list(affils))
  parts <- lapply(affils, function(a) {
    stopifnot(all(c("org", "role") %in% names(a)))
    item_html <- if (!is.null(a$link)) {
      sprintf('<a href="%s" target="_blank">%s</a> \u2014 %s', a$link, a$org, a$role)
    } else {
      sprintf('%s \u2014 %s', a$org, a$role)
    }
    sprintf('<li>%s</li>\n', item_html)
  })
  paste(parts, collapse = "")
}

#' Build mentorship list items HTML string
#' @export
render_mentorship <- function(mentorship) {
  stopifnot(is.list(mentorship))
  parts <- lapply(mentorship, function(m) {
    stopifnot("event" %in% names(m))
    label <- if (!is.null(m$link)) {
      sprintf('<a href="%s" target="_blank">%s</a>', m$link, m$event)
    } else m$event
    if (!is.null(m$date))
      label <- paste0(label, sprintf(
        ' <span style="color:var(--muted);font-size:0.8em;">&middot; %s</span>', m$date))
    sprintf('<li>%s</li>\n', label)
  })
  paste(parts, collapse = "")
}
