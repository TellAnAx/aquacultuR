#
#  TITLE: 
#         Function - geomWeight(initWeight, finalWeight)
#
#  DESCRIPTION:
#         A function that calculates the geometric mean bodyweight.
#
#
#
# written by: Anil Axel Tellbuescher
#
# date written:   December 18th, 2021
# last modified:  August 25th, 2024
#
#
#
###############################################################################






#' Geometric Bodyweight
#' 
#' A function that calculates the geometric mean bodyweight.
#' 
#' %% ~~ If necessary, more details than the description above ~~
#' 
#' @param initWeight a numeric value that is providing the initial weight in
#' grams.
#' @param finalWeight a numeric value that is providing the final weight in
#' grams.
#' @return returns a numeric value that is the geometric bodyweight.
#' 
#' @note %% ~~further notes~~
#' 
#' @author Anıl Axel Tellbüscher
#' 
#' @seealso \code{\link[Aquaculture Formulary]{https://blog.tellbuescher.online/formulary}}
#' 
#' @references %% ~put references to the literature/web site here ~
#' 
#' @examples
#' 
#' @export calculate_geomWeight
calculate_geomWeight <- function(initWeight, finalWeight){
  
  # Calculate the geometric mean bodyweight
  result = sqrt(initWeight * finalWeight) 
  
  # Return the result
  return(result)
}
