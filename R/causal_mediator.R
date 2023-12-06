#' Mediator Data
#'
#' This dataset contains 100 observations, generated under the following mechanism:
#' X ~ N(0, 1) (exposure)
#' Z ~ X + N(0,1) (measured factor: mediator)
#' Y ~ Z + N(0, 1) (outcome)
#'
#' @references Lucy D’Agostino McGowan, Travis Gerke & Malcolm Barrett (2023) Causal inference is not just a statistics problem, Journal of Statistics and Data Science Education, DOI: 10.1080/26939169.2023.2276446
#'
#' @format A dataframe with 100 rows and 3 variables:
#'
#' * `exposure`: exposure
#' * `covariate`: a known factor (mediator)
#' * `outcome`: outcome
"causal_mediator"
