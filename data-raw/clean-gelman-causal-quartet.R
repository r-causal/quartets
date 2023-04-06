library(tidyverse)
library(causalQuartet)

variation_conceptual_causal_quartet <- quartet1 |>
  select(-y) |>
  pivot_longer(a:d) |>
  select(dataset = name, z = x, causal_effect = value) |>
  mutate(dataset = case_when(
    dataset == "a" ~ "(1) Constant effect",
    dataset == "b" ~ "(2) Low variation",
    dataset == "c" ~ "(3) High variation",
    dataset == "d" ~ "(4) Occasional large effects"
  ))

usethis::use_data(variation_conceptual_causal_quartet, overwrite = TRUE)


variation_causal_quartet <- tibble(
  dataset = c(rep(c("(1) Constant effect",
                    "(2) Low variation",
                    "(3) High variation",
                    "(4) Occasional large effects"), 11),
              rep(c("(1) Constant effect",
                    "(2) Low variation",
                    "(3) High variation",
                    "(4) Occasional large effects"), each = 11)
  ),
  x = rep(0:1, each = 44),
  z = rep(quartet1_obs$x, 8),
  y = c(rep(quartet1_obs$y, 4),
        quartet1_obs$a, quartet1_obs$b, quartet1_obs$c, quartet1_obs$d)
) |>
  arrange(dataset)

usethis::use_data(variation_causal_quartet, overwrite = TRUE)

heterogeneous_conceptual_causal_quartet <- quartet2 |>
  select(-y) |>
  pivot_longer(a:d) |>
  select(dataset = name, x, causal_effect = value) |>
  mutate(dataset = case_when(
    dataset == "a" ~ "(1) Linear interaction",
    dataset == "b" ~ "(2) No effect then steady increase",
    dataset == "c" ~ "(3) Plateau",
    dataset == "d" ~ "(4) Intermediate zone with large effects"
  ))

usethis::use_data(heterogeneous_conceptual_causal_quartet, overwrite = TRUE)


heterogeneous_causal_quartet <- tibble(
  dataset = c(rep(c("(1) Linear interaction",
                    "(2) No effect then steady increase",
                    "(3) Plateau",
                    "(4) Intermediate zone with large effects"), 11),
              rep(c("(1) Linear interaction",
                    "(2) No effect then steady increase",
                    "(3) Plateau",
                    "(4) Intermediate zone with large effects"), each = 11)
  ),
  x = rep(0:1, each = 44),
  z = rep(quartet2_obs$x, 8),
  y = c(rep(quartet2_obs$y, 4),
        quartet2_obs$e, quartet2_obs$f, quartet2_obs$g, quartet2_obs$h)
) |>
  arrange(dataset)

usethis::use_data(heterogeneous_causal_quartet, overwrite = TRUE)

