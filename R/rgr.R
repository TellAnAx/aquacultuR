#' Relative Growth Rate (RGR)
#' 
#' A function that calculates the Relative Growth Rate (RGR), which is the relative
#' weight increase per time unit.
#' 
#' 
#' @param m_start numeric; provides the initial weight in gram.
#' @param m_end numeric; provides the final weight in gram.
#' @param duration numeric; duration of the growth experiment.
#' 
#' @return either a single numeric value or vector holding the calculated RGR 
#' values. Multiply by 100 for conversion into percentage.
#' 
#' 
#' @author Anıl Axel Tellbüscher
#' 
#' 
#' @references Lugert, V., Thaller, G., Tetens, J., Schulz, C., & Krieter, J.
#' (2016): A review on fish growth calculation: multiple functions in fish
#' production and their specific application. Reviews in Aquaculture, 8,
#' p.30–42.
#' 
#' @importFrom dplyr mutate
#' 
#' @examples
#' data(weight2)
#' 
#' dplyr::mutate(weight2, RGR = rgr(W_start, W_end, duration = 84))
#' 
#' 
#' 
#' @export
rgr <- function(m_start, 
                m_end,
                duration){
  
  # Checks----
  ## Ensure inputs are numeric
  stopifnot("Inputs must be numeric!" = is.numeric(m_start) & is.numeric(m_end) & is.numeric(duration))
  
  ## Ensure m_start and duration are != 0
  stopifnot("Inputs must be != 0!" = m_start != 0 & duration != 0)
  
  ## Warn if inputs are < 0
  if(any(m_start < 0) | any(m_end < 0) | any(duration < 0)) {
    warning("Inputs < 0. The result is not meaningful.")
  }
  
  ## Warn if inputs are not of the same length
  if(any(c(length(m_start), length(m_end), length(duration)) > 1)) {
    message("Inputs are not of same length.")
  }
  
  
  
  # Calculations----
  ## Calculate the relative growth rate
  rgr <- (m_end - m_start) / (m_start * duration)
  
  ## Return the result
  return(rgr)
}
