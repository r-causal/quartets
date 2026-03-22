#' Area under the ROC Curve (AUROC) Quartet Data
#'
#' This dataset contains 4 datasets, each with equivalent
#' values for the AUROC, a popular model evaluation metric for
#' classification problems. Each curve features a substantially
#' different AUROC curve shape with implications for other evaluation
#' methods such as lift, precision, and recall. 
#' 
#' AUROC curves are parameterized as one of two functional forms
#' defined by `method` (piecewise linear or the Beta distribution CDF). 
#'
#' @references Riederer E (2026). _roctet_: . Python package version 0.1.0. 
#'
#' @format A dataframe with 4,000 rows and 4 variables:
#'
#' * `id`: The data id number within each method
#' * `method`: The data generating mechanism ("beta" or "piecewise")
#' * `score`: The numerical prediction score
#' * `target`: The true binary outcome being predicted
"auroc_quartet"
