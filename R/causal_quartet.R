#' Causal Quartet Data
#'
#' This dataset contains 400 observations, each generated under a different
#' data generating mechanism:
#'   * (1) A collider
#'   * (2) A confounder
#'   * (3) A mediator
#'   * (4) M-bias
#'
#' @format A dataframe with 400 rows and 6 variables:
#'
#' * `dataset`: The data generating mechanism
#' * `x`: exposure
#' * `y`: outcome
#' * `z`: a known factor
#' * `u1`: an unknown factor
#' * `u2`: an unknown factor
"causal_quartet"
