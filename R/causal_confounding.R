#' Confounder Data
#'
#' This dataset contains 100 observations, generated under the following mechanism:
#' Z ~ N(0, 1)
#' X ~ Z + N(0,1)
#' Y ~ 0.5X + Z + N(0, 1)
#' @references D'Agostino McGowan L, Barrett M (2023). Causal inference is not a statistical problem. Preprint arXiv:2304.02683v1.
#' @format A dataframe with 100 rows and 3:
#'
#' * `z`: a known factor (confounder)
#' * `x`: exposure
#' * `y`: outcome
"causal_confounding"
