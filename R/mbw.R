#' Metabolic bodyweight (MBW)
#' 
#' The metabolic bodyweight is the rate of energy expenditure in dependence of
#' the bodyweight of an organism. The metabolism of larger animals is generally 
#' slower per Kg when comparing with smaller animals. An exponent between 0-1 
#' takes that relationship into account in a fairly simple equation. 
#' 
#' @param ibw a numeric value that is providing the initial weight in
#' grams.
#' @param fbw a numeric value that is providing the final weight in
#' grams.
#' @param gbw a numeric value providing the geometric bodyweight in grams.
#' @param mb_exp a numeric value between 0-1 providing the exponent. Default 
#' is 0.8 adapted to most fish species.
#' 
#' @return returns a numeric value that is the metabolic bodyweight.
#' 
#' @note Default exponent is suited to fish only. It was set to 0.8 based on 
#' Lupatsch et al. (2003) and should be adjusted to other scenarios.
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
                gbw = NULL,
                mb_exp = 0.8){
  # Checks----
  
  ## Check whether inputs are NA
  stopifnot("Inputs cannot be NA" = !is.na(ibw), !is.na(fbw), !is.na(gbw))
  
  ## Check whether inputs are non-numeric
  stopifnot("All inputs must be numeric" = is.numeric(ibw), is.numeric(fbw), is.numeric(gbw))
  
  ## Check whether inputs == 0
  stopifnot("'ibw' == 0. The result cannot be calculated." = all(ibw != 0))
  stopifnot("'fbw' == 0. The result cannot be calculated." = all(fbw != 0))
  
  ## Check whether inputs are < 0
  if (any(ibw < 0) | any(fbw < 0)) {
    warning("Some inputs values are negative. The result may not be meaningful.")
  }
  
  ## Check whether inputs have the same length
  input_lengths <- c(length(ibw), length(fbw))
  if (length(unique(input_lengths)) != 1) {
    stop("All input vectors must have the same length.")
  }
  
  ## Check whether mb_exp is 0-1
  stopifnot("'mb_exp' must be between 0 and 1" = ibw >= 0 & ibw <= 1)
  
  # Calculate gain body weight if not provided
  if (is.null(gbw)) {
    gbw <- fbw - ibw
  }
  
  
  if(is.null(gbw) == TRUE){
    
    # Calculate the geometric mean bodyweight using initWeight and finalWeight
    mbw <- sqrt(ibw * fbw) ^ mb_exp
    
  } else {
    
    mbw <- gbw ^ mb_exp
  }
  
  # Return the result
  return(mbw)
}
