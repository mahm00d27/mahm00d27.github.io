# R/load.R
# Entry point for the portfolio site.
# Loads all data and box modules needed by index.qmd.

# ── Data ──────────────────────────────────────────────────────────────────────
source(here::here("data", "portfolio_data.R"))

# ── Modules ───────────────────────────────────────────────────────────────────
box::use(
  modules/renderers[
    render_experience,
    render_projects,
    render_publications,
    render_edu_cards,
    render_certs,
    render_affils,
    render_mentorship
  ]
)
