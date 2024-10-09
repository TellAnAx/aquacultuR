\name{calculate_AG}
\alias{calculate_AG}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
AG
}
\description{
Calculates the Absolute Growth
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
calculate_AG(initWeight, finalWeight)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{initWeight}{
  a numeric value providing the initial weight in grams.
  }
  \item{finalWeight}{
  a numeric value providing the final weight in grams.
  }
}
\details{
The AG, also termed Absolute Weight Gain (AWG), is the weight that was gained within the duration of a growth trial. It does by default not distinguish between weight gain in form of dry matter or water.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
Returns a single numeric value.
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
