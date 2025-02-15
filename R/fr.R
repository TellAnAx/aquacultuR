#' Feeding rate (FR)
#' 
#' Feed administered per time unit. The feeding rate usually refers to the 
#' amount of feed given, but not to the true feed intake.
#' 
#' @param m_feed numeric; total amount of feed given in grams over the period of 
#' interest. 
#' @param duration numeric; time period
#' 
#' @return numeric
#' 
#' @author Anıl Axel Tellbüscher
#' 
#' @export
fr <- function(m_feed = NULL, 
               duration = NULL) {
  stopifnot(!is.null(m_feed) | !is.null(duration))
  
  fr <- m_feed / duration
  return(fr)
}
