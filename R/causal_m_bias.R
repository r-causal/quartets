#' M-Bias Data
#'
#' This dataset contains 100 observations, generated under the following mechanism:
#' U1 ~ N(0, 1)
#' U2 ~ N(0, 1)
#' Z ~ 8 U1 + U2 + N(0, 1) (measured factor)
#' X ~ U1 + N(0, 1) (exposure)
#' Y ~ X + U2 + N(0, 1) (outcome)
#'
#' @references Lucy D’Agostino McGowan, Travis Gerke & Malcolm Barrett (2023) Causal inference is not just a statistics problem, Journal of Statistics and Data Science Education, DOI: 10.1080/26939169.2023.2276446
#' @format A dataframe with 100 rows and 5 variables:
#'
#' * `u1`: an unknown factor
#' * `u2`: an unknown factor
#' * `covariate`: a known factor
#' * `exposure`: exposure
#' * `outcome`: outcome

"causal_m_bias"
