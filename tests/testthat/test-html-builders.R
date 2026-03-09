# tests/testthat/test-html-builders.R
# Unit tests for modules/html_builders.R
# Each function is pure (input → string), so tests are straightforward.

box::use(modules/html_builders[tags_html, bullets_html, link_btn, affil_link])

# ── tags_html ──────────────────────────────────────────────────────────────────

test_that("tags_html wraps each tag in a span", {
  out <- tags_html(c("R", "Python"))
  expect_true(grepl('<span class="tag">R</span>', out, fixed = TRUE))
  expect_true(grepl('<span class="tag">Python</span>', out, fixed = TRUE))
})

test_that("tags_html wraps result in a tags div", {
  out <- tags_html("R")
  expect_true(grepl('^<div class="tags">', out))
  expect_true(grepl('</div>$', out))
})

test_that("tags_html handles a single tag", {
  out <- tags_html("Quarto")
  expect_true(grepl("Quarto", out))
  expect_equal(length(gregexpr("<span", out)[[1]]), 1L)
})

test_that("tags_html handles many tags without collapsing incorrectly", {
  tags <- c("R", "Python", "SQL", "Shiny", "Azure")
  out  <- tags_html(tags)
  for (t in tags) expect_true(grepl(t, out, fixed = TRUE))
  expect_equal(length(gregexpr('<span class="tag">', out, fixed = TRUE)[[1]]), 5L)
})

# ── bullets_html ───────────────────────────────────────────────────────────────

test_that("bullets_html wraps each item in an li", {
  out <- bullets_html(c("First point", "Second point"))
  expect_true(grepl("<li>First point</li>", out, fixed = TRUE))
  expect_true(grepl("<li>Second point</li>", out, fixed = TRUE))
})

test_that("bullets_html wraps result in a ul", {
  out <- bullets_html("Only point")
  expect_true(grepl("^<ul>", out))
  expect_true(grepl("</ul>$", out))
})

test_that("bullets_html returns a single string", {
  out <- bullets_html(c("a", "b", "c"))
  expect_length(out, 1L)
})

# ── link_btn ───────────────────────────────────────────────────────────────────

test_that("link_btn returns empty string for NULL url", {
  expect_equal(link_btn(NULL), "")
})

test_that("link_btn produces an anchor tag with correct href", {
  out <- link_btn("https://example.com")
  expect_true(grepl('href="https://example.com"', out, fixed = TRUE))
  expect_true(grepl("<a ", out, fixed = TRUE))
})

test_that("link_btn uses default label when none provided", {
  out <- link_btn("https://example.com")
  expect_true(grepl("View project", out))
})

test_that("link_btn uses custom label when provided", {
  out <- link_btn("https://example.com", label = "See paper")
  expect_true(grepl("See paper", out, fixed = TRUE))
})

test_that("link_btn sets target=_blank", {
  out <- link_btn("https://example.com")
  expect_true(grepl('target="_blank"', out, fixed = TRUE))
})

test_that("link_btn applies p-card-link class", {
  out <- link_btn("https://example.com")
  expect_true(grepl('class="p-card-link"', out, fixed = TRUE))
})

# ── affil_link ─────────────────────────────────────────────────────────────────

test_that("affil_link with link returns an anchor tag", {
  item <- list(org = "UBC", role = "Member", link = "https://ubc.ca")
  out  <- affil_link(item)
  expect_true(grepl("<a href", out, fixed = TRUE))
  expect_true(grepl("UBC", out))
  expect_true(grepl("Member", out))
})

test_that("affil_link without link returns plain text", {
  item <- list(org = "BMA", role = "General Member", link = NULL)
  out  <- affil_link(item)
  expect_false(grepl("<a ", out, fixed = TRUE))
  expect_true(grepl("BMA", out))
  expect_true(grepl("General Member", out))
})

test_that("affil_link separates org and role with em dash", {
  item <- list(org = "WHO", role = "Collaborator", link = NULL)
  out  <- affil_link(item)
  expect_true(grepl("\u2014", out))
})
