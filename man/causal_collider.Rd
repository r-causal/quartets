% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/causal_collider.R
\docType{data}
\name{causal_collider}
\alias{causal_collider}
\title{Collider Data}
\format{
A dataframe with 100 rows and 3 variables:
\itemize{
\item \code{exposure}: exposure
\item \code{outcome}: outcome
\item \code{covariate}: a known factor (collider)
}
}
\usage{
causal_collider
}
\description{
This dataset contains 100 observations, generated under the following mechanism:
X ~ N(0, 1) (exposure)
Y ~ X + N(0,1) (outcome)
Z ~ 0.45X + 0.77Y + N(0, 1) (measured factor: collider)
}
\references{
D'Agostino McGowan L, Barrett M (2023). Causal inference is not a statistical problem. Preprint arXiv:2304.02683v1.
}
\keyword{datasets}
