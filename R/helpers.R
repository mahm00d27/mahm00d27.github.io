# R/helpers.R

tags_html <- function(tags) {
  paste0('<div class="tags">',
    paste0('<span class="tag">', tags, '</span>', collapse = ""),
    '</div>')
}

bullets_html <- function(b) {
  paste0('<ul>', paste0('<li>', b, '</li>', collapse = ""), '</ul>')
}

link_btn <- function(url, label = "View project →") {
  if (is.null(url)) return("")
  sprintf('<a class="p-card-link" href="%s" target="_blank">%s</a>', url, label)
}

affil_link <- function(item) {
  if (!is.null(item$link)) {
    sprintf('<a href="%s" target="_blank">%s</a> — %s', item$link, item$org, item$role)
  } else {
    sprintf('%s — %s', item$org, item$role)
  }
}
