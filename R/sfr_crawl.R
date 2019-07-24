#' Run a SEO crawl with Screaming Frog SEO Crawler and choose what to export
#'
#' @description Function is a wrapper to Screaming Frog CLI program in
#'     versions 10+. It lets performing SEO crawl and exporting results.
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
#' @param save_crawl_file logical. Should the crawl file be saved? Defaults to FALSE
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
#' @details This package requires Screaming Frog version 10.0 or above.
#'
#'    Crawler requires accepting the EULA and some features need to be
#'    activated by providing the license.
#'
#'    For more information, see:
#'    https://www.screamingfrog.co.uk/seo-spider/user-guide/general/
#'
#' @import assertthat
#'
#' @return spreadsheet files in choosen directory with the reports and/or the
#'    crawl file itself
#' @export
#'
#' @examples
sfr_crawl <- function(
  url,
  output_folder             = NULL,
  timestamped_output        = FALSE,
  export_tabs               = NULL,
  export_bulk               = NULL,
  export_report             = NULL,
  format                    = "csv",
  save_crawl_file           = FALSE,
  overwrite                 = FALSE,
  headless                  = TRUE,
  create_sitemap            = FALSE,
  create_images_sitemap     = FALSE,
  config                    = NULL,
  use_majestic              = NULL,
  use_mozscape              = NULL,
  use_ahrefs                = NULL,
  use_google_analytics      = NULL,
  use_google_search_console = NULL
) {
  # safety net ----------------------------------------------------------------
  assert_that(
    is.character(url) & not_empty(url) & !is.null(url) & noNA(url),
    is.null(output_folder) || is.string(output_folder),
    is.logical(timestamped_output) & noNA(timestamped_output),
    (is.null(export_tabs)   || is.character(export_tabs)), # not_empty(export_tabs),
    (is.null(export_bulk)   || is.character(export_bulk)),# & not_empty(export_bulk),
    (is.null(export_report) || is.character(export_report)), # & not_empty(export_report),
    not_empty(url) & !is.null(url) & noNA(url) &
      format %in% c("csv", "xlsx", "xls"),
    is.logical(save_crawl_file) & noNA(save_crawl_file),
    is.logical(overwrite) & noNA(overwrite),
    is.logical(headless) & noNA(headless),
    is.logical(create_sitemap) & noNA(create_sitemap),
    is.logical(create_images_sitemap) & noNA(create_images_sitemap),
    is.null(config) || is.string(config)
    # use_majestic
    # use_mozscape
    # use_ahrefs
    # use_google_analytics
    # use_google_search_console
  )

  # building command ----------------------------------------------------------
  command <- sfr_command(url = url, output_folder = output_folder,
    timestamped_output = timestamped_output, format = format,
    save_crawl_file = save_crawl_file, export_tabs = export_tabs,
    export_bulk = export_bulk, export_report = export_report,
    overwrite = overwrite, headless = headless, config = config,
    create_sitemap = create_sitemap, create_images_sitemap = create_images_sitemap
    # use_majestic = use_majestic, use_mozscape = use_mozscape,
    # use_ahrefs = use_ahrefs, use_google_analytics = use_google_analytics,
    # use_google_search_console = use_google_search_console
  )

  # execution -----------------------------------------------------------------
  if (grepl("Windows", Sys.info()['sysname'])) {
    system2("cmd", input = command)
  } else {
    system(command)
  }
}

