#' Absolute Growth Rate (AGR)
#' 
#' A function that calculates the Absolute Growth Rate (AGR), also denoted as 
#' Weight Gain (WG) when applied to weight data.
#' 
#' 
#' @param m_start a numeric value providing the initial weight in grams.
#' @param m_end a numeric value providing the final weight in grams.
#' @param duration a numeric value describing the duration of the growth experiment.
#' 
#' @return returns a numeric value that is the AGR.
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
#' dplyr::mutate(weight2, AGR = agr(W_start, W_end, duration = 84))
#' 
#' 
#' 
#' @export
agr <- function(m_start, 
                m_end, 
                duration){
  # checks
  # Error checks
  if (any(is.na(c(m_start, m_end, duration)))) 
    stop("Inputs cannot be NA")
  
  if (!is.numeric(m_start) || !is.numeric(m_end) || !is.numeric(duration)) 
    stop("All inputs must be numeric")
  
  if (m_start < 0) 
    stop("m_start cannot be negative")
  
  if (m_end < 0) 
    stop("m_end cannot be negative")
  
  if (duration < 0) 
    stop("duration cannot be negative")
  
  
  # Warnings for zeros
  if (m_start == 0)
    warning("m_start is zero")
  
  if (m_end == 0) 
    warning("m_end is zero")
  
  if (duration == 0) 
    warning("duration is zero")
  
  
  # Calculate the absolute growth rate
  agr <- (m_end - m_start) / duration
  
  # Return the result
  return(agr)
}
