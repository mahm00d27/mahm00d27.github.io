#' @export
tags_html <- function(tags) {
  paste0('<div class="tags">',
    paste0('<span class="tag">', tags, '</span>', collapse = ""),
    '</div>')
}

#' @export
bullets_html <- function(b) {
  paste0('<ul>', paste0('<li>', b, '</li>', collapse = ""), '</ul>')
}

#' @export
link_btn <- function(url, label = "View project \u2192") {
  if (is.null(url)) return("")
  sprintf('<a class="p-card-link" href="%s" target="_blank">%s</a>', url, label)
}

#' @export
affil_link <- function(item) {
  if (!is.null(item$link)) {
    sprintf('<a href="%s" target="_blank">%s</a> \u2014 %s', item$link, item$org, item$role)
  } else {
    sprintf('%s \u2014 %s', item$org, item$role)
  }
}
