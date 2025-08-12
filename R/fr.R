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
  
  # Checks----
  ## Ensure inputs are numeric
  stopifnot("All inputs must be numeric!" = !is.numeric(m_feed) | !is.numeric(duration))
  
  ## Ensure duration != 0
  stopifnot("'duration' must not be zero!" = duration == 0)
  
  ## Warn if input is negative
  warnifnot("An input is negative. The result is not meaningful." = m_feed < 0 | duration < 0)
  
  
  
  # Calculations----
  fr <- m_feed / duration
  return(fr)
}
