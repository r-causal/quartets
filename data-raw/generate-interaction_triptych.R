library(tidyverse)
## Generated from code provided here: https://osf.io/h9psd

n <- 900
set.seed(20191005)
assumed <-  tibble(
  m = sample(0:2, n, replace = TRUE),
  moderator = factor(m, 0:2, c("low", "medium", "high")),
  x = 0.8 * (m-1) + rnorm(n, sd = 0.77),
  residual = rnorm(n),
  y = -0.66 + 0.1 * x + 0.5 * m + 0.3 * x * m + 0.69 * residual
)

floor <-  assumed %>%
  mutate(
    y = -1.1 + 0.68 * x + 0.8 * m + 0.95 * residual,
    y = -0.66 + if_else(y < -0.7, -0.7, y) + 0.52
  )

residual <-  assumed %>%
  mutate(
    y = -0.66 + 0.1 * x + 0.5 * m + 0.3 * x * m +
      0.49 * ((exp(m) / 3 - 0.2)) * residual
  )

interaction_triptych <- bind_rows(
  assumed,
  floor,
  residual,
  .id = "case"
) %>%
  mutate(
    dataset = case_when(
    case == 1 ~ "(1) Ideal case",
    case == 2 ~ "(2) Floor effect, no latent interaction",
    case == 3 ~ "(3) Smaller correlation at largest slope"
  )) %>%
  select(dataset, moderator, x, y) %>%
  arrange(moderator)

usethis::use_data(interaction_triptych, overwrite = TRUE)

