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
  # Check for numeric and non-missing
  if (any(is.na(c(m_start, m_end, nut_start, nut_end)))) 
    stop("Inputs must not be NA")
  
  if (!all(sapply(list(m_start, m_end, nut_start, nut_end), is.numeric))) 
    stop("All inputs must be numeric")

  
  # Warn if any value is <= 0
  if (m_start <= 0) warning("m_start is zero or negative; result may not be meaningful")
  if (m_end <= 0) warning("m_end is zero or negative; result may not be meaningful")
  if (nut_start <= 0) warning("nut_start is zero or negative; result may not be meaningful")
  if (nut_end <= 0) warning("nut_end is zero or negative; result may not be meaningful")
  
  retention <- m_end * nut_end - m_start * nut_start
  
  return(retention)
}
