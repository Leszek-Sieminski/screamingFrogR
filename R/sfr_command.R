#' Create the command to Screaming Frog CLI for execution
#'
#' @param url string or vector of strings. What should Screaming Frog crawl
#'     Single URL will trigger domain-crawl mode (starting from the provided
#'     URL); vector of URLs will trigger list-crawl mode - only provided URLs
#'     will be crawled
#' @param output_folder string. The path to folder in which the output reports
#'     will be stored. If NULL it will create the reports into current working
#'     directory. Defaults to NULL
#' @param timestamped_output logical. Should the output be created in a
#'     timestamped folder in the output folder? Defaults to FALSE
#' @param export_tabs vector of strings. Supply a character vector of tabs and
#'     filters to export. You need to specify the tab name and the filter name
#'     based on the names in the Screaming Frog GUI: c(tab:filter, ...).
#'     Example: c("Internal:All", "External:All"). Defaults to NULL
#' @param export_bulk vector of strings. Supply character vector of bulk
#'    exports to perform. The export names are the same as in the Bulk Export
#'    menu in the UI. To access exports in a submenu, use
#'    c(submenu-name:export-name).
#'    Example: c("All Inlinks", "Directives:Index Inlinks"). Defaults to
#'    NULL
#' @param export_report vector of strings. Supply a character vector of
#'    reports to save. The report names are the same as in the Report menu in
#'    the UI. To access reports in a submenu, use c(submenu-name:report-name)
#'    Example: c("Crawl Overview", "Hreflang:All hreflang URLs"). Defaults to
#'    NULL
#' @param format string. Supply a format to be used for all exports. Available
#'     options are "csv", "xls" and "xlsx". Defaults to "csv". IMPORTANT:
#'     it only affects exported tabs, bulk exports and reports, so if you
#'     decide to save the crawl file, it will not be affected
#' @param save_crawl_file logical. Should the files in output directory be
#'     overwritten? Defaults to FALSE
#' @param overwrite logical. Should the files in the output folder be
#'     overwritten? Defaults to FALSE
#' @param headless logical. Should the crawler be run in silent mode without a
#'     new window with a user interface? Defaults to TRUE
#' @param create_sitemap logical. Should the crawler create a sitemap from the
#'     completed crawl? Defaults to FALSE
#' @param create_images_sitemap logical. Should the crareate an images sitemap
#'     from the completed crawl? Defaults to FALSE
#' @param config string. Supply a path to config file for the spider to use.
#'     If NULL, crawler will use the default configuration. Defaults to NULL
#' @param use_majestic ??? Use Majestic API during crawl
#' @param use_mozscape ??? Use Mozscape API during crawl
#' @param use_ahrefs ??? Use Ahrefs API during crawl
#' @param use_google_analytics ??? Use Google Analytics API during crawl
#' @param use_google_search_console ??? Use Google Search Console API during
#'    crawl
#'
#' @return a character string that contains the command for SF CLI
#'
#' @importFrom glue glue
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

  if (grepl("Windows", Sys.info()['sysname'])) {
  #   c$file_com <- "cd E:/Programy/Screaming Frog SEO Spider/
  # ScreamingFrogSEOSpiderCli.exe "
    c$file_com <- paste0("cd ", Sys.getenv("S_FROG_PATH"), "\n",
                         " ScreamingFrogSEOSpiderCli.exe ")
  } else {
    c$file_com <- "unset DISPLAY; screamingfrogseospider "
  }


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
    c$export_tabs_com <- glue("--export-tabs {paste(export_tabs, collapse = ',')}")
  } else {
    c$export_tabs_com <- NULL
  }


  # commands preparation: export_bulk -----------------------------------------
  if (!is.null(export_bulk)) {
    c$export_bulk_com <- glue("--bulk-export {paste(export_bulk, collapse = ',')}")
  } else {
    c$export_bulk_com <- NULL
  }

  # commands preparation: export_report ---------------------------------------
  if (!is.null(export_report)) {
    c$export_report_com <- glue("--save-report {paste(export_report, collapse = ',')}")
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
  if (create_sitemap) {
    c$create_sitemap_com <- "--create-sitemap"
  } else {
    c$create_sitemap_com <- NULL
  }

  # commands preparation: create_images_sitemap -------------------------------
  if (create_images_sitemap) {
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
