# tests/testthat/test-data.R
# Data integrity tests for data/portfolio_data.R
# These guard against accidental content corruption — missing required fields,
# broken URL formats, empty strings where content is expected, etc.
# Run with: testthat::test_file("tests/testthat/test-data.R")

source(here::here("data", "portfolio_data.R"))

# ── Helper ─────────────────────────────────────────────────────────────────────

is_url <- function(x) grepl("^https?://", x)

# ── links ──────────────────────────────────────────────────────────────────────

test_that("links object exists and is a named list", {
  expect_true(exists("links"))
  expect_type(links, "list")
  expect_true(length(names(links)) > 0)
})

test_that("all required social links are present", {
  required <- c("linkedin", "github", "scholar", "orcid",
                "researchgate", "pubmed", "email")
  for (key in required)
    expect_true(!is.null(links[[key]]),
      label = paste("links$", key, "is missing"))
})

test_that("all links values that are URLs start with https://", {
  url_keys <- c("linkedin", "github", "scholar", "orcid",
                "researchgate", "pubmed")
  for (key in url_keys)
    expect_true(is_url(links[[key]]),
      label = paste("links$", key, "is not a valid URL"))
})

test_that("email addresses contain @", {
  expect_true(grepl("@", links$email))
  expect_true(grepl("@", links$email_work))
})

# ── experience ─────────────────────────────────────────────────────────────────

test_that("experience exists and is a non-empty list", {
  expect_true(exists("experience"))
  expect_type(experience, "list")
  expect_gt(length(experience), 0L)
})

test_that("every experience entry has required fields", {
  required <- c("period", "role", "org", "location", "bullets")
  for (i in seq_along(experience)) {
    item <- experience[[i]]
    for (field in required)
      expect_true(!is.null(item[[field]]),
        label = paste("experience[[", i, "]]$", field, "is missing"))
  }
})

test_that("every experience entry has at least one bullet", {
  for (i in seq_along(experience))
    expect_gt(length(experience[[i]]$bullets), 0L,
      label = paste("experience[[", i, "]] has no bullets"))
})

test_that("exactly one experience entry is marked current", {
  current_flags <- sapply(experience, function(x) isTRUE(x$current))
  expect_equal(sum(current_flags), 1L)
})

test_that("experience links are valid URLs when not NULL", {
  for (i in seq_along(experience)) {
    lnk <- experience[[i]]$link
    if (!is.null(lnk))
      expect_true(is_url(lnk),
        label = paste("experience[[", i, "]]$link is not a valid URL"))
  }
})

test_that("experience period fields are non-empty strings", {
  for (i in seq_along(experience))
    expect_true(nzchar(experience[[i]]$period),
      label = paste("experience[[", i, "]]$period is empty"))
})

# ── ph_projects & ds_projects ──────────────────────────────────────────────────

test_that("ph_projects and ds_projects exist and are non-empty", {
  expect_true(exists("ph_projects"))
  expect_true(exists("ds_projects"))
  expect_gt(length(ph_projects), 0L)
  expect_gt(length(ds_projects), 0L)
})

test_that("every project has required fields", {
  required <- c("title", "org", "period", "desc", "tags")
  all_projects <- c(ph_projects, ds_projects)
  for (i in seq_along(all_projects)) {
    p <- all_projects[[i]]
    for (field in required)
      expect_true(!is.null(p[[field]]),
        label = paste("project[[", i, "]]$", field, "is missing"))
  }
})

test_that("every project has at least one tag", {
  all_projects <- c(ph_projects, ds_projects)
  for (i in seq_along(all_projects))
    expect_gt(length(all_projects[[i]]$tags), 0L,
      label = paste("project[[", i, "]] has no tags"))
})

test_that("project links are valid URLs when not NULL", {
  all_projects <- c(ph_projects, ds_projects)
  for (i in seq_along(all_projects)) {
    lnk <- all_projects[[i]]$link
    if (!is.null(lnk))
      expect_true(is_url(lnk),
        label = paste("project[[", i, "]]$link is not a valid URL"))
  }
})

test_that("project descriptions are non-empty strings", {
  all_projects <- c(ph_projects, ds_projects)
  for (i in seq_along(all_projects))
    expect_true(nzchar(all_projects[[i]]$desc),
      label = paste("project[[", i, "]]$desc is empty"))
})

# ── publications ───────────────────────────────────────────────────────────────

test_that("publications exists and is a non-empty list", {
  expect_true(exists("publications"))
  expect_type(publications, "list")
  expect_gt(length(publications), 0L)
})

test_that("every publication has required fields", {
  required <- c("year", "title", "authors", "journal", "detail")
  for (i in seq_along(publications)) {
    pub <- publications[[i]]
    for (field in required)
      expect_true(!is.null(pub[[field]]),
        label = paste("publications[[", i, "]]$", field, "is missing"))
  }
})

test_that("publication years are numeric and plausible", {
  for (i in seq_along(publications)) {
    yr <- publications[[i]]$year
    expect_true(is.numeric(yr),
      label = paste("publications[[", i, "]]$year is not numeric"))
    expect_true(yr >= 2000 && yr <= 2030,
      label = paste("publications[[", i, "]]$year", yr, "looks wrong"))
  }
})

test_that("publication DOIs that exist follow doi: format", {
  for (i in seq_along(publications)) {
    doi <- publications[[i]]$doi
    if (!is.null(doi) && nzchar(doi))
      expect_true(grepl("^10\\.", doi),
        label = paste("publications[[", i, "]]$doi doesn't start with 10."))
  }
})

test_that("publication links that exist are valid URLs", {
  for (i in seq_along(publications)) {
    lnk <- publications[[i]]$link
    if (!is.null(lnk) && nzchar(lnk))
      expect_true(is_url(lnk),
        label = paste("publications[[", i, "]]$link is not a valid URL"))
  }
})

test_that("publication titles are non-empty strings", {
  for (i in seq_along(publications))
    expect_true(nzchar(publications[[i]]$title),
      label = paste("publications[[", i, "]]$title is empty"))
})

test_that("publications are in non-ascending year order", {
  years <- sapply(publications, `[[`, "year")
  expect_true(all(diff(years) <= 0),
    label = "Publications are not sorted newest-first")
})

# ── education ──────────────────────────────────────────────────────────────────

test_that("education exists with degrees and training sub-lists", {
  expect_true(exists("education"))
  expect_true(!is.null(education$degrees))
  expect_true(!is.null(education$training))
  expect_gt(length(education$degrees), 0L)
  expect_gt(length(education$training), 0L)
})

test_that("every education entry has year, degree, and school", {
  all_edu <- c(education$degrees, education$training)
  for (i in seq_along(all_edu)) {
    e <- all_edu[[i]]
    expect_true(!is.null(e$year),   label = paste("edu[[", i, "]]$year missing"))
    expect_true(!is.null(e$degree), label = paste("edu[[", i, "]]$degree missing"))
    expect_true(!is.null(e$school), label = paste("edu[[", i, "]]$school missing"))
  }
})

test_that("education links are valid URLs when not NULL", {
  all_edu <- c(education$degrees, education$training)
  for (i in seq_along(all_edu)) {
    lnk <- all_edu[[i]]$link
    if (!is.null(lnk))
      expect_true(is_url(lnk),
        label = paste("edu[[", i, "]]$link is not a valid URL"))
  }
})

# ── certifications ─────────────────────────────────────────────────────────────

test_that("certifications exists and is a non-empty list", {
  expect_true(exists("certifications"))
  expect_gt(length(certifications), 0L)
})

test_that("every certification has name and issuer", {
  for (i in seq_along(certifications)) {
    cert <- certifications[[i]]
    expect_true(!is.null(cert$name),   label = paste("cert[[", i, "]]$name missing"))
    expect_true(!is.null(cert$issuer), label = paste("cert[[", i, "]]$issuer missing"))
    expect_true(nzchar(cert$name),     label = paste("cert[[", i, "]]$name is empty"))
    expect_true(nzchar(cert$issuer),   label = paste("cert[[", i, "]]$issuer is empty"))
  }
})

test_that("certification links are valid URLs when not NULL", {
  for (i in seq_along(certifications)) {
    lnk <- certifications[[i]]$link
    if (!is.null(lnk))
      expect_true(is_url(lnk),
        label = paste("cert[[", i, "]]$link is not a valid URL"))
  }
})

# ── affiliations ───────────────────────────────────────────────────────────────

test_that("affiliations exists with ph and ds sub-lists", {
  expect_true(exists("affiliations"))
  expect_true(!is.null(affiliations$ph))
  expect_true(!is.null(affiliations$ds))
  expect_gt(length(affiliations$ph), 0L)
  expect_gt(length(affiliations$ds), 0L)
})

test_that("every affiliation has org and role", {
  all_affils <- c(affiliations$ph, affiliations$ds)
  for (i in seq_along(all_affils)) {
    a <- all_affils[[i]]
    expect_true(!is.null(a$org),  label = paste("affil[[", i, "]]$org missing"))
    expect_true(!is.null(a$role), label = paste("affil[[", i, "]]$role missing"))
    expect_true(nzchar(a$org),    label = paste("affil[[", i, "]]$org is empty"))
    expect_true(nzchar(a$role),   label = paste("affil[[", i, "]]$role is empty"))
  }
})

test_that("affiliation links are valid URLs when not NULL", {
  all_affils <- c(affiliations$ph, affiliations$ds)
  for (i in seq_along(all_affils)) {
    lnk <- all_affils[[i]]$link
    if (!is.null(lnk))
      expect_true(is_url(lnk),
        label = paste("affil[[", i, "]]$link is not a valid URL"))
  }
})

# ── mentorship ─────────────────────────────────────────────────────────────────

test_that("mentorship exists and is a non-empty list", {
  expect_true(exists("mentorship"))
  expect_gt(length(mentorship), 0L)
})

test_that("every mentorship entry has a non-empty event field", {
  for (i in seq_along(mentorship))
    expect_true(nzchar(mentorship[[i]]$event),
      label = paste("mentorship[[", i, "]]$event is empty"))
})

test_that("mentorship links are valid URLs when not NULL", {
  for (i in seq_along(mentorship)) {
    lnk <- mentorship[[i]]$link
    if (!is.null(lnk))
      expect_true(is_url(lnk),
        label = paste("mentorship[[", i, "]]$link is not a valid URL"))
  }
})
