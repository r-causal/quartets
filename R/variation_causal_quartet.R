#' Gelman Variation Causal Quartet Data
#'
#' This dataset contains 88 observations, each generated under a different
#' mechanism of variation of the treatment effect with respect to some
#' pre-exposure characteristic, `z`:
#'   * (1) Constant effect
#'   * (2) Low variation
#'   * (3) High variation
#'   * (4) Occasional large effects
#'
#' The dataframe `variation_conceptual_causal_quartet` contains the latent
#' "true" causal effect.
#'
#' @references Gelman, A., Hullman, J., & Kennedy, L. (2023). Causal quartets: Different ways to attain the same average treatment effect. arXiv preprint arXiv:2302.12878.
#'
#' Hullman J (2023). _causalQuartet: Create Causal Quartets for Interrogating Average Treatment Effects_. R package version 0.0.0.9000.
#'
#' @format `variation_causal_quartet`: A dataframe with 88 rows and 4 variables:
#'
#' * `dataset`: The data generating mechanism
#' * `x`: exposure
#' * `z`: a pre-exposure factor
#' * `y`: outcome
"variation_causal_quartet"

#' @rdname variation_causal_quartet
#' @format `variation_conceptual_causal_quartet`:  A dataframe with 88 rows and 4 variables:
#'
#' * `dataset`: The data generating mechanism
#' * `z`: A pre-exposure factor
#' * `causal_effect`: The true causal effect
"variation_conceptual_causal_quartet"
