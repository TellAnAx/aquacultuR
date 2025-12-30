#' Nutrient retention (NR)
#'
#' Function to calculate the Nutrient Retention (NR). The NR 
#' belongs to the Nutrient Use Efficiency metrics and is a measure for the 
#' proportion of a consumed nutrient that is retained in the tissue.
#'
#' @param ibw numeric; initial weight in grams
#' @param fbw numeric; final weight in grams
#' @param ibn numeric; initial mass fraction of the target nutrient in the 
#' tissue of the experimental animal (on dry matter basis). The value must be 
#' between 0 and 1.
#' @param fbn numeric; final mass fraction of the target nutrient in the tissue
#' of the experimental animal (on dry matter basis). The value must be between 
#' 0 and 1.
#' @param fi numeric; mass of feed given.
#' @param nut_f numeric; mass fraction of nutrient in the diet. The value 
#' must be between 0 and 1.
#' @param dm numeric; dry matter content of feed. Default is 1.
#' @param dm_ib numeric; initial dry matter content of body tissue. Default is 
#' 1.
#' @param dm_fb numeric; final dry matter content of body tissue. Default is 1.
#'
#' @return a numeric value. Multiply by 100 to convert into percentage.
#'
#' @examples
#' # initial bodyweight = 10 g (0.01 kg)
#' # final bodyweight = 100 g (0.1 kg)
#' # initial mass fraction of N = 128 g/kg (80% CP on DM basis)
#' # final mass fraction of N = 132 g/kg (82.5% CP on DM basis)
#' # feed intake = 200 g (0.2 kg)
#' # N in feed = 72 g/kg (45% CP)
#'
#' nr(10, 100, 0.128, 0.132, 200, 0.072) * 100
#'
#' # 82.7% of the provided N has been retained
#'
#'
#' # multiple fish
#' nr(ibw = 10, fbw = c(93, 102, 99, 98, 101, 132),
#'    ibn = 0.128, fbn = 0.132,
#'    fi = 200, nut_f = 0.072)
#'
#' @author Anıl Axel Tellbüscher
#'
#' @references Willer, D.F., Newton, R., Malcorps, W. et al. Wild fish
#' consumption can balance nutrient retention in farmed fish. Nat Food 5,
#' 221–229 (2024). https://doi.org/10.1038/s43016-024-00932-z
#' 
#' @export
nr <- function(ibw, 
               fbw, 
               ibn, 
               fbn, 
               fi,
               nut_f,
               dm = 1,
               dm_ib = 1,
               dm_fb = 1) {
  # Checks----
  ## Check whether inputs are NA
  if(any(is.na(ibw) | 
         is.na(fbw) | 
         is.na(ibn) | 
         is.na(fbn) | 
         is.na(fi) | 
         is.na(dm) | 
         is.na(dm_ib) |
         is.na(dm_fb) |
         is.na(nut_f)
         ))
    stop("Inputs must not be NA!")
  
  ## Check whether inputs are numeric
  if(any(!is.numeric(ibw) | 
         !is.numeric(fbw) | 
         !is.numeric(ibn) | 
         !is.numeric(fbn) | 
         !is.numeric(fi) | 
         !is.numeric(dm) | 
         !is.numeric(dm_ib) | 
         !is.numeric(dm_fb) | 
         !is.numeric(nut_f)
         ))
    stop("Inputs must be numeric!")
  
  ## Check whether feed|nut_f == 0
  if (any(fi == 0 | nut_f == 0 | dm == 0 | dm_ib == 0 | dm_fb == 0))
    stop("Input must not be zero! Result cannot be calculated.")
  
  
  ## Check whether inputs are within the range
  if (any(ibw <= 0))
    warning("ibw is <= 0! The result is not meaningful.")
  if (any(fbw <= 0))
    warning("fbw is <= 0! The result is not meaningful.")
  if (any(fi < 0))
    warning("fi is < 0! The result is not meaningful.")
  if (any(ibn <= 0 | ibn > 1))
    warning("ibn is out of range! The result is not meaningful.")
  if (any(dm < 0 | dm > 1))
    warning("dm is out of range! The result is not meaningful.")
  if (any(dm_ib < 0 | dm_ib > 1))
    warning("dm_ib is out of range! The result is not meaningful.")
  if (any(dm_fb < 0 | dm_fb > 1))
    warning("dm_fb is out of range! The result is not meaningful.")
  if (any(fbn <= 0 | fbn > 1))
    warning("fbn is out of range! The result is not meaningful.")
  if (any(nut_f < 0 | nut_f > 1))
    warning("nut_f is out of range! The result is not meaningful.")
  
  ## Check ibw > fbw
  if (any(ibw > fbw))
    warning("ibw is greater than fbw.")
  
  ## Check whether inputs are of same length
  length_ratio <- c(length(ibw),
                    length(fbw),
                    length(ibn),
                    length(fbn),
                    length(fi),
                    length(dm),
                    length(dm_fb),
                    length(dm_ib),
                    length(nut_f)) / length(ibw)
  if (any(length_ratio != 1))
    message("Inputs differ in length.")
  
  
  
  # Calculations----
  numerator <- (fbw * fbn * dm_fb) - (ibw * ibn * dm_ib)
  denominator <- fi * dm * nut_f
    
  nr <-  numerator / denominator 
  
  return(nr)
}





#' Nutrient Efficiency Ratio (NER)
#'
#' Function to calculate the Nutrient Efficiency Ratio (NER). The NER belongs 
#' to the Nutrient Use Efficiency metrics and relates the intake of a compound 
#' with the bodyweight increase. If the feed intake (FI) is restricted and the 
#' administered diets are of comparable digestibility, then potential 
#' differences in growth could be related to differences in the sub-composition 
#' of target nutrients that are also controlled for. This would be reflected by 
#' the NER.
#'
#' @param ibw a numeric value for the initial weight (either average
#' weight of the individuals or the total biomass) of the livestock at the
#' beginning of the feeding trial.
#' @param fbw a numeric value for the final weight (either average
#' weight of the individuals or the total biomass) of the livestock at the end
#' of the feeding trial.
#' @param fi numeric; value providing the total feed intake in grams during the
#' experiment.
#' @param dm numeric; value within the interval of (0,1), indicating the dry 
#' matter content of the feed. Default is 1 (100\%).
#' @param nut_f numeric; value within the interval of (0,1), indicating the
#' inclusion rate of the nutrient of interest in the feed fed.
#'
#' @returns returns a single numeric value
#'
#' @examples
#' # Initial bodyweight = 10 g
#' # Final bodyweight = 100 g
#' # Feed intake = 240 g
#' # Nutrient mass fraction in feed = 0.5 g/g
#' ner(ibw = 10, fbw = 100, fi = 240, nut_f = 0.5)
#'
#' @author Anıl Axel Tellbüscher
#'
#' @export
ner <- function(ibw, fbw, fi, nut_f, dm = 1) {
  # Checks----
  ## Check whether inputs are NA
  if(any(is.na(ibw) | 
         is.na(fbw) | 
         is.na(fi) | 
         is.na(dm) | 
         is.na(nut_f)
  ))
    stop("Inputs must not be NA!")
  
  ## Check whether inputs are numeric
  if(any(!is.numeric(ibw) | 
         !is.numeric(fbw) | 
         !is.numeric(fi) | 
         !is.numeric(dm) | 
         !is.numeric(nut_f)
  ))
    stop("Inputs must be numeric!")
  
  
  ## Check for c(fi, dm, nut_f) == 0
  if (any(c(fi, dm, nut_f) == 0))
    stop("Inputs must not be zero! Result cannot be calculated.")
  
  ## Check whether inputs are within the range
  if (any(ibw <= 0))
    warning("ibw is <= 0! The result is not meaningful.")
  if (any(fbw <= 0))
    warning("fbw is <= 0! The result is not meaningful.")
  if (any(fi < 0))
    warning("fi is < 0! The result is not meaningful.")
  if (any(dm < 0 | dm > 1))
    warning("dm is out of range! The result is not meaningful.")
  if (any(nut_f < 0 | nut_f > 1))
    warning("nut_f is out of range! The result is not meaningful.")
  
  ## Check ibw > fbw
  if (any(ibw > fbw))
    warning("ibw is greater than fbw.")
  
  
  ## Check for inputs of differing length
  length_ratios <- c(length(ibw),
                     length(fbw),
                     length(fi),
                     length(nut_f),
                     length(dm)) / length(dm)
  if (!all(length_ratios == 1))
    message("Inputs have different lengths.")
  
  
  
  # Calculations----
  ## Numerator
  numerator <- ag(ibw, fbw)
  denominator <- fi * dm * nut_f
  
  
  ner <- numerator / denominator
  
  return(ner)
}
