#' Absolute feeding rate (AFR)
#'
#' Feed administered per unit of time. The absolute feeding rate usually refers
#' to the amount of feed given, but not to the true feed intake.
#'
#' @param m_feed numeric; total amount of feed provided in grams over the
#' time period of interest.
#' @param duration numeric; time period over which the animals are fed
#'
#' @return numeric; returns a vector if multiple values are provided.
#'
#' @examples
#' # 100 g fed over 10 d
#' afr(m_feed = 100, duration = 10)
#'
#' # 354 g, 846 g, and 1222 g fed over 83 d
#' afr(m_feed = c(354, 846, 1222), duration = 83)
#'
#' @author Anıl Axel Tellbüscher
#'
#' @export
afr <- function(m_feed = NULL, duration = NULL) {
  # Checks----
  ## Ensure inputs are numeric
  stopifnot("All inputs must be numeric!" = is.numeric(m_feed) &
              is.numeric(duration))
  
  ## Ensure duration != 0
  stopifnot("'duration' must not be zero!" = duration != 0)
  
  ## Warn if input is negative
  if (any(m_feed < 0) | any(duration < 0)) {
    warning("An input is negative. The result is not meaningful.")
  }
  
  
  
  
  # Calculations----
  afr <- m_feed / duration
  return(afr)
}





#' Relative Feeding Rate (RFR)
#'
#' Feed administered per time unit and biomass. The feeding rate usually
#' refers to the amount of feed given, but not to the true feed intake.
#'
#' @param m_feed numeric; total amount of feed given in grams over the time
#' period of interest.
#' @param ag numeric value; absolute growth in grams during the experimental 
#' period.
#' @param duration numeric; time period of interest in days.
#'
#' @return numeric; multiply by 100 for conversion into percentage.
#'
#' @author Anıl Axel Tellbüscher
#'
#' @export
rfr <- function(m_feed = NULL,
                ag = NULL,
                duration = NULL) {
  # Checks----
  ## Ensure inputs are numeric
  stopifnot("Error: Inputs must be numeric!" = is.numeric(m_feed),
            is.numeric(ag),
            is.numeric(duration))
  
  ## Ensure inputs have the same length
  if (length(m_feed) != length(ag)) {
    stop("Error: 'm_feed' and 'ag' must be of the same length.")
  }
  
  ## Check whether inputs are != 0
  if (any(ag == 0 | duration == 0)) {
    stop("Error: 'ag' and/or 'duration' is equal to zero. 
         The result cannot be calculated.")
  }
  
  ## Check whether inputs are < 0
  if (any(m_feed < 0 | ag < 0 | duration < 0)) {
    warning("Warning: One or many inputs are smaller than zero. 
            The result is not meaningful.")
  }
  
  
  
  # Calculations----
  rfr <- m_feed / (ag * duration)
  return(rfr)
}



#' @rdname rfr
#' @export
fr <- rfr
