#' Relative Growth Rate (RGR)
#' 
#' A function that calculates the Relative Growth Rate (RGR).
#' 
#' 
#' @param m_start a numeric value that is providing the initial weight in
#' grams.
#' @param m_end a numeric value that is providing the final weight in
#' grams.
#' @param duration a numeric value describing the duration of the growth experiment.
#' 
#' @return returns a numeric value that is the RGR.
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
  
  # Calculate the relative growth rate
  rgr = (m_end - m_start) / (duration * sqrt(m_end * m_start))
  
  # Return the result
  return(rgr)
}
