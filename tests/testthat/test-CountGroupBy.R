test_that("Testing count_group_by function with dataset building_permits", {
  expect_equal(count_group_by(datateachr::building_permits, "type_of_work", "New Building"), datateachr::building_permits %>% tidyr::drop_na(type_of_work) %>% dplyr::group_by(type_of_work) %>% dplyr::count() %>% dplyr::filter(type_of_work == "New Building"))
  expect_equal(count_group_by(datateachr::building_permits, "issue_date", as.Date("2017-02-04", format = "%Y-%m-%d")), datateachr::building_permits %>% tidyr::drop_na(issue_date) %>% dplyr::group_by(issue_date) %>% dplyr::count() %>% dplyr::filter(issue_date == as.Date("2017-02-04", format = "%Y-%m-%d")))
  expect_equal(count_group_by(datateachr::building_permits, "project_value", 0), datateachr::building_permits %>% tidyr::drop_na(project_value) %>% dplyr::group_by(project_value) %>% dplyr::count() %>% dplyr::filter(project_value == 0))

  expect_error(count_group_by(datateachr::building_permits, "address", NA), "choose_value should not be NA.")
  expect_error(count_group_by(datateachr::building_permits, "permit_number", NA), "choose_value should not be NA.")
  expect_error(count_group_by(datateachr::building_permits, 21, "Addition / Alteration"), "group_by_column must be a string.")
})
