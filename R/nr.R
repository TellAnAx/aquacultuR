#' Nutrient retention (NR)
#'
#' Function to calculate the nutrient retention
#'
#' @param ibw numeric; initial weight in grams
#' @param fbw numeric; final weight in grams
#' @param ibn numeric; initial mass fraction of the target nutrient in the 
#' tissue of the experimental animal (on dry matter basis). The value must be 
#' between 0 and 1.
#' @param fbn numeric; final mass fraction of the target nutrient in the tissue
#' of the experimental animal (on dry matter basis). The value must be between 
#' 0 and 1.
#' @param fi numeric; mass of feed given
#' @param nut_diet numeric; mass fraction of nutrient in the diet. The value 
#' must be between 0 and 1.
#'
#' @return a numeric value. Multiply by 100 to convert into percentage.
#'
#' @references Willer, D.F., Newton, R., Malcorps, W. et al. Wild fish
#' consumption can balance nutrient retention in farmed fish. Nat Food 5,
#' 221–229 (2024). https://doi.org/10.1038/s43016-024-00932-z
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
#'    fi = 200, nut_diet = 0.072)
#'
#'
#' @author Anıl Axel Tellbüscher
#'
#' @export
nr <- function(ibw, fbw, ibn, fbn, fi, nut_diet) {
  # Checks----
  ## Check whether inputs are NA
  if (any(is.na(c(ibw, fbw, ibn, fbn, fi, nut_diet))))
    stop("Inputs must not be NA!")
  
  
  ## Check whether inputs are non-numeric
  if (any(!is.numeric(c(ibw, fbw, ibn, fbn, fi, nut_diet))))
    stop("Inputs must be numeric!")
  
  
  ## Check whether feed|nut_diet == 0
  if (any(fi == 0 | nut_diet == 0))
    stop("Input must not be zero! Result cannot be calculated.")
  
  
  ## Check whether inputs are within the range
  if (any(ibw <= 0))
    warning("ibw is <= 0! The result is not meaningful.")
  if (any(fbw <= 0))
    warning("fbw is <= 0! The result is not meaningful.")
  if (any(fi < 0))
    warning("fi is < 0! The result is not meaningful.")
  if (any(ibn < 0 | ibn > 1))
    warning("ibn is out of range! The result is not meaningful.")
  if (any(fbn < 0 | fbn > 1))
    warning("fbn is out of range! The result is not meaningful.")
  if (any(nut_diet < 0 | nut_diet > 1))
    warning("nut_diet is out of range! The result is not meaningful.")
  
  
  ## Check whether inputs are of same length
  length_ratio <- c(length(ibw),
                    length(fbw),
                    length(ibn),
                    length(fbn),
                    length(fi),
                    length(nut_diet)) / length(ibw)
  if (any(length_ratio != 1))
    message("Inputs differ in length.")
  
  
  
  # Calculations----
  nr <- (fbw * fbn - ibw * ibn) / (fi * nut_diet)
  
  return(nr)
}
