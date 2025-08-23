#' Absolute Growth Rate (AGR)
#'
#' A function that calculates the Absolute Growth Rate (AGR), also denoted as
#' Weight Gain (WG) when applied to weight data.
#'
#'
#' @param ibw numeric; value that is providing the initial body weight in
#' grams.
#' @param fbw numeric; value that is providing the final body weight in
#' grams.
#' @param duration numeric value that is providing the duration of the
#' experiment in days.
#'
#' @return returns a numeric value which is the total body weight change
#' over the specified period of time.
#'
#' @examples
#' data(weight2)
#' dplyr::mutate(weight2, AGR = agr(ibw_g, fbw_g, duration = 84))
#'
#' @author Anıl Axel Tellbüscher
#' @author Madhav Karthikeyan
#' @author Davide A. Machado e Silva
#
#' @references Lugert, V., Thaller, G., Tetens, J., Schulz, C., & Krieter, J.
#' (2016): A review on fish growth calculation: multiple functions in fish
#' production and their specific application. Reviews in Aquaculture, 8,
#' p.30–42.
#' @references Hopkins K.D. (1992) Reporting fish growth, a review of the 
#' basics. Journal of World Aquaculture Society, 23, p.173-179
#'
#' @importFrom dplyr mutate
#'
#' @export
agr <- function(ibw, fbw, duration) {
  # Checks----
  ## Check whether input is NA
  if (any(is.na(c(ibw, fbw, duration))))
    stop("Inputs cannot be NA")
  
  
  if (any(!is.numeric(ibw) |
          !is.numeric(fbw) | !is.numeric(duration)))
    stop("All inputs must be numeric")
  
  if (any(duration == 0))
    stop("Duration == 0! The result cannot be calculated.")
  
  if (any(ibw <= 0 | fbw <= 0 | duration < 0))
    warning("Input is zero or negative! The result is not meaningful.")
  
  ## Check for inputs of differing length
  length_ratios <- c(length(ibw), length(fbw), length(duration)) / length(ibw)
  if (!all(length_ratios == 1))
    message("Inputs have different lengths.")
  
  
  
  # Calculations----
  agr <- (fbw - ibw) / duration
  
  return(agr)
}
