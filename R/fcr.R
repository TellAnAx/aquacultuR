#' Feed Conversion Ratio (FCR)
#'
#' A function that calculates the Feed Conversion Ratio (FCR) based on
#' the Initial Body weight (IBW; ibw) in gram (g), the Final Body
#' Weight (FBW; fbw) in gram (g), the Feed fed (Ff; ff) in gram and the
#' dry matter (DM; dm) content of the feed in percent.
#'
#' The Feed Conversion Ratio (FCR) describes the amount of feed on dry matter
#' (DM) basis that is required to gain 1 kg of body weight on wet weight basis.
#' Depending on whether the Feed fed refers to the total amount of feed 
#' administered or the total amount corrected for non-eaten feed, the result 
#' resembles the economic FCR (eFCR) or the biological FCR (bFCR), respectively 
#' (Glencross et al., 2024).
#'
#' @param ibw numeric; value that is providing the initial weight in
#' grams.
#' @param fbw numeric; value that is providing the final weight in
#' grams.
#' @param ff numeric; value providing the feed fed in grams during the 
#' experiment.
#' @param dm numeric; value within the interval of ]0:1], indicating the 
#' relative dry matter content of the feed.
#'
#' @return returns a numeric value that is the FCR.
#'
#'
#' @author Anıl Axel Tellbüscher
#'
#'
#' @references Lugert, V., Thaller, G., Tetens, J., Schulz, C., & Krieter, J.
#' (2016): A review on fish growth calculation: multiple functions in fish
#' production and their specific application. Reviews in Aquaculture, 8,
#' p.30–42.
#' Glencross, B., Bachis, E., Robb, D., & Newton, R. (2024): The evolution of
#' sustainability metrics for the marine ingredient sector: Moving towards
#' holistic assessments of aquaculture feed. Reviews in Fisheries Science &
#' Aquaculture, 32(4), p.545-561.
#'
#'
#'
#' @export
fcr <- function(ibw, fbw, ff, dm = 1) {
  # Checks----
  ## Ensure inputs are numeric
  stopifnot(is.numeric(ibw),
            is.numeric(fbw),
            is.numeric(ff),
            is.numeric(dm))
  
  
  ## Ensure inputs have the same length
  input_lengths <- c(length(ibw), length(fbw), length(ff), length(dm))
  if (length(unique(input_lengths)) != 1) {
    stop("All input vectors must have the same length.")
  }
  
  
  ## Check whether inputs are >= 0
  if (any(ibw <= 0 | fbw <= 0 | ff <= 0)) {
    warning("Some input values are negative. The result is not meaningful.")
  }
  
  
  ## Check whether DM is within the interval ]0,1]
  if (any(dm <= 0 | dm > 1)) {
    warning("The DM content is outside of the interval ]0,1]. The result is not 
            meaningful.")
  }
  
  
  # Calculation----
  
  fcr <- (ff * dm) / (fbw - ibw)
  
  return(fcr)
}
