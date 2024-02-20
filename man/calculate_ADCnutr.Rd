\name{calculate_ADCnutr}
\alias{calculate_ADCnutr}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
calculate_ADCnutr(diet_IS, feces_IS, diet_NUTR, feces_NUTR)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{diet_IS}{
a numeric value, resembling the inclusion rate of internal standard in the experimental diet given to the livestock.
  }
  \item{feces_IS}{
a numeric value, resembling the inclusion rate of internal standard in the feces recovered during the digestibility trial.
  }
  \item{diet_NUTR}{
  
  }
  \item{feces_NUTR}{
  
  }
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
returns a single numeric value which is the relative ADC for a single nutrient in the diet. If the value is not within the interval [0,1], an additional warning is returned.
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
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x)
{
  }
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
