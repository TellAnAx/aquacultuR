#' NER
#' 
#' Function to calculate the Nutrient Efficiency Ratio (NER)
#' 
#' It should be noted that all input values must be provided in the same unit.
#' 
#' @param initWeight a numeric value for the initial weight (either average
#' weight of the individuals or the total biomass) of the livestock at the
#' beginning of the feeding trial.
#' @param finalWeight a numeric value for the final weight (either average
#' weight of the individuals or the total biomass) of the livestock at the end
#' of the feeding trial.
#' @param weightGain optional; can be provided instead of the initial and final
#' weight.
#' @param nutrFed a numeric value for the amount of nutrient fed during the
#' feeding trial.
#' @return returns a single numeric value
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
#' # Calculate the NER using the initial and final weight
#' calculate_NER(initWeight = 1, finalWeight = 10, nutrFed = 12)
#' 
#' # Calculate the NER using the weight gain instead
#' calculate_NER(weightGain = 9, nutrFed = 12)
#' 
calculate_NER <- function(initWeight = NULL, finalWeight = NULL, weightGain = NULL, nutrFed = NULL) {
  
  if (((is.null(initWeight) | is.null(finalWeight)) & is.null(weightGain)) | is.null(nutrFed)) {
    stop("The Nutrient Efficiency Ratio cannot be calculated. Necessary data is missing.")
  }
  
  if(is.null(weightGain)) {
    weightGain <- finalWeight - initWeight  
  }
  
  result <- weightGain / nutrFed
  return(result)
}
