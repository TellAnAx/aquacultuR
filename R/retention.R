#' Nutrient retention (NR)
#' 
#' Function to calculate the nutrient retention
#' 
#' @param m_start numeric; value that is providing the initial weight in grams
#' @param m_end numeric; value that is providing the final weight in grams
#' @param nut_start numeric; value between 0 and 1 that provides the initial
#' inclusion rate of the target nutrient in the tissue of the experimental animal.
#' @param nut_end numeric; value between 0 and 1 that provides the final inclusion
#' rate of the target nutrient in the tissue of the experimental animal.
#' 
#' @return a numeric value
#' 
#' @author Anıl Axel Tellbüscher
#' 
#' @export
retention <- function(m_start,
               nut_start,
               m_end,
               nut_end) {
  
  retention <- m_end * nut_end - m_start * nut_start
  
  return(retention)
}
