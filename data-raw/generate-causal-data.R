n <- 100
library(tidyverse)
set.seed(1331)

causal_confounding <- tibble(
  z = rnorm(n),
  x = z + rnorm(n),
  y = 0.5 * x + z + rnorm(n)
)

usethis::use_data(causal_confounding, overwrite = TRUE)

set.seed(472046)

causal_collider <- tibble(
  x = rnorm(n),
  y = x + rnorm(n),
  z = 0.45 * x + 0.77 * y + rnorm(n)
)

usethis::use_data(causal_collider, overwrite = TRUE)


set.seed(207052)

causal_mediator <- tibble(
  x = rnorm(n),
  z = x + rnorm(n),
  y = z + rnorm(n)
)

usethis::use_data(causal_mediator, overwrite = TRUE)


set.seed(839)

causal_m_bias <- tibble(
  u1 = rnorm(n),
  u2 = rnorm(n),
  z = 8 * u1 + u2 + rnorm(n),
  x = u1 + rnorm(n, sd = 1),
  y =  x + u2 + rnorm(n, sd = 1)
)

usethis::use_data(causal_m_bias, overwrite = TRUE)

causal_quartet <- bind_rows(causal_confounding,
                            causal_collider,
                            causal_mediator,
                            causal_m_bias) %>%
  mutate(dataset = rep(c("(2) Confounder",
                      "(1) Collider",
                      "(3) Mediator",
                      "(4) M-Bias"), each = 100)) |>
  arrange(dataset) |>
  select(dataset, x, y, z, u1, u2)

usethis::use_data(causal_quartet, overwrite = TRUE)
