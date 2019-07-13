#' Title
#'
#' @param url
#' @param output_folder
#' @param timestamped_output
#' @param format
#' @param save_crawl_file
#' @param export_tabs
#' @param export_bulk
#' @param export_report
#' @param overwrite
#' @param headless
#' @param config
#' @param create_sitemap
#' @param create_images_sitemap
#' @param use_majestic
#' @param use_mozscape
#' @param use_ahrefs
#' @param use_google_analytics
#' @param use_google_search_console
#'
#' @return
#' @export
#'
#' @examples
sfr_command <- function(
  url,
  output_folder             = NULL,
  timestamped_output        = NULL,
  format                    = "csv", # "csv" "xls" "xlsx"
  save_crawl_file           = TRUE,
  export_tabs               = NULL,
  export_bulk               = NULL,
  export_report             = NULL,
  overwrite                 = TRUE,
  headless                  = TRUE,
  config                    = NULL,
  create_sitemap            = FALSE,
  create_images_sitemap     = FALSE,
  use_majestic              = NULL,
  use_mozscape              = NULL,
  use_ahrefs                = NULL,
  use_google_analytics      = NULL,
  use_google_search_console = NULL)
{
  # commands preparation ------------------------------------------------------
  c <- list()


  # commands preparation: url -------------------------------------------------
  if (length(url) > 1) {
    c$crawl_com <- glue("--crawl-list {paste(url, collapse = ' ')}")
  } else {
    c$crawl_com <- glue("--crawl {url}")
  }


  # commands preparation: output folder ---------------------------------------
  if (!is.null(output_folder)) {
    c$output_folder_com <- glue("--output-folder {output_folder}")
  } else {
    output_folder <- paste0(getwd(), "/")
    c$output_folder_com <- glue("--output-folder {output_folder}")
  }


  # commands preparation: timestamped_output ----------------------------------
  if (timestamped_output) {
    c$timestamped_output_com <- "--timestamped-output"
  } else {
    c$timestamped_output_com <- NULL
  }


  # commands preparation: format ----------------------------------------------
  if (!is.null(format)) {
    c$format_com <- glue("--export-format {format}")
  } else {
    c$format_com <- NULL
  }


  # commands preparation: save_crawl_file -------------------------------------
  if (save_crawl_file) {
    c$save_crawl_file_com <- "--save-crawl"
  } else {
    c$save_crawl_file_com <- NULL
  }


  # commands preparation: export_tabs -----------------------------------------
  if (!is.null(export_tabs)) {
    c$export_tabs_com <- "--export-tabs '{paste(export_tabs, collapse = ',')}'"
  } else {
    c$export_tabs_com <- NULL
  }


  # commands preparation: export_bulk -----------------------------------------
  if (!is.null(export_bulk)) {
    c$export_bulk_com <- "--bulk-export '{paste(export_bulk, collapse = ',')}'"
  } else {
    c$export_bulk_com <- NULL
  }

  # commands preparation: export_report ---------------------------------------
  if (!is.null(export_report)) {
    c$export_report_com <- "--save-report '{paste(export_report, collapse = ',')}'"
  } else {
    c$export_report_com <- NULL
  }

  # commands preparation: overwrite -------------------------------------------
  if (overwrite) {
    c$overwrite_com <- "--overwrite"
  } else {
    c$overwrite_com <- NULL
  }

  # commands preparation: headless --------------------------------------------
  if (headless) {
    c$headless_com <- "--headless"
  } else {
    c$headless_com <- NULL
  }

  # commands preparation: config ----------------------------------------------
  if (!is.null(config)) {
    c$config_com <- glue("--config {config}")
  } else {
    c$config_com <- NULL
  }

  # commands preparation: create_sitemap --------------------------------------
  if (!is.null(create_sitemap)) {
    c$create_sitemap_com <- "--create-sitemap"
  } else {
    c$create_sitemap_com <- NULL
  }

  # commands preparation: create_images_sitemap -------------------------------
  if (!is.null(create_images_sitemap)) {
    c$create_images_sitemap_com <- "--create-images-sitemap"
  } else {
    c$create_images_sitemap_com <- NULL
  }

  # commands preparation: use_majestic ----------------------------------------
  # ?

  # commands preparation: use_mozscape ----------------------------------------
  # ?

  # commands preparation: use_ahrefs ------------------------------------------
  # ?

  # commands preparation: use_google_analytics --------------------------------
  # ?

  # commands preparation: use_google_search_console ---------------------------
  # ?

  # commands joining ----------------------------------------------------------
  x <- paste(unlist(c), collapse = " ")


  # return --------------------------------------------------------------------
  return(x)
}
