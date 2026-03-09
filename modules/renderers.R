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
  stopifnot(is.list(publications))
  parts <- lapply(publications, function(pub) {
    stopifnot(all(c("year", "title", "authors", "journal", "detail") %in% names(pub)))
    title_html <- if (!is.null(pub$link)) {
      sprintf('<a href="%s" target="_blank">%s</a>', pub$link, pub$title)
    } else pub$title
    doi_html <- if (!is.null(pub$doi) && nzchar(pub$doi)) {
      sprintf('<a class="pub-doi" href="https://doi.org/%s" target="_blank">doi:%s</a>',
              pub$doi, pub$doi)
    } else ""
    paste0(
      '<li class="pub-item fade-in">\n',
      sprintf('<div class="pub-year">%s</div>\n', pub$year),
      '<div class="pub-content">\n',
      sprintf('<div class="pub-title">%s</div>\n', title_html),
      sprintf('<div class="pub-authors">%s</div>\n', pub$authors),
      sprintf('<div class="pub-journal"><em>%s</em> &middot; %s</div>\n', pub$journal, pub$detail),
      doi_html, '\n</div></li>\n'
    )
  })
  paste(parts, collapse = "\n")
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