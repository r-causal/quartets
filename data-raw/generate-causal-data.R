n <- 100
library(tidyverse)
set.seed(1331)

causal_confounding <- tibble(
  covariate = rnorm(n),
  exposure = covariate + rnorm(n),
  outcome = 0.5 * exposure + covariate + rnorm(n)
)

usethis::use_data(causal_confounding, overwrite = TRUE)

set.seed(472046)

causal_collider <- tibble(
  exposure = rnorm(n),
  outcome = exposure + rnorm(n),
  covariate = 0.45 * exposure + 0.77 * outcome + rnorm(n)
)

usethis::use_data(causal_collider, overwrite = TRUE)


set.seed(207052)

causal_mediator <- tibble(
  exposure = rnorm(n),
  covariate = exposure + rnorm(n),
  outcome = covariate + rnorm(n)
)

usethis::use_data(causal_mediator, overwrite = TRUE)


set.seed(839)

causal_m_bias <- tibble(
  u1 = rnorm(n),
  u2 = rnorm(n),
  covariate = 8 * u1 + u2 + rnorm(n),
  exposure = u1 + rnorm(n, sd = 1),
  outcome =  exposure + u2 + rnorm(n, sd = 1)
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
  select(dataset, exposure, outcome, covariate, u1, u2)

usethis::use_data(causal_quartet, overwrite = TRUE)
