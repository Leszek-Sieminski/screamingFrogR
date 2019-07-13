#' Function to setup the Screaming Frog on Windows systems
#'
#' @param path the path to the folder of Screaming Frog. Usually similar to
#'    'C:/Program Files/Screaming Frog SEO Spider/'.
#'
#' @return invisibly adds the folder to enviromental variable
#' @export
#'
#' @import assertthat
#'
#' @examples
sfr_setup_windows <- function(path) {
  # safety net ----------------------------------------------------------------
  assert_that(is.string(path), not_empty(path), noNA(path))

  # system --------------------------------------------------------------------
  if (grepl("Windows", Sys.info()['sysname'])) {
    # conditions of a proper folder path
    folder_exist <- dir.exists(path)
    contains_cli <- file.exists(paste0(path, "ScreamingFrogSEOSpiderCli.exe"))

    # execution
    if (folder_exist & contains_cli) {
      # setting up the env var for later use
      Sys.setenv("S_FROG_PATH" = paste0(path))
      return(message("Screaming Frog CLI properly setup!"))
    } else {
      # returning an error if folder is bad -------------------------------------
      stop("The path you provided doesn't exist OR doesn't contain ScreamingFrogSEOSpiderCli.exe file")
    }
  } else {
    warning("This function is intended for Windows setup only. Nothing is changed")
  }
}
