# date written:   December 18th, 2021
# last modified:  August 25th, 2024
#
###############################################################################

#' Absolute Growth Rate
#' 
#' A function that calculates the Absolute Growth Rate (AGR), also denoted as 
#' Weight Gain (WG) when applied to weight data.
#' 
#' %% ~~ If necessary, more details than the description above ~~
#' 
#' @param initWeight a numeric value providing the initial weight in grams.
#' @param finalWeight a numeric value providing the final weight in grams.
#' @param duration a numeric value describing the duration of the growth experiment.
#' @return returns a numeric value that is the AGR.
#' 
#' @note %% ~~further notes~~
#' 
#' @author Anıl Axel Tellbüscher
#' 
#' @seealso \code{\link[Aquaculture Formulary]{https://blog.tellbuescher.online/formulary}}
#' 
#' @references Lugert, V., Thaller, G., Tetens, J., Schulz, C., & Krieter, J.
#' (2016): A review on fish growth calculation: multiple functions in fish
#' production and their specific application. Reviews in Aquaculture, 8,
#' p.30–42.
#' 
#' @examples
#' 
#' 
#' @export calculate_AGR
calculate_AGR <- function(initWeight, finalWeight, duration){
  
  # Calculate the absolute growth rate
  result = (finalWeight - initWeight) / duration
  
  # Return the result
  return(result)
}
