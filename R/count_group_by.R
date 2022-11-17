#' @title Count Group By
#' @description `count_group_by` returns the number of the value choose_value in the column group_by_column of the data set dataset
#' @param dataset the data set that we choose to use
#' @param group_by_column the column that we choose to apply group_by function on
#' @param choose_value the value that we want to count
#' @return A 1 x 2 tibble with value "choose_value" in column "group_by_column" and the count number n of this value
#' @examples
#' library(dplyr)
#' library(datateachr)
#' library(tidyr)
#' count_group_by(building_permits, "issue_date", as.Date("2017-02-02", format = "%Y-%m-%d"))
#' count_group_by(building_permits, "type_of_work", "New Building")
#' @export

count_group_by <- function(dataset, group_by_column, choose_value) {
  if (!is.character(group_by_column)) {
    stop("group_by_column must be a string.")
  }
  if (is.na(choose_value)) {
    stop("choose_value should not be NA.")
  }
  return(dataset %>%
           tidyr::drop_na(group_by_column) %>%
           dplyr::group_by(.data[[group_by_column]]) %>%
           dplyr::count() %>%
           dplyr::filter(.data[[group_by_column]] == choose_value))
}
