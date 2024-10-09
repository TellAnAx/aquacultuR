\name{calculate_TGC}
\alias{calculate_TGC}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
TGC
}
\description{
Function to calculate the Thermal Growth Coefficient (TGC).
}
\usage{
calculate_TGC(initWeight, finalWeight, duration, temp)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{initWeight}{
  a numeric value that is providing the initial weight in grams.
  }
  \item{finalWeight}{
  a numeric value that is providing the final weight in grams.
  }
  \item{duration}{
  a numeric value that is providing the duration of the experiment in days.
  }
  \item{temp}{
  a numeric value that is providing the average temperature during the experiment in degrees Celsius.
  }
}
\details{
The TGC is an alternative growth metric for fishes, describing the increase in bodyweight over a period of time. It is suitable for poikilothermic animals due to its standardisation for temperature. It should, however, be taken into account, that the temperature during the experiment should remain within the optimum range.
}
\value{
Returns a numeric value that is the TGC.
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
Lugert, V., Thaller, G., Tetens, J., Schulz, C., & Krieter, J. (2016): A review on fish growth calculation: multiple functions in fish production and their specific application. Reviews in Aquaculture, 8, p.30–42.
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
\code{\link[Aquaculture Formulary]{https://blog.tellbuescher.online/formulary}}
}
\examples{
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
