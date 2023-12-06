#' Causal Quartet Data
#'
#' This dataset contains 400 observations, each generated under a different
#' data generating mechanism:
#'   * (1) A collider
#'   * (2) A confounder
#'   * (3) A mediator
#'   * (4) M-bias
#'
#' @references Lucy D’Agostino McGowan, Travis Gerke & Malcolm Barrett (2023) Causal inference is not just a statistics problem, Journal of Statistics and Data Science Education, DOI: 10.1080/26939169.2023.2276446
#'
#' @format A dataframe with 400 rows and 6 variables:
#'
#' * `dataset`: The data generating mechanism
#' * `exposure`: exposure
#' * `outcome`: outcome
#' * `covariate`: a known factor
#' * `u1`: an unknown factor
#' * `u2`: an unknown factor
"causal_quartet"
