#' Metabolic bodyweight (MBW)
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
#' @param m_start a numeric value that is providing the initial weight in
#' grams.
#' @param m_end a numeric value that is providing the final weight in
#' grams.
#' @param gbw a numeric value providing the geometric bodyweight in grams.
#' 
#' @return returns a numeric value that is the metabolic bodyweight.
#' 
#' @note The calculation is based on Lupatsch et al. (2003), with an exponent of 0.8.
#' 
#' @author Anıl Axel Tellbüscher
#' 
#' 
#' @references Lupatsch, I. et al. (2003): Comparison of energy and protein
#' efficiency among three fish species gilthead sea bream (Sparus aurata),
#' European sea bass (Dicentrarchus labrax) and white grouper (Epinephelus
#' aeneus): energy expenditure for protein and lipid deposition. Aquaculture
#' 225, p.175-189.
#' 
#' @importFrom dplyr mutate
#' 
#' @examples
#' data(weight2)
#' 
#' dplyr::mutate(weight2, MBW = mbw(W_start, W_end))
#' 
#' 
#' 
#' @export
mbw <- function(m_start, 
                m_end, 
                gbw = NULL){
  
  if(is.null(gbw) == TRUE){
    
    # Calculate the geometric mean bodyweight using initWeight and finalWeight
    mbw <- sqrt(m_start * m_end) ^ 0.8
    
  } else {
    
    mbw <- gbw ^ 0.8
  }
  
  # Return the result
  return(mbw)
}
