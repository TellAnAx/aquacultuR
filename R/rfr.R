#' Relative Feeding Rate (FR)
#' 
#' Feed administered per time unit and biomass. The feeding rate usually 
#' refers to the amount of feed given, but not to the true feed intake.
#' 
#' @param m_feed numeric; total amount of feed given in grams over the period of 
#' interest. 
#' @param m_bio numeric
#' @param duration numeric; time period
#' 
#' @return numeric
#' 
#' @author Anıl Axel Tellbüscher
#' 
#' @export
rfr <- function(m_feed = NULL, 
                m_bio = NULL,
               duration = NULL) {
  stopifnot(!is.null(m_feed) | !is.null(m_bio) | !is.null(duration))
  
  rfr <- m_feed / (m_bio * duration)
  return(rfr)
}
