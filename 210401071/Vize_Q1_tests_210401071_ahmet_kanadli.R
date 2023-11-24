if (!require(testthat)) {
  install.packages("testthat")
  library(testthat)
}

# Global Workspace'i temizle
rm(list = ls())



current_dir <- getwd()
print(current_dir)
relative_path <- file.path(current_dir, "Vize_Q1_210401071_ahmet_kanadli.R")

source(relative_path)



test_that("Global Workspace’de spotify_token adlı bir değişken olmalı", {
  expect_true(exists("spotify_token"))
})
