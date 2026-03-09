local({
  the <- new.env(parent = emptyenv())

  `%||%` <- function(x, y) if (is.null(x)) y else x

  renv_path <- Sys.getenv("RENV_PATH", unset = NA)
  if (!is.na(renv_path)) {
    if (file.exists(renv_path)) {
      library(renv, lib.loc = renv_path)
      renv::load()
      return(invisible(NULL))
    }
  }

  lockfile <- file.path(getwd(), "renv.lock")
  if (!file.exists(lockfile)) return(invisible(NULL))

  renv_version <- tryCatch({
    lock <- jsonlite::read_json(lockfile)
    lock$Packages$renv$Version
  }, error = function(e) NULL)

  if (is.null(renv_version)) return(invisible(NULL))

  paths <- c(
    Sys.getenv("RENV_PATHS_ROOT", unset = NA),
    file.path(getwd(), "renv", "library"),
    file.path(Sys.getenv("HOME"), ".renv", "library")
  )
  paths <- paths[!is.na(paths)]

  for (path in paths) {
    lib <- file.path(path, paste(R.version$platform, getRversion()[, 1:2], sep = "/"), "renv")
    if (file.exists(lib)) {
      library(renv, lib.loc = dirname(lib))
      renv::load()
      return(invisible(NULL))
    }
  }

  message("renv: bootstrap required - run renv::restore() to install packages")
  invisible(NULL)
})
