#' ADC of a nutrient (ADCnut)
#'
#' Function to calculate the Apparent Digestibility Coefficient of a nutrient
#' in the dry matter fraction of a compound diet.
#'
#' @param std_diet numeric; value resembling the inclusion rate of
#' standard in the experimental diet given to the livestock.
#' @param std_feces numeric; value resembling the inclusion rate of
#' standard in the feces recovered during the digestibility trial.
#' @param nut_diet numeric; value representing the inclusion rate of the
#' target nutrient in the diet.
#' @param nut_feces numeric; value representing the inclusion rate of the
#' target nutrient in the feces.
#'
#' @return returns a single numeric value in the interval [0, 1] which is the
#' relative ADC for a single nutrient in the diet. If the value is not within
#' the interval, an additional warning is returned.
#'
#' @examples
#' # 0.4 g/g (40%) CP on dry matter basis in feed
#' # 0.1 g/g (10%) CP on dry matter basis in feces
#' # 0.010 g/g (1%) digestibility standard in feed
#' # 0.045 g/g (4.5%) digestibility standard in feces
#' 
#' adc_nut(nut_diet = 0.4, nut_feces = 0.1, 
#'         std_diet = 0.01, std_feces = 0.045)
#'
#' @author Anıl Axel Tellbüscher
#'
#' @references Bureau, D.P., & Hua, K. (2006): Letter to the Editor of
#' Aquaculture. Aquaculture, 252, p.103–105.
#' @references Cho, C.Y., Slinger, S.J., & Bayley, H.S. (1982): Bioenergetics 
#' of salmonid fishes: energy intake, expenditure and productivity. Comp. 
#' Biochem. Physiol. 73B, p.25–41.
#'
#'
#' @export
adc_nut <- function(std_diet, std_feces, nut_diet, nut_feces) {
  # Checks----
  ## Ensure inputs are numeric
  stopifnot(
    is.numeric(std_diet),
    is.numeric(std_feces),
    is.numeric(nut_diet),
    is.numeric(nut_feces)
  )
  
  
  ## Ensure inputs have the same length
  input_lengths <- c(length(std_diet),
                     length(std_feces),
                     length(nut_diet),
                     length(nut_feces))
  if (length(unique(input_lengths)) != 1)
    stop("All input vectors must have the same length.")
  
  
  ## Check whether inputs are > 0
  if (any(std_diet < 0 |
          std_feces < 0 | nut_diet < 0 | nut_feces < 0)) {
    warning("Some input values are negative. The result may not be meaningful.")
  }
  
  
  # Calculations----
  adc_nut <- (1 - (std_diet / std_feces) * (nut_feces / nut_diet))
  
  if (adc_nut > 1) {
    warning("ADC > 1")
  }
  
  return(adc_nut)
}
