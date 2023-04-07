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

set.seed(44)

causal_confounding_time <- tibble(
  covariate_baseline = causal_confounding$covariate,
  exposure_index = causal_confounding$exposure,
  outcome_index = causal_confounding$outcome,
  covariate_index = covariate_baseline + rnorm(n),
  exposure_followup = exposure_index + covariate_index + rnorm(n),
  outcome_followup = 0.5 * exposure_index + covariate_index + rnorm(n),
  covariate_followup = covariate_index + rnorm(n),
)

usethis::use_data(causal_confounding_time, overwrite = TRUE)

set.seed(45652)
causal_collider_time <- tibble(
  exposure_prebaseline = rnorm(n, sd = sqrt(1/3)),
  outcome_prebaseline = exposure_prebaseline + rnorm(n),
  exposure_baseline = exposure_prebaseline + rnorm(n, sd = sqrt(1/3)),
  outcome_baseline = exposure_prebaseline + rnorm(n),
  covariate_baseline = 0.45 * exposure_prebaseline + 0.77 * outcome_baseline + rnorm(n),
  exposure_index = exposure_baseline + rnorm(n, sd = sqrt(1/3)),
  outcome_index = exposure_baseline + rnorm(n),
  covariate_index = 0.45 * exposure_baseline + 0.77 * outcome_index + rnorm(n),
  exposure_followup = exposure_index + rnorm(n),
  outcome_followup = exposure_index + rnorm(n),
  covariate_followup = 0.45 * exposure_index + 0.77 * outcome_followup + rnorm(n)
) |>
  select(-exposure_prebaseline, -outcome_prebaseline,
         -exposure_baseline, -outcome_baseline)

usethis::use_data(causal_collider_time, overwrite = TRUE)

set.seed(35396)
causal_mediator_time <- tibble(
  exposure_baseline = rnorm(n, sd = sqrt(1/2)),
  covariate_baseline = exposure_baseline + rnorm(n),
  exposure_index = exposure_baseline + rnorm(n, sd = sqrt(1/2)),
  covariate_index = exposure_index + rnorm(n),
  outcome_index = covariate_baseline + rnorm(n),
  exposure_followup = exposure_index + rnorm(n),
  covariate_followup = exposure_followup + rnorm(n),
  outcome_followup = covariate_index + rnorm(n)
) |>
  select(-exposure_baseline)

usethis::use_data(causal_mediator_time, overwrite = TRUE)

set.seed(7457)
causal_m_bias_time <- tibble(
  u1 = rnorm(n),
  u2 = rnorm(n),
  exposure_baseline = u1 + rnorm(n),
  covariate_baseline = 8 * u1 + u2 + rnorm(n),
  exposure_index = u1 + rnorm(n),
  outcome_index = exposure_baseline + rnorm(n),
  covariate_index = 8 * u1 + u2 + rnorm(n),
  outcome_followup = exposure_index + u2 + rnorm(n),
  exposure_followup = u1 + rnorm(n),
  covariate_followup = 8 * u1 + u2 + rnorm(n)
) |>
  select(-exposure_baseline)

usethis::use_data(causal_m_bias_time, overwrite = TRUE)

