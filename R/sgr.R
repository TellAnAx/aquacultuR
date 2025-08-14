#' Specific Growth Rate (SGR)
#'
#' This function calculates the Specific Growth Rate (SGR) based on
#' the Instantaneous Growth Rate (IGR). The IGR is a useful
#' metric, although hard to interpret. The SGR, derived from IGR, can then be easily
#' interpreted as the percentage of Body Weight gained each day.
#' The SGR is a growth metric for aquaculture products (e.g., fish,
#' crustaceans, bivalves, algae), describing the increase in body weight over
#' a period of time. Body weight can be substituted by other metrics,
#' such as length. However, body weight is the used in the vast majority
#' of studies and alternatives are not advised for the sake of consistency.
#'
#' @param ibw numeric; value that is providing the initial body weight in
#' grams.
#' @param fbw numeric; value that is providing the final body weight in
#' grams.
#' @param duration numeric value that is providing the duration of the
#' experiment in days.
#' @param return_igr logical; default is FALSE. Indicates whether the instantaneous
#' growth rate shall be returned together with the SGR or not.
#'
#' @return Returns a numeric, which is the SGR as percentage of the body 
#' weight gain per day, or a list containing the SGR and the IGR.
#'
#' @author Anıl Axel Tellbüscher
#' @author Davide A. Machado e Silva
#'
#' @references Crane, D.P., Ogle, D.H. and Shoup, D.E. (2020), Use and misuse
#' of a common growth metric: guidance for appropriately calculating and
#' reporting specific growth rate. Rev Aquacult, 12: 1542-1547.
#' https://doi.org/10.1111/raq.12396
#'
#' @importFrom dplyr mutate
#'
#' @examples
#' data(weight2)
#'
#' dplyr::mutate(weight2, SGR = sgr(W_start, W_end, duration = 84))
#'
#'
#'
#' @export
sgr <- function(ibw, 
                fbw, 
                duration, 
                return_igr = FALSE){

  # Checks----
  
  ## Check whether inputs are NA
  if (any(is.na(c(ibw, fbw, duration)))) 
    stop("Inputs cannot be NA")
  
  ## Check whether inputs are non-numeric
  if (any(!is.numeric(ibw) | !is.numeric(fbw) | !is.numeric(duration)))
    stop("All inputs must be numeric")

  
  if (any(duration == 0))
    stop("Input == 0! The result cannot be calculated.")
  
  if (any(ibw <= 0 | fbw <= 0))
    stop("Input <= 0! The result cannot be calculated.")
  
  
  if (any(duration < 0)) 
    warning("Input is negative! The result is not meaningful.")
  
  
  ## Check for inputs of differing length
  length_ratios <- c(length(ibw), length(fbw), length(duration)) / length(ibw)
  if(!all(length_ratios == 1))
    message("Inputs have different lengths.")
  
  

  # Calculations----
  ## Calculate IGR
  igr <- (logb(fbw / ibw)) / duration

  ## Calculate the SGR based on IGR
  sgr <- ((exp(igr)) - 1) * 100

  ## Return the result
  if (return_igr) {
    return(list(sgr = sgr, igr = igr))
  } else {
    return(sgr)
  }
}
