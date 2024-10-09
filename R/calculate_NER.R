# Calculate nutrient efficiency ratio
calculate_NER <- function(initWeight = NULL, finalWeight = NULL, weightGain = NULL, proteinFed = NULL) {
  
  if (((is.null(initWeight) | is.null(finalWeight)) & is.null(weightGain)) | is.null(proteinFed)) {
    stop("The Protein Efficiency Ratio cannot be calculated. Necessary data is missing.")
  }
  
  if(is.null(weightGain)) {
    weightGain <- finalWeight - initWeight  
  }
  
  result <- weightGain / proteinFed
  return(result)
}
