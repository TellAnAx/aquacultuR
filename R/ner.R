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
#' @param m_gain optional; can be provided instead of the initial and final
#' weight.
#' @param nut_fed a numeric value for the amount of nutrient fed during the
#' feeding trial.
#' 
#' @return returns a single numeric value
#' 
#' 
#' @author Anıl Axel Tellbüscher 
#' 
#' @examples
#' # Calculate the NER using the initial and final weight
#' ner(m_start = 1, m_end = 10, nut_fed = 12)
#' 
#' # Calculate the NER using the weight gain instead
#' ner(m_gain = 9, nut_fed = 12)
#' 
#' @export
ner <- function(m_start = NULL, 
                m_end = NULL, 
                m_gain = NULL, 
                nut_fed = NULL) {
  
  if (((is.null(m_start) | is.null(m_end)) & is.null(m_gain)) | is.null(nut_fed)) {
    stop("The Nutrient Efficiency Ratio cannot be calculated. Necessary data is missing.")
  }
  
  if(is.null(m_gain)) {
    m_gain <- m_end - m_start  
  }
  
  ner <- m_gain / nut_fed
  return(ner)
}
