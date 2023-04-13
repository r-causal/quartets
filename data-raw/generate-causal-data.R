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

set.seed(93)

causal_confounding_time <- tibble(
  covariate_prebaseline = rnorm(n),
  covariate_baseline = covariate_prebaseline + rnorm(n),
  exposure_baseline = covariate_prebaseline + rnorm(n),
  outcome_baseline = covariate_prebaseline + rnorm(n),
  covariate_followup = covariate_baseline + rnorm(n),
  exposure_followup = exposure_baseline + covariate_baseline + rnorm(n),
  outcome_followup = 0.5 * exposure_baseline + covariate_baseline + rnorm(n),
) |>
  select(-covariate_prebaseline)

usethis::use_data(causal_confounding_time, overwrite = TRUE)

set.seed(1023780)
causal_collider_time <- tibble(
  exposure_prebaseline = rnorm(n, sd = sqrt(1/2)),
  outcome_prebaseline = exposure_prebaseline + rnorm(n),
  exposure_baseline = exposure_prebaseline + rnorm(n, sd = sqrt(1/2)),
  outcome_baseline = exposure_prebaseline + rnorm(n),
  covariate_baseline = 0.45 * exposure_prebaseline + 0.77 * outcome_baseline + rnorm(n),
  exposure_followup = exposure_baseline + rnorm(n),
  outcome_followup = exposure_baseline + rnorm(n),
  covariate_followup = 0.45 * exposure_baseline + 0.77 * outcome_followup + rnorm(n)
) |>
  select(-exposure_prebaseline, -outcome_prebaseline)

usethis::use_data(causal_collider_time, overwrite = TRUE)

set.seed(8734)
causal_mediator_time <- tibble(
  exposure_baseline = rnorm(n),
  covariate_baseline = rnorm(n),
  outcome_baseline = rnorm(n),
  exposure_mid = exposure_baseline + rnorm(n),
  covariate_mid = exposure_baseline + rnorm(n),
  outcome_mid = covariate_baseline + rnorm(n),
  exposure_followup = exposure_mid + rnorm(n),
  covariate_followup = exposure_mid + rnorm(n),
  outcome_followup = covariate_mid + rnorm(n)
)

usethis::use_data(causal_mediator_time, overwrite = TRUE)

set.seed(68392)
causal_m_bias_time <- tibble(
  u1 = rnorm(n),
  u2 = rnorm(n),
  exposure_prebaseline = u1 + rnorm(n),
  covariate_prebaseline = 8 * u1 + u2 + rnorm(n),
  exposure_baseline = exposure_prebaseline + u1 + rnorm(n),
  outcome_baseline = exposure_prebaseline + rnorm(n),
  covariate_baseline = covariate_prebaseline + 8 * u1 + u2 + rnorm(n),
  outcome_followup = exposure_baseline + u2 + rnorm(n),
  exposure_followup = exposure_baseline + u1 + rnorm(n),
  covariate_followup = covariate_baseline + 8 * u1 + u2 + rnorm(n)
) |>
  select(-exposure_prebaseline, -covariate_prebaseline)

usethis::use_data(causal_m_bias_time, overwrite = TRUE)


causal_quartet_time <- bind_rows(causal_confounding_time,
                                 causal_collider_time,
                                 causal_mediator_time,
                                 causal_m_bias_time) %>%
  mutate(dataset = rep(c("(2) Confounder",
                         "(1) Collider",
                         "(3) Mediator",
                         "(4) M-Bias"), each = 100)) |>
  arrange(dataset)

usethis::use_data(causal_quartet_time, overwrite = TRUE)
