#' Collider Data
#'
#' This dataset contains 100 observations, generated under the following mechanism:
#' X ~ N(0, 1) (exposure)
#' Y ~ X + N(0,1) (outcome)
#' Z ~ 0.45X + 0.77Y + N(0, 1) (measured factor: collider)
#'
#' @references D'Agostino McGowan L, Barrett M (2023). Causal inference is not a statistical problem. Preprint arXiv:2304.02683v1.
#' @format A dataframe with 100 rows and 3 variables:
#'
#' * `exposure`: exposure
#' * `outcome`: outcome
#' * `covariate`: a known factor (collider)

"causal_collider"
