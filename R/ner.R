#' Nutrient Efficiency Ratio (NER)
#' 
#' Function to calculate the Nutrient Efficiency Ratio (NER)
#' 
#' It should be noted that all input values must be provided in the same unit.
#' 
#' @param m_start a numeric value for the initial weight (either average
#' weight of the individuals or the total biomass) of the livestock at the
#' beginning of the feeding trial.
#' @param m_end a numeric value for the final weight (either average
#' weight of the individuals or the total biomass) of the livestock at the end
#' of the feeding trial.
#' @param ag optional; can be provided instead of the initial and final
#' weight.
#' @param fi numeric; value providing the total feed intake in grams during the 
#' experiment.
#' @param dm numeric; value within the interval of (0,1), indicating the dry matter
#' content of the feed.
#' @param nut_f numeric; value within the interval of (0,1), indicating the 
#' inclusion rate of the nutrient of interest in the feed fed.
#' 
#' @return returns a single numeric value
#' 
#' 
#' @author Anıl Axel Tellbüscher 
#' 
#' @examples
#' # Calculate the NER using the initial and final weight
#' ner(m_start = 1, m_end = 10, fi = 24, nut_f = 0.5)
#' 
#' # Calculate the NER using the weight gain instead
#' ner(ag = 9, fi = 24, nut_f = 0.5)
#' 
#' @export
ner <- function(m_start = NULL, 
                m_end = NULL, 
                ag = NULL, 
                fi = NULL,
                dm = 1,
                nut_f = NULL) {
  #Checks
  
  # 1. Check for non-numeric or NA values -> error
  for (nm in names(all_inputs)) {
    if (!is.numeric(all_inputs[[nm]]) || is.na(all_inputs[[nm]])) {
      stop(paste(nm, "must be numeric and not NA"))
    }
  }
  
  # 2. Check for negative values -> error
  for (nm in names(all_inputs)) {
    if (all_inputs[[nm]] < 0) {
      stop(paste(nm, "must be non-negative"))
    }
  }
  
  # 3. Check m_start > m_end -> error
  if (m_start > m_end) {
    stop("m_start cannot be greater than m_end")
  }
  
  # 4. Warn if any value is exactly 0
  if (any(unlist(all_inputs) == 0)) {
    warning("One or more inputs are zero; results may not be valid")
  }
  
  if(is.null(ag)) 
    ag <- m_end - m_start  
  
  ner <- ag / (fi * dm * nut_f)
  return(ner)
}
