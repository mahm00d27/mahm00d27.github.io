#' Render experience timeline HTML
#' @export
render_experience <- function(experience) {
  for (item in experience) {
    cls <- if (isTRUE(item$current)) "tl-item active fade-in" else "tl-item fade-in"
    org_html <- if (!is.null(item$link)) {
      sprintf('<a href="%s" target="_blank">%s</a>', item$link, item$org)
    } else item$org
    cat(sprintf('<div class="%s">\n', cls))
    cat(sprintf('<div class="tl-period">%s &middot; %s</div>\n', item$period, item$location))
    cat(sprintf('<div class="tl-role">%s</div>\n', item$role))
    cat(sprintf('<div class="tl-org">%s</div>\n', org_html))
    cat('<div class="tl-body">\n')
    cat(paste0('<ul>', paste0('<li>', item$bullets, '</li>', collapse = ""), '</ul>'))
    cat('\n</div></div>\n')
  }
}

#' Render project cards HTML
#' @export
render_projects <- function(projects) {
  for (p in projects) {
    cat('<div class="p-card fade-in">\n')
    cat(sprintf('<div class="p-card-period">%s</div>\n', p$period))
    cat(sprintf('<div class="p-card-org">%s</div>\n', p$org))
    cat(sprintf('<h3>%s</h3>\n', p$title))
    cat(sprintf('<p>%s</p>\n', p$desc))
    cat(paste0('<div class="tags">',
      paste0('<span class="tag">', p$tags, '</span>', collapse = ""),
      '</div>'))
    if (!is.null(p$link))
      cat(sprintf('\n<a class="p-card-link" href="%s" target="_blank">View project \u2192</a>\n', p$link))
    cat('\n</div>\n')
  }
}

#' Render publication list HTML
#' @export
render_publications <- function(publications, links) {
  for (pub in publications) {
    title_html <- if (!is.null(pub$link)) {
      sprintf('<a href="%s" target="_blank">%s</a>', pub$link, pub$title)
    } else pub$title
    doi_html <- if (!is.null(pub$doi) && nzchar(pub$doi)) {
      sprintf('<a class="pub-doi" href="https://doi.org/%s" target="_blank">doi:%s</a>', pub$doi, pub$doi)
    } else ""
    cat('<li class="pub-item fade-in">\n')
    cat(sprintf('<div class="pub-year">%s</div>\n', pub$year))
    cat('<div>\n')
    cat(sprintf('<div class="pub-title">%s</div>\n', title_html))
    cat(sprintf('<div class="pub-authors">%s</div>\n', pub$authors))
    cat(sprintf('<div class="pub-journal"><em>%s</em> &middot; %s</div>\n', pub$journal, pub$detail))
    cat(doi_html)
    cat('\n</div></li>\n')
  }
}

#' Render education cards HTML
#' @export
render_edu_cards <- function(items) {
  for (e in items) {
    school_html <- if (!is.null(e$link)) {
      sprintf('<a href="%s" target="_blank">%s</a>', e$link, e$school)
    } else e$school
    cat('<div class="edu-card fade-in">\n')
    cat(sprintf('<div class="edu-year">%s</div>\n', e$year))
    cat(sprintf('<div class="edu-degree">%s</div>\n', e$degree))
    if (!is.null(e$location) && nzchar(e$location)) {
      cat(sprintf('<div class="edu-school">%s &middot; %s</div>\n', school_html, e$location))
    } else {
      cat(sprintf('<div class="edu-school">%s</div>\n', school_html))
    }
    if (!is.null(e$note) && nzchar(e$note))
      cat(sprintf('<div class="edu-note">%s</div>\n', e$note))
    cat('</div>\n')
  }
}

#' Render certification cards HTML
#' @export
render_certs <- function(certifications) {
  for (cert in certifications) {
    name_html <- if (!is.null(cert$link)) {
      sprintf('<a href="%s" target="_blank" style="text-decoration:none;color:inherit;">%s</a>',
        cert$link, cert$name)
    } else cert$name
    cat('<div class="cert-card fade-in">\n')
    cat(sprintf('<div class="cert-name">%s</div>\n', name_html))
    cat(sprintf('<div class="cert-issuer">%s</div>\n', cert$issuer))
    if (!is.null(cert$date) && nzchar(cert$date))
      cat(sprintf('<div class="cert-date">%s</div>\n', cert$date))
    cat('</div>\n')
  }
}

#' Render affiliation list items HTML
#' @export
render_affils <- function(affils) {
  for (a in affils) {
    item_html <- if (!is.null(a$link)) {
      sprintf('<a href="%s" target="_blank">%s</a> \u2014 %s', a$link, a$org, a$role)
    } else {
      sprintf('%s \u2014 %s', a$org, a$role)
    }
    cat(sprintf('<li>%s</li>\n', item_html))
  }
}

#' Render mentorship list items HTML
#' @export
render_mentorship <- function(mentorship) {
  for (m in mentorship) {
    label <- if (!is.null(m$link)) {
      sprintf('<a href="%s" target="_blank">%s</a>', m$link, m$event)
    } else m$event
    if (!is.null(m$date))
      label <- paste0(label, sprintf(
        ' <span style="color:var(--muted);font-size:0.8em;">&middot; %s</span>', m$date))
    cat(sprintf('<li>%s</li>\n', label))
  }
}
