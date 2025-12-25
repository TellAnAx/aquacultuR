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
#' @param feed numeric; value providing the feed fed in grams during the 
#' experiment.
#' @param dm numeric; value within the interval of ]0:1], indicating the 
#' relative dry matter content of the feed.
#'
#' @return returns a numeric value that is the FCR.
#'
#' @examples
#' # Feed intake = 1500 g
#' # Feed dry matter = 0.96 g/g (= 96%)
#' # Initial bodyweight = 100 g
#' # Final bodyweight = 1000 g
#' 
#' fcr(100, 1000, 1500, 0.96)
#' 
#' @author Anıl Axel Tellbüscher
#'
#' @references Lugert, V., Thaller, G., Tetens, J., Schulz, C., & Krieter, J.
#' (2016): A review on fish growth calculation: multiple functions in fish
#' production and their specific application. Reviews in Aquaculture, 8,
#' p.30–42.
#' @references Glencross, B., Bachis, E., Robb, D., & Newton, R. (2024): The evolution of
#' sustainability metrics for the marine ingredient sector: Moving towards
#' holistic assessments of aquaculture feed. Reviews in Fisheries Science &
#' Aquaculture, 32(4), p.545-561.
#'
#' @export
fcr <- function(ibw, fbw, feed, dm = 1) {
  # Checks----
  ## Ensure inputs are numeric
  stopifnot(is.numeric(ibw),
            is.numeric(fbw),
            is.numeric(feed),
            is.numeric(dm))

  
  ## Ensure inputs have the same length
  input_lengths <- c(length(ibw), length(fbw), length(feed), length(dm))
  if (length(unique(input_lengths)) != 1) {
    stop("All input vectors must have the same length.")
  }
 
  ## Check whether inputs == 0
  if (any(feed == 0))
    stop("Feed given or feed intake is zero. The result cannot be calculated.")
  
  if (any(dm == 0))
    stop("Dry matter is zero. The result cannot be calculated.")
  
  
  ## Check whether inputs are < 0
  if (any(c(ibw, fbw) < 0) | any(feed < 0))
    warning("Inputs are negative. The result is not meaningful.")
    return(NA) #Returning NAs so AG calculation does not interfere with the tests
  }
  
  
  ## Check whether DM is within the interval ]0,1]
  if (any(dm <= 0 | dm > 1)) {
    warning("The DM content is outside of the interval ]0,1]. The result is not 
            meaningful.")
  }
  
  ## Check whether FCR is negative
  if (any(ibw > fbw)) {
    warning("FCR is negative. The result may not be
            meaningful.")
  }
  
  # Calculation----
  
  numerator <- feed * dm
  denominator <- ag(ibw, fbw)
  
  fcr <- numerator / denominator
  
  return(fcr)
}


#' Feed conversion efficiency (FCE)
#'
#' A function that calculates the feed conversion efficiency (FCE), which is the
#' inverse of the feed conversion ratio (FCR). As FCR, this metric measures how
#' effectively cultivated species convert feed into weight. However, contrarily
#' to FCR, the higher the FCE the more efficient the feed conversion is.
#'
#' @param ibw numeric; value that is providing the initial body weight in
#' grams.
#' @param fbw numeric; value that is providing the final body weight in
#' grams.
#' @param feed numeric; value providing the total feed fed in grams
#' during the experiment.
#' @param dm numeric; value indicating the dry matter content of the feed.
#' Value in the interval of (0:1). Default is 1.
#'
#' @return a numeric value that is the feed conversion efficiency (FCE)
#'
#' @examples
#' # Feed intake = 1500 g
#' # Feed dry matter = 0.96 g/g (= 96%)
#' # Initial bodyweight = 100 g
#' # Final bodyweight = 1000 g
#' 
#' fce(100, 1000, 1500, 0.96)
#'
#' @author Anıl Axel Tellbüscher
#' @author Davide A. Machado e Silva
#' @author Madhav Karthikeyan
#'
#' @export
fce <- function(ibw, fbw, feed, dm = 1) {
  # Checks----
  ## Ensure inputs are numeric
  stopifnot(is.numeric(ibw),
            is.numeric(fbw),
            is.numeric(feed),
            is.numeric(dm))
  
  ## Check whether inputs are NA
  if (any(is.na(c(ibw, fbw, feed, dm))))
    stop("Inputs cannot be NA")

  
  ## Check whether inputs == 0
  if (any(feed == 0))
    stop("Feed given or feed intake is zero. The result cannot be calculated.")
  
  if (any(dm == 0))
    stop("Dry matter is zero. The result cannot be calculated.")
  
  
  ## Check whether inputs are < 0
  {if (any(c(ibw, fbw) <= 0) | any(feed < 0))
    warning("The result is not meaningful.")
  return(NA) #Returning NAs so AG calculation does not interfere with the test
}
  
  ## Check whether dm is outside of interval ]0,1]
  if (any(dm > 1))
    warning("Dry matter content is above 100%. The result is not meaningful.")
  
  if (any(dm < 0))
    warning("Dry matter content is below 0%. The result is not meaningful.")
  
  
  ## Check whether inputs have the same length
  if (any(c(length(ibw), length(fbw), length(feed), length(dm)) != 1)) {
    message("Inputs are not of the same length.")
  }
  
  
  
  # Calculations----
  numerator <- ag(ibw, fbw)
  denominator <- feed * dm
  
  fce <- numerator/denominator
  
  return(fce)
}

