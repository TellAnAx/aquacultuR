\name{calculate_AG}
\alias{calculate_AG}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Absolute Growth
}
\description{
Calculate the Absolute Growth (AG).
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
calculate_AG(initWeight, finalWeight)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{initWeight}{
  a numeric value that is providing the initial weight in grams.
  }
  \item{finalWeight}{
  a numeric value that is providing the final weight in grams.
  }
}
\details{
The AG, also termed Absolute Weight Gain (AWG), is the weight that was gained within the duration of a growth trial.
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
Returns a single value that is the AG.
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
\code{\link{https://blog.tellbuescher.online/formulary}}
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