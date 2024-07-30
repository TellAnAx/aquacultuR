\name{calculate_PER}
\alias{calculate_PER}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
PER
}
\description{
Function to calculate the Protein Efficiency Ratio
}
\usage{
calculate_PER(initWeight = NULL, finalWeight = NULL, weightGain = NULL, proteinFed = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{initWeight}{a numeric value for the initial weight (either average weight of the individuals or the total biomass) of the livestock at the beginning of the feeding trial.}
  \item{finalWeight}{a numeric value for the final weight (either average weight of the individuals or the total biomass) of the livestock at the end of the feeding trial.}
  \item{weightGain}{optional; can be provided instead of the initial and final weight.}
  \item{proteinFed}{a numeric value for the amount of protein fed during the feeding trial.}
}
\details{
It should be noted that all input values must be provided in the same unit.
}
\value{
returns a single numeric value
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
# Calculate the PER using the initial and final weight
calculate_PER(initWeight = 1, finalWeight = 10, proteinFed = 12)

# Calculate the PER using the weight gain instead
calculate_PER(weightGain = 9, proteinFed = 12)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
