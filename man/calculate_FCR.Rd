\name{calculate_FCR}
\alias{calculate_FCR}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Feed Conversion Ratio
%%  ~~function to do ... ~~
}
\description{
Function to calculate the Feed Conversion Ratio (FCR).
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
calculate_FCR(initWeight, finalWeight, feedIntake, dryMatter)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{initWeight}{
  a numeric value that is providing the initial weight in grams.
  }
  \item{finalWeight}{
  a numeric value that is providing the final weight in grams.
  }
  \item{feedIntake}{
  a numeric value providing the total feed intake in grams during the experiment.
  }
  \item{dryMatter}{
  a numeric value indicating the dry matter content of the feed. The value must be within the interval of (0:1).
  }
}
\details{
The Feed Conversion Ratio (FCR) describes the amount of feed on dry matter (DM) basis that is required to gain 1 kg of body weight on wet weight basis.
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
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
