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
fce <- function(ibw,
                fbw,
                fi,
                dm = 1){
  
  # Checks
  
  # no-NAs
  if (any(is.na(c(ibw, fbw, fi)))) 
    stop("Inputs cannot be NA")
  
  #numeric
  if (!is.numeric(ibw) || !is.numeric(fbw) || !is.numeric(fi)) 
    stop("All inputs must be numeric")
  
  #positive
  if (ibw < 0) 
    stop("IBW is negative. The result cannot be calculated.")
  
  if (fbw < 0) 
    stop("FBW is negative. The result cannot be calculated.")
  
  if (fi < 0) 
    stop("Feed intake is negative. The result cannot be calculated.")
  
  # no-zeros
  if (ibw == 0)
    warning("IBW is zero. The result is not meaningful.")
  
  if (fbw == 0) 
    warning("FBW is zero. The result is not meaningful.")
  
  if (fi == 0) 
    warning("Feed intake is zero. The result is not meaningful.")
  
  # constrain dm
  
  if (dm > 1) 
    stop("Dry matter content is above 100%. The result is not meaningful.")
  
  if (dm < 0) 
    stop("Dry matter content is below 0%. The result is not meaningful.")
  
  ## Ensure inputs have the same length
  input_lengths <- c(length(ibw), length(fbw), length(fi))
  if (length(unique(input_lengths)) != 1) {
    stop("All input vectors must have the same length.")
  }
  
  fce <- (fbw - ibw)/(fi * dm)
  
  return(fce)
}
