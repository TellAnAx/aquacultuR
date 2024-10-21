\name{polyculture2}
\alias{polyculture2}
\docType{data}
\title{
Growth Performance of Largemouth Bass and Pikeperch}
\description{
This dataset provides the initial and final bodyweights of 396 individual Largemouth bass and pikeperch specimens that were reared in three treatments (largemouth bass-only, pikeperch-only, largemout bass and pikeperch together) during a 60-day growth experiment.
}
\usage{data("polyculture2")}
\format{
  A data frame with 396 observations on the following 3 variables.
  \describe{
    \item{\code{treatment}}{a character vector, describing the treatment}
    \item{\code{W_start}}{a numeric vector, describing the initial bodyweight of each specimen}
    \item{\code{W_end}}{a numeric vector, describing the final bodyweight of each specimen}
  }
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
Pěnka, T., Malinovskyi, O., Křišťan, J., Imentai, A., & Policar, T. (2021). Effect of density and mixed culture of largemouth bass (Micropterus salmoides) and pikeperch (Sander lucioperca) on growth, survival and feed conversion rate in intensive culture. Czech Journal of Animal Science, 66(10), 428-440. doi: 10.17221/59/2021-CJAS}
\references{

}
\examples{
data(polyculture2)
## maybe str(polyculture2) ; plot(polyculture2) ...
}
\keyword{datasets}
