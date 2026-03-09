# Mahmoodur Rahman — Personal Portfolio

[![Tests](https://github.com/mahm00d27/mahm00d27.github.io/actions/workflows/tests.yml/badge.svg)](https://github.com/mahm00d27/mahm00d27.github.io/actions/workflows/tests.yml)
[![Build & Deploy](https://github.com/mahm00d27/mahm00d27.github.io/actions/workflows/deploy.yml/badge.svg)](https://github.com/mahm00d27/mahm00d27.github.io/actions/workflows/deploy.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Quarto](https://img.shields.io/badge/Quarto-1.5-blue)](https://quarto.org)
[![R](https://img.shields.io/badge/R-4.4-276DC3)](https://www.r-project.org)

**Live:** https://mahm00d27.github.io  
Physician · Epidemiologist · Data Scientist · Business Analyst at Stroke Services BC, PHSA — Vancouver, BC

---

## Repository health

| Check | Status |
|---|---|
| Unit & data tests | [![Tests](https://github.com/mahm00d27/mahm00d27.github.io/actions/workflows/tests.yml/badge.svg)](https://github.com/mahm00d27/mahm00d27.github.io/actions/workflows/tests.yml) |
| Build & deploy | [![Build & Deploy](https://github.com/mahm00d27/mahm00d27.github.io/actions/workflows/deploy.yml/badge.svg)](https://github.com/mahm00d27/mahm00d27.github.io/actions/workflows/deploy.yml) |

Tests run on every push and pull request — the site only renders if all tests pass.

### What is tested

**`tests/testthat/test-html-builders.R`** — unit tests for `modules/html_builders.R`
- `tags_html()`: correct span wrapping, div container, multiple tags
- `bullets_html()`: correct li wrapping, ul container, single string output
- `link_btn()`: NULL returns `""`, anchor structure, custom labels, target/class
- `affil_link()`: linked vs plain text, em-dash separator

**`tests/testthat/test-renderers.R`** — unit tests for `modules/renderers.R`
- Every renderer: returns a single string, renders required content fields
- `render_experience()`: active/inactive classes, bullet items, optional org links, multi-item
- `render_projects()`: tags, optional links, description content
- `render_publications()`: DOI links, optional link on title, empty/NULL DOI handling
- `render_edu_cards()`: optional school link, optional location, empty note omission
- `render_certs()`: optional link and date, date omission when NULL
- `render_affils()`: linked vs plain text, em-dash
- `render_mentorship()`: date span inclusion/omission, link vs plain text
- All renderers: `expect_error()` on missing required fields (input validation)

**`tests/testthat/test-data.R`** — data integrity tests for `data/portfolio_data.R`
- All required top-level objects exist (`links`, `experience`, `ph_projects`, etc.)
- Every item has its required fields (no silent NULLs)
- All URLs start with `https://`
- DOIs follow `10.xxxx/` format
- Exactly one experience entry marked `current = TRUE`
- Publications sorted newest-first by year
- No empty strings where content is required

---

## Stack

| Component | Technology | Purpose |
|---|---|---|
| Framework | Quarto 1.5 | Site rendering & publishing |
| Language | R 4.4 | Content templating |
| Modules | box 1.2 | Explicit imports, replaces `library()` |
| Reproducibility | renv 1.1 | Locked package versions |
| Testing | testthat 3 | Unit + data integrity tests |
| Hosting | GitHub Pages | Free static hosting |
| CI/CD | GitHub Actions | Tests → build → deploy on push |
| Theming | Sass/SCSS | Light + dark palettes |
| Typography | Google Fonts | Lora · Inter · JetBrains Mono |

## Project structure

```
mahm00d27.github.io/
├── DESCRIPTION              # Package metadata (required by testthat)
├── data/
│   └── portfolio_data.R     # Single source of truth for all content
├── modules/
│   ├── html_builders.R      # Low-level HTML helpers (tags, links, bullets)
│   └── renderers.R          # Section-level HTML renderers
├── R/
│   └── load.R               # Entry point — loads data + box modules
├── tests/
│   └── testthat/
│       ├── test-html-builders.R
│       ├── test-renderers.R
│       └── test-data.R
├── analysis/                # Reserved for future analytical scripts
├── assets/                  # SCSS themes, CSS, head.html
├── cv/                      # Resume PDF (mahmoodur_resume.pdf)
├── index.qmd                # Main page
├── _quarto.yml              # Site configuration
├── renv.lock                # Locked R package versions
└── .github/workflows/
    ├── tests.yml            # Runs on every push & PR
    └── deploy.yml           # Runs tests → renders → deploys
```

## Local dev

```r
# Install renv then restore all packages
install.packages("renv")
renv::restore()

# Run tests
options(box.path = getwd())
testthat::test_dir("tests/testthat")

# Preview site
quarto preview
```

## Deploy

```bash
git push   # tests run → if passing, site renders and deploys automatically
```

## License

MIT © 2026 Mahmoodur Rahman
