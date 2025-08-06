#' Absolute Growth Rate (AGR)
#' 
#' A function that calculates the Absolute Growth Rate (AGR), also denoted as 
#' Weight Gain (WG) when applied to weight data.
#' 
#' 
#' @param ibw numeric; value that is providing the initial body weight in
#' grams.
#' @param fbw numeric; value that is providing the final body weight in
#' grams.
#' @param duration numeric value that is providing the duration of the
#' experiment in days.
#' 
#' @return returns a numeric value which is the total body weight change
#' over the specified period of time.
#' 
#' @author Anıl Axel Tellbüscher
#' @author Madhav Karthikeyan
#' @author Davide A. Machado e Silva
#
#' 
#' @references Lugert, V., Thaller, G., Tetens, J., Schulz, C., & Krieter, J.
#' (2016): A review on fish growth calculation: multiple functions in fish
#' production and their specific application. Reviews in Aquaculture, 8,
#' p.30–42.
#' 
#' Hopkins K.D. (1992) Reporting fish growth, a review of the basics. Journal 
#' of World Aquaculture Society, 23, p.173-179
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
agr <- function(ibw, 
                fbw, 
                duration){
  # checks
  # Error checks
  if (any(is.na(c(ibw, fbw, duration)))) 
    stop("Inputs cannot be NA")
  
  if (!is.numeric(ibw) || !is.numeric(fbw) || !is.numeric(duration)) 
    stop("All inputs must be numeric")
  
  if (ibw < 0) 
    stop("ibw cannot be negative")
  
  if (fbw < 0) 
    stop("fbw cannot be negative")
  
  if (duration < 0) 
    stop("duration cannot be negative")
  
  
  # Warnings for zeros
  if (ibw == 0)
    warning("ibw is zero")
  
  if (fbw == 0) 
    warning("fbw is zero")
  
  if (duration == 0) 
    warning("duration is zero")
  
  
  # Calculate the absolute growth rate
  agr <- (fbw - ibw) / duration
  
  # Return the result
  return(agr)
}
