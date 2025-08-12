#' Relative Growth (RG)
#'
#' A function that calculates the Relative Growth (RG) based on the 
#' Initial Body weight (IBW; ibw) and the Final Body Weight (FBW; fbw)
#' in grams (g).
#'
#' @param ibw numeric; value providing the initial weight in grams.
#' @param fbw numeric; value providing the final weight in grams.
#'
#' @return returns a numeric value that is the Relative Growth. Multiply by 100
#' for conversion into a percentage.
#'
#' @author Anıl Axel Tellbüscher
#'
#'
#' @importFrom dplyr mutate
#'
#' @examples
#' data(weight2)
#'
#' dplyr::mutate(weight2, RG = rg(W_start, W_end))
#'
#'
#'
#' @export
rg <- function(ibw,
               fbw) {
  
  # Checks----
  
  ## Ensure inputs are numeric
  stopifnot(is.numeric(ibw), is.numeric(fbw))
  
  ## Check whether inputs are > 0
  if (any(ibw < 0 | fbw < 0)) {
    warning("Some input values are negative. The result may not be meaningful.")
  }
  
  ## Check whether inputs have the same length
  if (length(ibw) != length(fbw)) {
    message("Inputs are of different length.")
  }
  
  
  
  # Calculations----
  ## Calculate RG
  rg <- (fbw - ibw) / ibw
  
  ## Return result
  return(rg)
}