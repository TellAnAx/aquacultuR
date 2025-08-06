#' Metabolic bodyweight (MBW)
#' 
#' The metabolic bodyweight is the rate of energy expenditure in dependence of
#' the bodyweight of an organism. 
#' 
#' @param ibw a numeric value that is providing the initial weight in
#' grams.
#' @param fbw a numeric value that is providing the final weight in
#' grams.
#' @param gbw a numeric value providing the geometric bodyweight in grams.
#' 
#' @return returns a numeric value that is the metabolic bodyweight.
#' 
#' @note The calculation is based on Lupatsch et al. (2003), with an exponent of 0.8.
#' 
#' @author Anıl Axel Tellbüscher
#' 
#' 
#' @references Lupatsch, I. et al. (2003): Comparison of energy and protein
#' efficiency among three fish species gilthead sea bream (Sparus aurata),
#' European sea bass (Dicentrarchus labrax) and white grouper (Epinephelus
#' aeneus): energy expenditure for protein and lipid deposition. Aquaculture
#' 225, p.175-189.
#' 
#' @importFrom dplyr mutate
#' 
#' @examples
#' data(weight2)
#' 
#' dplyr::mutate(weight2, MBW = mbw(W_start, W_end))
#' 
#' 
#' 
#' @export
mbw <- function(ibw, 
                fbw, 
                gbw = NULL){
  # Check numeric and non-missing
  if (!is.null(ibw) && (!is.numeric(ibw) || is.na(ibw))) stop("ibw must be numeric and not NA")
  if (!is.null(fbw) && (!is.numeric(fbw) || is.na(fbw))) stop("fbw must be numeric and not NA")
  if (!is.null(gbw) && (!is.numeric(gbw) || is.na(gbw))) stop("gbw must be numeric and not NA")
  
  # Check non-negative
  if (!is.null(ibw) && ibw < 0) stop("ibw must be non-negative")
  if (!is.null(ibw) && ibw==0) stop("ibw cannot be zero")
  if (!is.null(fbw) && fbw < 0) stop("fbw must be non-negative")
  if (!is.null(gbw) && gbw < 0) stop("gbw must be non-negative")
  
  # Check start ≤ end
  if (!is.null(ibw) && !is.null(fbw) && ibw > fbw) stop("ibw cannot be greater than fbw")
  
  
  # Calculate gain body weight if not provided
  if (is.null(gbw)) {
    gbw <- fbw - ibw
  }
  
  
  if(is.null(gbw) == TRUE){
    
    # Calculate the geometric mean bodyweight using initWeight and finalWeight
    mbw <- sqrt(ibw * fbw) ^ 0.8
    
  } else {
    
    mbw <- gbw ^ 0.8
  }
  
  # Return the result
  return(mbw)
}
