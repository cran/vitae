
<!-- README.md is generated from README.Rmd. Please edit that file -->

# vitae <img src="man/figures/logo.png" align="right" />

*/ˈviːteɪ/*

[![CRAN
status](https://www.r-pkg.org/badges/version/vitae)](https://cran.r-project.org/package=vitae)
[![Travis build
status](https://travis-ci.org/ropenscilabs/vitae.svg?branch=master)](https://travis-ci.org/ropenscilabs/vitae)

## Templates and tools for making a Résumé/CV

The *vitae* package makes creating and maintaining a Résumé or CV with R
Markdown simple. It provides a collection of LaTeX templates, with
helpful functions to add content to the documents.

## Installation

You can install the **release** version from CRAN.

``` r
install.packages('vitae')
```

You can install the **development** version from
[GitHub](https://github.com/ropenscilabs/vitae).

``` r
# install.packages("devtools")
devtools::install_github("ropenscilabs/vitae")
```

This package requires LaTeX to be installed on your computer. If you’re
encountering issues, please check that LaTeX is installed. The [tinytex
package](https://github.com/yihui/tinytex) makes it easy to setup LaTeX
within R:

``` r
install.packages('tinytex')
tinytex::install_tinytex()
```

## Getting started

The *vitae* package currently supports 5 popular CV templates, and
adding more is a relatively simple process (details in the [creating
vitae
templates](https://ropenscilabs.github.io/vitae/articles/extending.html)
vignette).

Creating a new CV with `vitae` can be done using the RStudio R Markdown
template selector: ![](man/figures/template_gui.png)

These templates leverage the strength of rmarkdown to include common
information in the YAML header (name, position, social links…) and
extended information in the main body. The main body of the CV is
written using markdown, and allows for data-driven generation of entries
using the [`*_entries`
functions](https://ropenscilabs.github.io/vitae/reference/cventries.html).
This allows you to import your working history from other sources (such
as ORCID, Google Scholar, or a maintained dataset), and include them
programmatically into your CV.

For example, the [rorcid package](https://github.com/ropensci/rorcid)
can be used to extract [Rob
Hyndman](https://orcid.org/0000-0002-2140-5352)’s education history:

``` r
orcid_data <- do.call("rbind",
  rorcid::orcid_educations("0000-0002-2140-5352")$`0000-0002-2140-5352`$`affiliation-group`$summaries
)
```

    #> 
    #> Attaching package: 'dplyr'
    #> The following objects are masked from 'package:stats':
    #> 
    #>     filter, lag
    #> The following objects are masked from 'package:base':
    #> 
    #>     intersect, setdiff, setequal, union
    #>    education-summary.role-title education-summary.start-date.year.value
    #> 1                           PhD                                    1990
    #> 2 Bachelor of Science (Honours)                                    1985
    #>   education-summary.end-date.year.value
    #> 1                                  1992
    #> 2                                  1988
    #>   education-summary.organization.name
    #> 1             University of Melbourne
    #> 2             University of Melbourne
    #>   education-summary.organization.address.city
    #> 1                                   Melbourne
    #> 2                                   Melbourne

The package provides two types of entries from data, which are
`detailed_entries` and `brief_entries`. Both functions provide sections
for `what`, `when`, and `with`, and the `detailed_entries` additionally
supports `where` and `why`. These arguments support operations, so for
this example, we have used `glue` to combine the start and end years for
our `when` input. Excluding any inputs is also okay (as is done for
`why`), it will just be left blank in the CV.

``` r
orcid_data %>%
  detailed_entries(
    what = `education-summary.role-title`,
    when = glue::glue("{`education-summary.start-date.year.value`} - {`education-summary.end-date.year.value`}"),
    with = `education-summary.organization.name`,
    where = `education-summary.organization.address.city`
  )
```

![](man/figures/education.png)

Additional examples of using this package can be found in the slides
presented at [ozunconf2018](https://ozunconf18.ropensci.org/):
<https://slides.mitchelloharawild.com/vitae/>

## Examples of using vitae

  - [Mitchell O’Hara-Wild](https://github.com/mitchelloharawild/CV)
  - [Rob Hyndman](https://github.com/robjhyndman/CV)
  - [Eric R. Scott](https://github.com/Aariq/curriculum-vitae)
  - [Chris
    Umphlett](https://chrisumphlett.github.io/posts/vitae-package/)
  - [Nat Price](https://github.com/natbprice/cv)

Add your vitae to the list using a PR.

-----

Please note that the ‘vitae’ project is released with a [Contributor
Code of
Conduct](https://github.com/ropenscilabs/vitae/blob/master/.github/CODE_OF_CONDUCT.md).
By contributing to this project, you agree to abide by its terms.
