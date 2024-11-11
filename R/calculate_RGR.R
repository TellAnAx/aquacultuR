#
#  TITLE: 
#         Function - calculate_RGR(initWeight, finalWeight, duration)
#
#  DESCRIPTION:
#         A function that calculates the Relative Growth Rate (RGR).
#
#
#
# written by: Anil Axel Tellbuescher
#
# date written:   December 18th, 2021
# last modified:  December 18th, 2021
#
#
#
###############################################################################






#' Relative Growth Rate
#' 
#' A function that calculates the Relative Growth Rate (RGR).
#' 
#' %% ~~ If necessary, more details than the description above ~~
#' 
#' @param initWeight a numeric value that is providing the initial weight in
#' grams.
#' @param finalWeight a numeric value that is providing the final weight in
#' grams.
#' @param duration a numeric value describing the duration of the growth experiment.
#' @return returns a numeric value that is the RGR.
#' 
#' @note %% ~~further notes~~
#' 
#' @author Anıl Axel Tellbüscher
#' 
#' @seealso %% ~~objects to See Also as \code{\link{help}}, ~~~
#' 
#' @references Lugert, V., Thaller, G., Tetens, J., Schulz, C., & Krieter, J.
#' (2016): A review on fish growth calculation: multiple functions in fish
#' production and their specific application. Reviews in Aquaculture, 8,
#' p.30–42.
#' 
#' @examples
#' 
#' @export calculate_RGR
calculate_RGR <- function(initWeight, finalWeight, duration){
  
  # Calculate the relative growth rate
  result = (finalWeight - initWeight) / (duration * sqrt(finalWeight * initWeight))
  
  # Return the result
  return(result)
}
