library(tidyverse)

rashomon_quartet_train <- read_delim("data-raw/rashomon-quartet-train.csv",
                                     delim = ";")
rashomon_quartet_test <- read_delim("data-raw/rashomon-quartet-test.csv",
                                    delim = ";")

usethis::use_data(rashomon_quartet_train, overwrite = TRUE)
usethis::use_data(rashomon_quartet_test, overwrite = TRUE)

rashomon_quartet <- bind_rows(
  rashomon_quartet_train,
  rashomon_quartet_test,
  .id = "split"
) |>
  mutate(split = ifelse(split == 1, "train", "test")) |>
  select(split, x1:x3, y)

usethis::use_data(rashomon_quartet, overwrite = TRUE)
