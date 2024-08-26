\name{calculate_metabWeight}
\alias{calculate_metabWeight}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Metabolic Bodyweight
}
\description{
Function to calculate the metabolic bodyweight with an exponent of 0.8, based on Lupatsch et al. (2003).
}
\usage{
calculate_metabWeight(initWeight, finalWeight, geomWeight = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{initWeight}{
%%     ~~Describe \code{x} here~~
}
  \item{finalWeight}{
  
  }
  \item{geomWeight}{
  
  }
}
\details{
The metabolic bodyweight is the rate of energy expenditure in dependence of the bodyweight of an organism. The energy expenditure $y$ is described by the equation

$$
y = a \cdot m_{\text{geom}}^b
$$

, where $m_{\text{geom}}$ is the geometric bodyweight in kg and $b$ was found to be approximately 0.8, while $a$ has to be determined. 
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
Lupatsch et al. (2003): Comparison of energy and protein efficiency among three fish species gilthead sea bream (Sparus aurata), European sea bass (Dicentrarchus labrax) and white grouper (Epinephelus aeneus): energy expenditure for protein and lipid deposition. Aquaculture 225, p.175-189.
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
##--	or standard data sets, see data().

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
