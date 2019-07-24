#' Load all exported reports, bulk exports or tabs into enviroment as
#'     properly named data frames
#'
#' @param output_path character string. The folder path of directory
#'    that contains exported spreadsheets
#'
#' @return data frames from all the spreadsheet files.
#' @export
#'
#' @importFrom data.table fread
#' @importFrom readxl read_excel
#'
#' @examples
sfr_load_all_reports <- function(output_path) {

  # csv -----------------------------------------------------------------------
  filenames <- list.files(path = output_path, pattern=".*csv")
  names <- gsub(".csv", "", filenames, fixed = TRUE)
  for (name in names){
    filepath <- file.path(paste(output_path, "/", name, ".csv", sep = ""))
    assign(name, fread(filepath, sep = ",", header = TRUE, skip = 1))
  }

  # xls -----------------------------------------------------------------------
  filenames <- list.files(path = output_path, pattern=".*xls")
  names <- gsub(".xls", "", filenames, fixed = TRUE)
  for (name in names){
    filepath <- file.path(paste(output_path, "/", name, ".xls", sep = ""))
    assign(name, read_excel(filepath, col_names = TRUE, skip = 1))
  }

  # xlsx ----------------------------------------------------------------------
  filenames <- list.files(path = output_path, pattern=".*xlsx")
  names <- gsub(".xlsx", "", filenames, fixed = TRUE)
  for (name in names){
    filepath <- file.path(paste(output_path, "/", name, ".xlsx", sep = ""))
    assign(name, read_excel(filepath, col_names = TRUE, skip = 1))
  }

}
