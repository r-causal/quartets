#' Collider Data
#'
#' This dataset contains 100 observations, generated under the following mechanism:
#' X ~ N(0, 1)
#' Y ~ X + N(0,1)
#' Z ~ 0.45X + 0.77Y + N(0, 1)
#'
#' @reference D'Agostino McGowan L, Barrett M (2023). Causal inference is not a statistical problem. Preprint arXiv:2304.02683v1.
#' @format A dataframe with 100 rows and 3 variables:
#'
#' * `x`: exposure
#' * `y`: outcome
#' * `z`: a known factor (collider)

"causal_collider"
