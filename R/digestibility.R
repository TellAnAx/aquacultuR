#' ADC of DM
#'
#' Function to calculate the Apparent Digestibility Coefficient (ADC) of
#' the dry matter fraction of a compound diet.
#'
#' @param std_diet a numeric value, resembling the inclusion rate of
#' standard in the experimental feed given to the livestock.
#' @param dm_diet a numeric value in the interval [0, 1], being the dry matter 
#' content of the feed. The default is 1 gram per gram
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
#'   dplyr::group_by(diet) %>%  
#'   dplyr::summarise(
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
adc_dm <- function(std_diet, 
                   dm_diet = 1,
                   std_feces) {
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





#' ADC of a feed ingredient (ADCingr)
#'
#' Function to calculate the Apparent Digestibility Coefficient of a nutrient
#' contained in a feed ingredient of a compound diet. The calculation of the
#' ADCingr is based on equation 4 proposed by Bureau & Hua (2006).
#'
#' @param adc_test a numeric value in the interval [0,1] that represents the
#' Apparent Digestibility Coefficient (ADC) of the diet that contains the
#' ingredient to be tested.
#' @param adc_ref a numeric value in the interval [0,1] that represents the
#' Apparent Digestibility Coefficient (ADC) of the reference diet without the
#' ingredient to be tested.
#' @param nut_ref a numeric value in the interval [0,1] that represents the
#' inclusion rate of the nutrient in the reference diet.
#' @param nut_ingr a numeric value in the interval [0,1] that represents the
#' inclusion rate of the nutrient in the test diet for which the Apparent
#' Digestibility Coefficient (ADC) of the nutrient in the ingredient will be
#' calculated.
#' @param dm_ref a numeric value in the interval [0,1] (default: 1) that 
#' represents the dry matter content of the reference diet.
#' @param dm_ingr a numeric value in the interval [0,1] (default: 1) that
#' represents the dry matter content of the tested feed ingredient.
#' @param incl_ingr a numeric value in the interval [0,1] (default: 0.3) that 
#' represents the inclusion rate of the ingredient in the test diet for which 
#' the Apparent Digestibility Coefficient (ADC) of the nutrient in an 
#' ingredient will be calculated.
#'
#' @return returns a single numeric value in the interval [0, 1], which is the
#' relative ADC for the diet. If the value is not within the interval, an
#' additional warning is returned.
#'
#' @examples
#' # Example from Bureau et al. (1999) - Blood meal 2
#' 
#' # reference feed dry matter: 0.928 (92.8%)
#' # reference feed nutrient mass frac.: 0.45 (45%)
#' # reference feed apparent digestibility coef.: 0.923 (92.3%)
#' # test feed apparent digestibility coef.: 0.902 (90.2%)
#' # test ingredient dry matter: 0.895 (89.5%)
#' # test ingredient nutrient mass frac.: 0.846 (84.6%)
#' 
#' adc_ingr(adc_ref = 0.923, 
#'          nut_ref = 0.45, 
#'          dm_ref = 0.928,
#'          adc_test = 0.902, 
#'          nut_ingr = 0.846,
#'          dm_ingr = 0.895)
#'
#' @author Anıl Axel Tellbüscher
#'
#' @references Bureau, D. P., & Hua, K. (2006): Letter to the Editor of
#' Aquaculture. Aquaculture, 252, p.103–105.
#' @references Bureau, D. P., Harris, A. M., & Cho, C. Y. (1999): Apparent 
#' digestibility of rendered animal protein ingredients for rainbow trout 
#' (Oncorhynchus mykiss). Aquaculture 180, p.345-358.
#'
#' @export
adc_ingr <- function(adc_test,
                     adc_ref,
                     nut_ref,
                     nut_ingr,
                     dm_ref = 1,
                     dm_ingr = 1,
                     incl_ingr = 0.3) {
  # Checks----
  ## Ensure inputs are numeric
  stopifnot(
    is.numeric(adc_test),
    is.numeric(adc_ref),
    is.numeric(nut_ref),
    is.numeric(nut_ingr),
    is.numeric(incl_ingr),
    is.numeric(dm_ref),
    is.numeric(dm_ingr)
  )
  
  
  ## Ensure all inputs have the same length
  input_lengths <- c(
    length(adc_test),
    length(adc_ref),
    length(nut_ref),
    length(nut_ingr),
    length(incl_ingr),
    length(dm_ref),
    length(dm_ingr)
  )
  if (length(unique(input_lengths)) != 1) {
    warning("Input vectors do not have the same length. The matching might be
            incorrect.")
  }
  
  
  ## Warn if inputs are < 0
  if (any(adc_test < 0 |
          adc_ref < 0 |
          nut_ref < 0 |
          nut_ingr < 0 |
          incl_ingr < 0 |
          dm_ref < 0 |
          dm_ingr < 0)) {
    warning("Some input values are negative. The result is not meaningful.")
  }
  
  
  
  # Calculations----
  adc_ingr <- adc_test + ((adc_test - adc_ref) * 
                            (((1 - incl_ingr) * nut_ref * dm_ref) /
                               (incl_ingr * nut_ingr * dm_ingr)))
  
  
  if (any(adc_ingr > 1)) {
    warning("ADC > 1")
  }
  
  
  return(adc_ingr)
}

