# tests/testthat/test-renderers.R
# Unit tests for modules/renderers.R
# All renderers return strings — we test structure, required elements,
# edge cases (NULL links, empty optional fields), and input validation.

box::use(modules/renderers[
  render_experience,
  render_projects,
  render_publications,
  render_edu_cards,
  render_certs,
  render_affils,
  render_mentorship
])

# ── Fixtures ───────────────────────────────────────────────────────────────────

minimal_exp <- list(list(
  period   = "2023–Present",
  role     = "Analyst",
  org      = "PHSA",
  location = "Vancouver, BC",
  current  = TRUE,
  bullets  = c("Did work", "Did more work"),
  link     = NULL
))

minimal_proj <- list(list(
  title  = "Stroke Dashboard",
  org    = "PHSA",
  period = "2023–Present",
  desc   = "An R Shiny dashboard.",
  tags   = c("R", "Shiny"),
  link   = NULL
))

minimal_pub <- list(list(
  year    = 2022,
  title   = "A Study",
  authors = "Rahman M, et al.",
  journal = "The Lancet",
  detail  = "2022;1(1):1–10",
  doi     = "10.1000/test",
  link    = "https://doi.org/10.1000/test"
))

minimal_edu <- list(list(
  year     = "2021–22",
  degree   = "Master of Data Science",
  school   = "UBC",
  location = "Vancouver, BC",
  link     = "https://ubc.ca",
  note     = "First from Bangladesh."
))

minimal_cert <- list(list(
  name   = "Good Clinical Practice",
  issuer = "icddr,b / JHU",
  date   = "Jul 2017",
  link   = NULL
))

minimal_affil <- list(list(
  org  = "Canadian Public Health Association",
  role = "Student Member",
  link = "https://cpha.ca"
))

minimal_mentorship <- list(list(
  event = "UBC Datathon 2025",
  date  = "Mar 2025",
  link  = "https://ubcmedicinedatathon.com/"
))

# ── render_experience ──────────────────────────────────────────────────────────

test_that("render_experience returns a string", {
  out <- render_experience(minimal_exp)
  expect_type(out, "character")
  expect_length(out, 1L)
})

test_that("render_experience marks current item with active class", {
  out <- render_experience(minimal_exp)
  expect_true(grepl("active", out))
})

test_that("render_experience marks non-current item without active class", {
  item <- minimal_exp
  item[[1]]$current <- FALSE
  out <- render_experience(item)
  expect_false(grepl('"tl-item active', out))
})

test_that("render_experience renders role and org", {
  out <- render_experience(minimal_exp)
  expect_true(grepl("Analyst", out))
  expect_true(grepl("PHSA", out))
})

test_that("render_experience renders each bullet as a list item", {
  out <- render_experience(minimal_exp)
  expect_true(grepl("<li>Did work</li>", out, fixed = TRUE))
  expect_true(grepl("<li>Did more work</li>", out, fixed = TRUE))
})

test_that("render_experience links org when link provided", {
  item <- minimal_exp
  item[[1]]$link <- "https://phsa.ca"
  out <- render_experience(item)
  expect_true(grepl('<a href="https://phsa.ca"', out, fixed = TRUE))
})

test_that("render_experience does not link org when link is NULL", {
  out <- render_experience(minimal_exp)
  expect_false(grepl('<a href=', out, fixed = TRUE))
})

test_that("render_experience errors on missing required field", {
  bad <- list(list(period = "2023", role = "X"))   # missing org, location, bullets
  expect_error(render_experience(bad))
})

test_that("render_experience handles multiple items", {
  two <- c(minimal_exp, minimal_exp)
  two[[2]]$role <- "Second Role"
  out <- render_experience(two)
  expect_true(grepl("Analyst", out))
  expect_true(grepl("Second Role", out))
})

# ── render_projects ────────────────────────────────────────────────────────────

test_that("render_projects returns a string", {
  out <- render_projects(minimal_proj)
  expect_type(out, "character")
  expect_length(out, 1L)
})

test_that("render_projects renders title and description", {
  out <- render_projects(minimal_proj)
  expect_true(grepl("Stroke Dashboard", out))
  expect_true(grepl("An R Shiny dashboard", out))
})

test_that("render_projects renders each tag as a span", {
  out <- render_projects(minimal_proj)
  expect_true(grepl('<span class="tag">R</span>', out, fixed = TRUE))
  expect_true(grepl('<span class="tag">Shiny</span>', out, fixed = TRUE))
})

test_that("render_projects omits link block when link is NULL", {
  out <- render_projects(minimal_proj)
  expect_false(grepl("p-card-link", out))
})

test_that("render_projects includes link when provided", {
  proj <- minimal_proj
  proj[[1]]$link <- "https://github.com/test"
  out <- render_projects(proj)
  expect_true(grepl("p-card-link", out))
  expect_true(grepl("https://github.com/test", out))
})

test_that("render_projects errors on missing required field", {
  bad <- list(list(title = "X", org = "Y"))   # missing period, desc, tags
  expect_error(render_projects(bad))
})

# ── render_publications ────────────────────────────────────────────────────────

test_that("render_publications returns a string", {
  out <- render_publications(minimal_pub)
  expect_type(out, "character")
  expect_length(out, 1L)
})

test_that("render_publications renders year", {
  out <- render_publications(minimal_pub)
  expect_true(grepl("2022", out))
})

test_that("render_publications renders title as link when link provided", {
  out <- render_publications(minimal_pub)
  expect_true(grepl("A Study", out))
  expect_true(grepl('<a href=', out, fixed = TRUE))
})

test_that("render_publications renders title as plain text when no link", {
  pub <- minimal_pub
  pub[[1]]$link <- NULL
  out <- render_publications(pub)
  expect_true(grepl("A Study", out))
  expect_false(grepl('<a href=', out, fixed = TRUE))
})

test_that("render_publications renders DOI link when doi provided", {
  out <- render_publications(minimal_pub)
  expect_true(grepl("doi.org/10.1000/test", out))
})

test_that("render_publications omits DOI when doi is NULL", {
  pub <- minimal_pub
  pub[[1]]$doi <- NULL
  out <- render_publications(pub)
  expect_false(grepl("doi.org", out))
})

test_that("render_publications omits DOI when doi is empty string", {
  pub <- minimal_pub
  pub[[1]]$doi <- ""
  out <- render_publications(pub)
  expect_false(grepl("pub-doi", out))
})

test_that("render_publications wraps each entry in pub-item li", {
  out <- render_publications(minimal_pub)
  expect_true(grepl('class="pub-item', out))
})

test_that("render_publications errors on missing required field", {
  bad <- list(list(year = 2022, title = "X"))   # missing authors, journal, detail
  expect_error(render_publications(bad))
})

# ── render_edu_cards ───────────────────────────────────────────────────────────

test_that("render_edu_cards returns a string", {
  out <- render_edu_cards(minimal_edu)
  expect_type(out, "character")
  expect_length(out, 1L)
})

test_that("render_edu_cards renders degree and school", {
  out <- render_edu_cards(minimal_edu)
  expect_true(grepl("Master of Data Science", out))
  expect_true(grepl("UBC", out))
})

test_that("render_edu_cards links school when link provided", {
  out <- render_edu_cards(minimal_edu)
  expect_true(grepl('<a href="https://ubc.ca"', out, fixed = TRUE))
})

test_that("render_edu_cards does not link school when link is NULL", {
  edu <- minimal_edu
  edu[[1]]$link <- NULL
  out <- render_edu_cards(edu)
  expect_false(grepl("<a href", out, fixed = TRUE))
})

test_that("render_edu_cards includes location when provided", {
  out <- render_edu_cards(minimal_edu)
  expect_true(grepl("Vancouver, BC", out))
})

test_that("render_edu_cards omits location when NULL", {
  edu <- minimal_edu
  edu[[1]]$location <- NULL
  out <- render_edu_cards(edu)
  expect_false(grepl("Vancouver", out))
})

test_that("render_edu_cards renders note when non-empty", {
  out <- render_edu_cards(minimal_edu)
  expect_true(grepl("First from Bangladesh", out))
})

test_that("render_edu_cards omits note div when note is empty string", {
  edu <- minimal_edu
  edu[[1]]$note <- ""
  out <- render_edu_cards(edu)
  expect_false(grepl("edu-note", out))
})

test_that("render_edu_cards errors on missing required field", {
  bad <- list(list(year = "2022"))   # missing degree, school
  expect_error(render_edu_cards(bad))
})

# ── render_certs ───────────────────────────────────────────────────────────────

test_that("render_certs returns a string", {
  out <- render_certs(minimal_cert)
  expect_type(out, "character")
  expect_length(out, 1L)
})

test_that("render_certs renders name and issuer", {
  out <- render_certs(minimal_cert)
  expect_true(grepl("Good Clinical Practice", out))
  expect_true(grepl("icddr,b / JHU", out))
})

test_that("render_certs renders date when provided", {
  out <- render_certs(minimal_cert)
  expect_true(grepl("Jul 2017", out))
})

test_that("render_certs omits date div when date is NULL", {
  cert <- minimal_cert
  cert[[1]]$date <- NULL
  out <- render_certs(cert)
  expect_false(grepl("cert-date", out))
})

test_that("render_certs links name when link provided", {
  cert <- minimal_cert
  cert[[1]]$link <- "https://example.com"
  out <- render_certs(cert)
  expect_true(grepl("<a href", out, fixed = TRUE))
})

test_that("render_certs does not link name when link is NULL", {
  out <- render_certs(minimal_cert)
  expect_false(grepl("<a href", out, fixed = TRUE))
})

test_that("render_certs errors on missing required field", {
  bad <- list(list(name = "X"))   # missing issuer
  expect_error(render_certs(bad))
})

# ── render_affils ──────────────────────────────────────────────────────────────

test_that("render_affils returns a string", {
  out <- render_affils(minimal_affil)
  expect_type(out, "character")
  expect_length(out, 1L)
})

test_that("render_affils wraps each item in an li", {
  out <- render_affils(minimal_affil)
  expect_true(grepl("<li>", out, fixed = TRUE))
  expect_true(grepl("</li>", out, fixed = TRUE))
})

test_that("render_affils links org when link provided", {
  out <- render_affils(minimal_affil)
  expect_true(grepl('<a href="https://cpha.ca"', out, fixed = TRUE))
})

test_that("render_affils renders plain text when link is NULL", {
  affil <- minimal_affil
  affil[[1]]$link <- NULL
  out <- render_affils(affil)
  expect_false(grepl("<a href", out, fixed = TRUE))
  expect_true(grepl("Canadian Public Health Association", out))
})

test_that("render_affils includes em dash between org and role", {
  out <- render_affils(minimal_affil)
  expect_true(grepl("\u2014", out))
})

test_that("render_affils errors on missing required field", {
  bad <- list(list(org = "WHO"))   # missing role
  expect_error(render_affils(bad))
})

# ── render_mentorship ──────────────────────────────────────────────────────────

test_that("render_mentorship returns a string", {
  out <- render_mentorship(minimal_mentorship)
  expect_type(out, "character")
  expect_length(out, 1L)
})

test_that("render_mentorship renders event name", {
  out <- render_mentorship(minimal_mentorship)
  expect_true(grepl("UBC Datathon 2025", out))
})

test_that("render_mentorship links event when link provided", {
  out <- render_mentorship(minimal_mentorship)
  expect_true(grepl("ubcmedicinedatathon.com", out))
})

test_that("render_mentorship renders event as plain text when no link", {
  m <- list(list(event = "Some Event", date = NULL, link = NULL))
  out <- render_mentorship(m)
  expect_true(grepl("Some Event", out))
  expect_false(grepl("<a href", out, fixed = TRUE))
})

test_that("render_mentorship appends date span when date provided", {
  out <- render_mentorship(minimal_mentorship)
  expect_true(grepl("Mar 2025", out))
})

test_that("render_mentorship omits date span when date is NULL", {
  m <- list(list(event = "Datathon", date = NULL, link = NULL))
  out <- render_mentorship(m)
  expect_false(grepl("font-size:0.8em", out))
})

test_that("render_mentorship errors on missing event field", {
  bad <- list(list(date = "2025", link = NULL))
  expect_error(render_mentorship(bad))
})
