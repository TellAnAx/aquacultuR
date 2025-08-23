#' Metabolic bodyweight (MBW)
#'
#' The metabolic bodyweight is the rate of energy expenditure in dependence of
#' the bodyweight of an organism. The metabolism of larger animals is generally
#' slower per Kg when comparing with smaller animals. An exponent between 0-1
#' takes that relationship into account in a fairly simple equation.
#'
#' The default exponent is suited to fish only. It was set to 0.8 based on
#' Lupatsch et al. (2003) and should be adjusted to other scenarios.
#'
#' @param ibw a numeric value that is providing the initial weight in
#' grams.
#' @param fbw a numeric value that is providing the final weight in
#' grams.
#' @param mb_exp a numeric value between 0-1 providing the exponent. Default
#' is 0.8 adapted to most fish species.
#'
#' @return returns a numeric value that is the metabolic bodyweight.
#'
#' @examples
#' data(weight2)
#' dplyr::mutate(weight2, MBW = mbw(ibw_g, fbw_g))
#'
#' @author Anıl Axel Tellbüscher
#' @author Davide A. Machado e Silva
#' @author Madhav Karthikeyan
#'
#' @references Lupatsch, I. et al. (2003): Comparison of energy and protein
#' efficiency among three fish species gilthead sea bream (Sparus aurata),
#' European sea bass (Dicentrarchus labrax) and white grouper (Epinephelus
#' aeneus): energy expenditure for protein and lipid deposition. Aquaculture
#' 225, p.175-189.
#'
#' @importFrom dplyr mutate
#'
#' @export
mbw <- function(ibw, fbw, mb_exp = 0.8) {
  # Checks----
  ## Check whether inputs are NA
  stopifnot("Inputs cannot be NA" = any(c(!is.na(ibw), !is.na(fbw))))
  
  
  ## Check whether inputs are non-numeric
  stopifnot("All inputs must be numeric" = any(c(is.numeric(ibw), 
                                                 is.numeric(fbw))))
  
  
  ## Check whether inputs are < 0
  if (any(c(ibw, fbw) < 0))
    stop("Input values are zero or negative. Result cannot be calculated.")
  
  
  ## Check whether inputs are == 0
  if (any(c(ibw, fbw) == 0))
    warning("Input values are zero or negative. The result is not meaningful.")
  
  
  ## Check whether mb_exp is 0-1
  if (any(mb_exp > 1) | any(mb_exp < 0))
    warning("'mb_exp' should be between 0 and 1")
  
  
  ## Check whether inputs have the same length
  length_ratio <- c(length(ibw), length(fbw), length(mb_exp)) / length(ibw)
  if (any(length_ratio != 1))
    message("Input vectors do not have the same length.")
  
  
  
  # Calculations----
  gbw <- sqrt(ibw * fbw)
  
  mbw <- gbw^mb_exp
  
  return(mbw)
}
