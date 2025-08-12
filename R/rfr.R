#' Relative Feeding Rate (RFR)
#' 
#' Feed administered per time unit and biomass. The feeding rate usually 
#' refers to the amount of feed given, but not to the true feed intake.
#' 
#' @param m_feed numeric; total amount of feed given in grams over the time 
#' period of interest. 
#' @param m_bio numeric value; biomass increase.
#' @param duration numeric; time period of interest 
#' 
#' @return numeric; multiply by 100 for conversion into percentage.
#' 
#' @author Anıl Axel Tellbüscher
#' 
#' @export
rfr <- function(m_feed = NULL, 
                m_bio = NULL,
                duration = NULL) {
  
  # Checks----
  ## Ensure inputs are numeric
  stopifnot("Error: Inputs must be numeric!" = is.numeric(m_feed), is.numeric(m_bio), is.numeric(duration))
  
  ## Ensure inputs have the same length
  if (length(m_feed) != length(m_bio)) {
    stop("Error: 'm_feed' and 'm_bio' must be of the same length.")
  }
  
  ## Check whether inputs are > 0
  if (any(m_feed < 0 | m_bio < 0 | duration < 0)) {
    warning("Some input values are negative. The result is not meaningful.")
  }  
  
  
  
  # Calculations----
  rfr <- m_feed / (m_bio * duration)
  return(rfr)
}
