#' Mediator Data
#'
#' This dataset contains 100 observations, generated under the following mechanism:
#' X ~ N(0, 1)
#' Z ~ X + N(0,1)
#' Y ~ Z + N(0, 1)
#'
#' @format A dataframe with 100 rows and 3 variables:
#'
#' * `x`: exposure
#' * `z`: a known factor (mediator)
#' * `y`: outcome
"causal_mediator"
