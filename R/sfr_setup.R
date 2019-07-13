#' Title
#'
#' @param path
#'
#' @return
#' @export
#'
#' @import assertthat
#'
#' @examples
sfr_setup <- function(path) {
  # safety net ----------------------------------------------------------------
  assert_that(is.string(path), not_empty(path), noNA(path))

  # conditions of a proper folder path ----------------------------------------
  folder_exist <- dir.exists(path)
  contains_cli <- file.exists(paste0(path, "ScreamingFrogSEOSpiderCli.exe"))

  # execution -----------------------------------------------------------------
  if (folder_exist & contains_cli){
    # setting up the env var for later use ------------------------------------
    Sys.setenv("S_FROG_PATH" = paste0(path))
    return(message("Screaming Frog CLI properly setup!"))
  } else {
    # returning an error if folder is bad -------------------------------------
    stop("The path you provided doesn't exist OR doesn't contain ScreamingFrogSEOSpiderCli.exe file, check it")
  }
}
