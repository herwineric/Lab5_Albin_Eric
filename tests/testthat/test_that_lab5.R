
test_that("outputs are correct in the data_address function", {
  testa <- data_address("Totebo")
  
  expect_output(print(testa),"590 92 Totebo")
  expect_output(print(testa),"57.62")
  expect_output(print(testa),"16.18")
})

test_that("outputs are correct in the plot_address function", {
  testa <- plot_address("Totebo",14)
  expect_output(print(testa),NULL)
})


test_that("data_address and plot_address seems to work", {
  expect_error(data_address("den_har_adressen_finns_ej"))
  expect_error(data_address(10))
  
  expect_error(plot_address("den_har_adressen_finns_ej"))
  expect_error(plot_address(zoom = 10))
  expect_error(plot_address("den_har_adressen_finns_ej",10))
})



test_that("class of data_address is correct", {
  
  expect_true(class(data_address("Totebo")) == "data.frame")
})