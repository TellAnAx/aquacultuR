#
# date written:   December 18th, 2021
# last modified:  August 25th, 2024
#
#
#
###############################################################################

#' Function to calculate the metabolic bodyweight. 
#' 
#' The metabolic bodyweight is the rate of energy expenditure in dependence of
#' the bodyweight of an organism. The energy expenditure $y$ is described by
#' the equation
#' 
#' $$ y = a \cdot m_\textgeom^b $$
#' 
#' , where $m_\textgeom$ is the geometric bodyweight in kg and $b$ was found to
#' be approximately 0.8, while $a$ has to be determined.
#' 
#' @param initWeight a numeric value that is providing the initial weight in
#' grams.
#' @param finalWeight a numeric value that is providing the final weight in
#' grams.
#' @param geomWeight a numeric value providing the geometric bodyweight in grams.
#' @return returns a numeric value that is the metabolic bodyweight.
#' 
#' @note #' The calculation is based on Lupatsch et al. (2003), with an exponent of 0.8.

#' @author Anıl Axel Tellbüscher
#' 
#' @seealso %% ~~objects to See Also as \code{\link{help}}, ~~~
#' 
#' @references Lupatsch, I. et al. (2003): Comparison of energy and protein
#' efficiency among three fish species gilthead sea bream (Sparus aurata),
#' European sea bass (Dicentrarchus labrax) and white grouper (Epinephelus
#' aeneus): energy expenditure for protein and lipid deposition. Aquaculture
#' 225, p.175-189.
#' 
#' @examples
#' 
#' @export calculate_metabWeight
calculate_metabWeight <- function(initWeight, finalWeight, geomWeight = NULL){
  
  if(is.null(geomWeight) == TRUE){
    
    # Calculate the geometric mean bodyweight using initWeight and finalWeight
    result <- sqrt(initWeight * finalWeight) ^ 0.8
    
  } else {
    
    result <- geomWeight ^ 0.8
  }
  
  # Return the result
  return(result)
}
