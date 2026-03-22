# run this after `generate-roctet.py` to convert csv to rda
library(readr)
library(usethis)

auroc_quartet <- readr::read_csv('data-raw/auroc-quartet.csv')
usethis::use_data(auroc_quartet, overwrite = TRUE)
