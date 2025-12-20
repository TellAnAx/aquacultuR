#' ADC of DM
#'
#' Function to calculate the Apparent Digestibility Coefficient (ADC) of
#' the dry matter fraction of a compound diet.
#'
#' @param dm_diet a numeric value, being the dry matter content of the diet
#' @param std_diet a numeric value, resembling the inclusion rate of
#' standard in the experimental diet given to the livestock.
#' @param std_feces a numeric value, resembling the inclusion rate of
#' standard in the feces recovered during the digestibility trial.
#'
#' @return returns a single numeric value in the interval [0, 1], which is
#' the relative ADC for the dry matter content of the diet. If the value is
#' not within the interval, an additional warning is returned.
#'
#' @examples
#' # use function to calculate a single ADC value
#' 
#' # 900 g/kg (90%) dry matter content of feed
#' # 10 g/kg (1%) digestibility standard in feed
#' # 45 g/kg (4.5%) digestibility standard in feces
#' adc_dm(dm_diet = 0.95, std_diet = 0.01, std_feces = 0.045)
#' 
#' 
#' # function can also be used within a tidyverse pipeline.
#' digestdm %>% 
#'   group_by(diet) %>% 
#'   summarise(
#'     `ADC DM` = adc_dm(dm = dm, 
#'                       std_diet = std_feed, 
#'                       std_feces = std_feces))
#'
#' @author Anıl Axel Tellbüscher
#'
#' @references Bureau, D. P., Harris, A. M. & Cho, C. Y. (1999): Apparent
#' digestibility of rendered animal protein ingredients for rainbow trout
#' (Oncorhynchus mykiss). Aquaculture, 180, p.345-358.
#'
#' @export
adc_dm <- function(dm_diet, std_diet, std_feces) {
  # Checks----
  ## Ensure inputs are numeric
  stopifnot(is.numeric(std_diet),
            is.numeric(std_feces),
            is.numeric(dm_diet))
  
  
  ## Ensure all inputs have the same length
  input_lengths <- c(length(dm_diet), length(std_diet), length(std_feces))
  if (length(unique(input_lengths)) != 1) {
    stop("All input vectors must have the same length.")
  }
  
  
  ## Check whether inputs are > 0
  if (any(std_diet < 0 | std_feces < 0 | dm_diet < 0)) {
    warning("Some input values are negative. The result may not be meaningful.")
  }
  
  
  # Calculations----
  adc_dm <- 1 - (dm_diet * std_diet / std_feces)
  
  if (adc_dm > 1) {
    warning("ADC > 1")
  }
  
  return(adc_dm)
}
