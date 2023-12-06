#' Collider Data
#'
#' This dataset contains 100 observations, generated under the following mechanism:
#' X ~ N(0, 1) (exposure)
#' Y ~ X + N(0,1) (outcome)
#' Z ~ 0.45X + 0.77Y + N(0, 1) (measured factor: collider)
#'
#' @references Lucy D’Agostino McGowan, Travis Gerke & Malcolm Barrett (2023) Causal inference is not just a statistics problem, Journal of Statistics and Data Science Education, DOI: 10.1080/26939169.2023.2276446
#' @format A dataframe with 100 rows and 3 variables:
#'
#' * `exposure`: exposure
#' * `outcome`: outcome
#' * `covariate`: a known factor (collider)

"causal_collider"
