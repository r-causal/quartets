#' Confounder Data
#'
#' This dataset contains 100 observations, generated under the following mechanism:
#' Z ~ N(0, 1) (measured factor: confounder)
#' X ~ Z + N(0,1) (exposure)
#' Y ~ 0.5X + Z + N(0, 1) (outcome)
#' @references Lucy D’Agostino McGowan, Travis Gerke & Malcolm Barrett (2023) Causal inference is not just a statistics problem, Journal of Statistics and Data Science Education, DOI: 10.1080/26939169.2023.2276446
#' @format A dataframe with 100 rows and 3:
#'
#' * `covariate`: a known factor (confounder)
#' * `exposure`: exposure
#' * `outcome`: outcome
"causal_confounding"
