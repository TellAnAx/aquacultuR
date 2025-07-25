#' Metabolic bodyweight (MBW)
#' 
#' The metabolic bodyweight is the rate of energy expenditure in dependence of
#' the bodyweight of an organism. 
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
  # Check numeric and non-missing
  if (!is.null(m_start) && (!is.numeric(m_start) || is.na(m_start))) stop("m_start must be numeric and not NA")
  if (!is.null(m_end) && (!is.numeric(m_end) || is.na(m_end))) stop("m_end must be numeric and not NA")
  if (!is.null(gbw) && (!is.numeric(gbw) || is.na(gbw))) stop("gbw must be numeric and not NA")
  
  # Check non-negative
  if (!is.null(m_start) && m_start < 0) stop("m_start must be non-negative")
  if (!is.null(m_start) && m_start==0) stop("m_start cannot be zero")
  if (!is.null(m_end) && m_end < 0) stop("m_end must be non-negative")
  if (!is.null(gbw) && gbw < 0) stop("gbw must be non-negative")
  
  # Check start ≤ end
  if (!is.null(m_start) && !is.null(m_end) && m_start > m_end) stop("m_start cannot be greater than m_end")
  
  
  # Calculate gain body weight if not provided
  if (is.null(gbw)) {
    gbw <- m_end - m_start
  }
  
  
  if(is.null(gbw) == TRUE){
    
    # Calculate the geometric mean bodyweight using initWeight and finalWeight
    mbw <- sqrt(m_start * m_end) ^ 0.8
    
  } else {
    
    mbw <- gbw ^ 0.8
  }
  
  # Return the result
  return(mbw)
}
