#test1
test_that("average of row gives the same output", {
  abc <- Multiserver(Arrivals = 23, ServiceTimes = 20)
  rm = rowMeans(abc)
  expect_equal(rm , 22.5)
})

#test2
test_that("when errors matched the description",{
  expect_error(Multiserver(Arrivals = -1, ServiceTimes = 0), "Arrivals, ServiceTimes must be positive & NumServers must be positive")
  })
