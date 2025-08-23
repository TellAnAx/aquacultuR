#' Geometric Mean Bodyweight (GMBW)
#'
#' A function that calculates the geometric mean of the initial and final
#' bodyweight.
#'
#' While the arithmetic mean assumes a linear relationship between the averaged
#' numbers, the geometric mean accounts for the non-linear and potentially 
#' variable nature of animal growth.
#'
#'
#' @param ibw numeric; initial bodyweight weight in grams.
#' @param fbw numeric; final bodyweight in grams.
#'
#' @return numeric value that is the geometric mean bodyweight.
#'
#'
#' @author Anıl Axel Tellbüscher
#'
#'
#' @importFrom dplyr mutate
#'
#' @examples
#' data(weight2)
#'
#' dplyr::mutate(weight2, GMBW = gbw(W_start, W_end))
#'
#'
#'
#' @export
gbw <- function(ibw, fbw) {
  # Checks----
  ## Check whether inputs are NA
  stopifnot("Inputs must not be NA!" = any(!is.na(c(ibw, fbw))))
  
  
  ## Check whether inputs are numeric
  stopifnot("Inputs must be numeric!" = any(is.numeric(c(ibw, fbw))))
  
  
  ## Check whether inputs are < 0
  stopifnot("Inputs are < 0! Result cannot be calculated." = all(c(ibw, 
                                                                   fbw) >= 0))
  
  
  # Check whether inputs are == 0
  if (any(c(ibw, fbw) == 0))
    warning("Inputs are == 0! The result is not meaningful.")
  
  
  ## Check whether inputs have the same length
  length_ratio <- c(length(ibw), length(fbw)) / length(ibw)
  if (any(length_ratio != 1))
    message("Inputs have different lengths.")
  
  
  
  # Calculations----
  gbw <- sqrt(ibw * fbw)
  
  
  return(gbw)
}
