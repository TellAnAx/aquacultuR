\name{calculate_ADCingr}
\alias{calculate_ADCingr}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Apparent Digestibility Coefficient of ingredients (ADCingr)
}
\description{
Function to calculate the Apparent Digestibility Coefficient (ADC) of a nutrient in an ingredient that is part of a compound diet.
}
\usage{
calculate_ADCingr(ADC_test, ADC_ref, 
                  nutr_ref, nutr_ingr, 
                  incl_ingr)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{ADC_test}{
  a numeric value in the interval [0,1] that represents the Apparent Digestibility Coefficient (ADC) of the diet that contains the ingredient to be tested.
  }
  \item{ADC_ref}{
  a numeric value in the interval [0,1] that represents the Apparent Digestibility Coefficient (ADC) of the reference diet without the ingredient to be tested.
  }
  \item{nutr_ref}{
  a numeric value in the interval [0,1] that represents the inclusion rate of the nutrient in the reference diet.
  }
  \item{nutr_ingr}{
  a numeric value in the interval [0,1] that represents the inclusion rate of the nutrient in the test diet for which the Apparent Digestibility Coefficient (ADC) of the nutrient in the ingredient will be calculated.
  }
  \item{incl_ingr}{
  a numeric value in the interval [0,1] that represents the inclusion rate of the ingredient in the test diet for which the Apparent Digestibility Coefficient (ADC) of the nutrient in an ingredient will be calculated.
  }
}
\details{
The calculation of the ADCingr is based on the equation proposed by Bureau and Hua (2006).
}
\value{
returns a single numeric value which is the relative ADC for the diet. If the value is not within the interval [0,1], an additional warning is returned.
}
\references{
Bureau, D. P., & Hua, K. (2006). Letter to the Editor of Aquaculture. Aquaculture, 252, 103–105.
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
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
\concept{ ~nutrition }
% \concept{ ~cpt2 }
% Use only one concept per line.
