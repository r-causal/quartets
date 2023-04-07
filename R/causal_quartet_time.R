#' Time-varying Causal Quartet Data
#'
#' These datasets contains 100 observations, each generated under a different
#' data generating mechanism:
#'   * (1) A collider
#'   * (2) A confounder
#'   * (3) A mediator
#'   * (4) M-bias
#'
#' There are three time points:
#'   * baseline
#'   * index (time 0, time of exposure classification)
#'   * follow up
#'
#' These datasets help demonstrate that a model that includes only pre-exposure
#' covariates (that is, only adjusting for covariates measured at baseline), will
#' be less prone to potential biases. Adjusting for only pre-exposure covariates
#' "solves" the bias in datasets 1-3. It does not solve the data generated under
#' the "M-bias" scenario, however this is more of a toy example, it has been
#' shown many times that the assumptions needed for this M-bias to hold are
#' often not ones we practically see in data analysis.
#' @examples
#'
#' ## incorrect model because covariate is post-treatment
#' lm(outcome_followup ~ exposure_index + covariate_followup,
#'    data = causal_collider_time)
#'
#' ## correct model because covariate is pre-treatment
#' ## even though the true mechanism dictates that the covariate is a collider,
#' ## because the pre-exposure variable is used, the collider bias does not
#' ## occur.
#' lm(outcome_followup ~ exposure_index + covariate_baseline,
#'    data = causal_collider_time)
#' @references D'Agostino McGowan L, Barrett M (2023). Causal inference is not a statistical problem. Preprint arXiv:2304.02683v1.
#'
#' @format `causal_collider_time`: A dataframe with 100 rows and 7 variables:
#'
#' * `covariate_baseline`: known factor measured at baseline (pre-exposure)
#' * `exposure_index`: exposure measured at the index visit (time 0)
#' * `outcome_index`: outcome measured at the index visit (time 0)
#' * `covariate_index`: known factor measured at the index visit (time 0)
#' * `exposure_followup`: exposure measured at the followup visit (final time)
#' * `outcome_followup`: outcome measured at the followup visit (final time)
#' * `covariate_followup`: known factor measured at the followup visit (final time)
"causal_collider_time"

#' @rdname causal_collider_time
#' @format `causal_confounding_time`: A dataframe with 100 rows and 7 variables:
#'
#' * `covariate_baseline`: known factor measured at baseline (pre-exposure)
#' * `exposure_index`: exposure measured at the index visit (time 0)
#' * `outcome_index`: outcome measured at the index visit (time 0)
#' * `covariate_index`: known factor measured at the index visit (time 0)
#' * `exposure_followup`: exposure measured at the followup visit (final time)
#' * `outcome_followup`: outcome measured at the followup visit (final time)
#' * `covariate_followup`: known factor measured at the followup visit (final time)

"causal_confounding_time"

#' @rdname causal_collider_time
#' @format `causal_mediator_time`: A dataframe with 100 rows and 7 variables:
#'
#' * `covariate_baseline`: known factor measured at baseline (pre-exposure)
#' * `exposure_index`: exposure measured at the index visit (time 0)
#' * `outcome_index`: outcome measured at the index visit (time 0)
#' * `covariate_index`: known factor measured at the index visit (time 0)
#' * `exposure_followup`: exposure measured at the followup visit (final time)
#' * `outcome_followup`: outcome measured at the followup visit (final time)
#' * `covariate_followup`: known factor measured at the followup visit (final time)
"causal_mediator_time"

#' @rdname causal_collider_time
#' @format `causal_m_bias_time`: A dataframe with 100 rows and 9 variables:
#'
#' * `u1`: unmeasured factor
#' * `u2`: unmeasured factor
#' * `covariate_baseline`: known factor measured at baseline (pre-exposure)
#' * `exposure_index`: exposure measured at the index visit (time 0)
#' * `outcome_index`: outcome measured at the index visit (time 0)
#' * `covariate_index`: known factor measured at the index visit (time 0)
#' * `exposure_followup`: exposure measured at the followup visit (final time)
#' * `outcome_followup`: outcome measured at the followup visit (final time)
#' * `covariate_followup`: known factor measured at the followup visit (final time)
"causal_m_bias_time"
