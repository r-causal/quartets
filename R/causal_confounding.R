#' Confounder Data
#'
#' This dataset contains 100 observations, generated under the following mechanism:
#' Z ~ N(0, 1) (measured factor: confounder)
#' X ~ Z + N(0,1) (exposure)
#' Y ~ 0.5X + Z + N(0, 1) (outcome)
#' @references D'Agostino McGowan L, Barrett M (2023). Causal inference is not a statistical problem. Preprint arXiv:2304.02683v1.
#' @format A dataframe with 100 rows and 3:
#'
#' * `covariate`: a known factor (confounder)
#' * `exposure`: exposure
#' * `outcome`: outcome
"causal_confounding"
