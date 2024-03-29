% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/csl_name.R
\name{csl_name}
\alias{csl_name}
\alias{csl_names}
\alias{list_of_csl_names}
\title{A name variable conforming to the CSL schema}
\usage{
csl_name(
  family = NULL,
  given = NULL,
  dropping_particle = NULL,
  non_dropping_particle = NULL,
  suffix = NULL,
  comma_suffix = NULL,
  static_ordering = NULL,
  literal = NULL,
  parse_names = NULL
)

csl_names(x = list())

list_of_csl_names(x = list())
}
\arguments{
\item{family}{The family name}

\item{given}{The given name}

\item{dropping_particle, non_dropping_particle, suffix, comma_suffix, static_ordering, literal, parse_names}{Additional
name variable properties as described in the schema.}

\item{x}{For \code{csl_name()}, \code{x} should be a list of \code{csl_name()}. For
\code{list_of_csl_names()}, \code{x} should be a list of \code{csl_names()}.}
}
\description{
This class provides helper utilities to display, sort, and select attributes
from a name in the CSL format.
}
\seealso{
\url{https://citeproc-js.readthedocs.io/en/latest/csl-json/markup.html#name-fields}
}
\keyword{internal}
