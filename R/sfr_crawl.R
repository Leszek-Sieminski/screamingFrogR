#' Title
#'
#' @param url
#' @param output_folder
#' @param timestamped_output
#' @param format
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
#' @importFrom glue glue
#'
#' @examples
sfr_crawl <- function(
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
  create_sitemap            = NULL,
  create_images_sitemap     = NULL,
  use_majestic              = NULL,
  use_mozscape              = NULL,
  use_ahrefs                = NULL,
  use_google_analytics      = NULL,
  use_google_search_console = NULL
) {
  # safety net ----------------------------------------------------------------


  # building command ----------------------------------------------------------
  command <- sfr_command(
    url                       = url,
    output_folder             = output_folder,
    timestamped_output        = timestamped_output,
    format                    = format,
    save_crawl_file           = save_crawl_file,
    export_tabs               = export_tabs,
    export_bulk               = export_bulk,
    export_report             = export_report,
    overwrite                 = overwrite,
    headless                  = headless,
    config                    = config,
    create_sitemap            = create_sitemap,
    create_images_sitemap     = create_images_sitemap,
    use_majestic              = use_majestic,
    use_mozscape              = use_mozscape,
    use_ahrefs                = use_ahrefs,
    use_google_analytics      = use_google_analytics,
    use_google_search_console = use_google_search_console)

  # execution -----------------------------------------------------------------
  # command <- glue(
  #   'cd {Sys.getenv("S_FROG_PATH")}
  # ScreamingFrogSEOSpiderCli.exe --crawl {url} --headless --output-folder {output}')


  if (grepl("Windows", Sys.info()['sysname'])) {
    system2("cmd", input = command)
  } else {
    system(command)
  }



}

# --crawl <url>
#   Start crawling the supplied URL
#
# --crawl-list <list file>
#   Start crawling the specified URLs in list mode
#
# --config <config>
#   Supply a config file for the spider to use
#
# --use-majestic
# Use Majestic API during crawl
#
# --use-mozscape
# Use Mozscape API during crawl
#
# --use-ahrefs
# Use Ahrefs API during crawl
#
# --use-google-analytics <google account> <account> <property> <view> <segment>
#   Use Google Analytics API during crawl
#
# --use-google-search-console <google account> <website>
#   Use Google Search Console API during crawl
#
# --headless
# Run in silent mode without a user interface
#
# --output-folder <output>
#   Where to store saved files. Default: current working directory
#
# --export-format <csv|xls|xlsx>
#   Supply a format to be used for all exports
#
# --overwrite
# Overwrite files in output directory
#
# --timestamped-output
# Create a timestamped folder in the output directory, and store
# all output there
#
# --save-crawl
# Save the completed crawl
#
# --export-tabs <tab:filter,...>
#   Supply a comma separated list of tabs to export. You need to
# specify the tab name and the filter name separated by a colon
#
# --bulk-export <[submenu:]export,...>
#   Supply a comma separated list of bulk exports to perform. The
# export names are the same as in the Bulk Export menu in the UI.
# To access exports in a submenu, use <submenu-name:export-name>
#
#   --save-report <[submenu:]report,...>
#   Supply a comma separated list of reports to save. The report
# names are the same as in the Report menu in the UI. To access
# reports in a submenu, use <submenu-name:report-name>
#
#   --create-sitemap
# Creates a sitemap from the completed crawl
#
# --create-images-sitemap
# Creates an images sitemap from the completed crawl
#
# -h, --help
# Print this message and exit
