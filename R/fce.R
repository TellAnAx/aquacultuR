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
#' @param fi numeric; value providing the total feed intake in grams
#' during the experiment.
#' @param dm numeric; value indicating the dry matter content of the feed.
#' Value in the interval of (0:1). Default is 1.
#'
#' @return a numeric value that is the feed conversion efficiency (FCE)
#'
#' @author Anıl Axel Tellbüscher
#' @author Davide A. Machado e Silva
#' @author Madhav Karthikeyan
#'
#' @export
fce <- function(ibw, fbw, fi, dm = 1) {
  # Checks----
  ## Check whether inputs are NA
  if (any(is.na(c(ibw, fbw, fi, dm))))
    stop("Inputs cannot be NA")
  
  
  ## Check whether inputs are non-numeric
  if (any(!is.numeric(c(ibw, fbw, fi, dm))))
    stop("All inputs must be numeric")
  
  
  ## Check whether inputs == 0
  if (any(fi == 0))
    stop("Feed intake is zero. The result cannot be calculated.")
  
  if (any(dm == 0))
    stop("Dry matter is zero. The result cannot be calculated.")
  
  
  ## Check whether inputs are < 0
  if (any(c(ibw, fbw) <= 0) | any(fi < 0))
    warning("The result is not meaningful.")
  
  
  ## Check whether dm is outside of interval ]0,1]
  if (any(dm > 1))
    warning("Dry matter content is above 100%. The result is not meaningful.")
  
  if (any(dm < 0))
    warning("Dry matter content is below 0%. The result is not meaningful.")
  
  
  ## Check whether inputs have the same length
  if (any(c(length(ibw), length(fbw), length(fi), length(dm)) != 1)) {
    message("Inputs are not of the same length.")
  }
  
  
  
  # Calculations----
  fce <- (fbw - ibw) / (fi * dm)
  
  return(fce)
}
