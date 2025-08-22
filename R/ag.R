#' Absolute Growth (AG)
#'
#' A function that calculates the Absolute Growth (AG), also denoted as
#' Absolute Weight Gain (AWG) based on the Initial Body weight (IBW;
#' ibw) in gram (g) and the Final Body Weight (FBW; fbw)
#' in gram (g).
#'
#' @param ibw numeric; value providing the initial bodyweight in grams.
#' @param fbw numeric; value providing the final bodyweight in grams.
#'
#' @return returns a numeric value that is the AG.
#'
#' @author Anıl Axel Tellbüscher
#'
#' @references Lugert, V., Thaller, G., Tetens, J., Schulz, C., & Krieter, J.
#' (2016): A review on fish growth calculation: multiple functions in fish
#' production and their specific application. Reviews in Aquaculture, 8,
#' p.30–42.
#'
#' @importFrom dplyr mutate
#'
#' @examples
#' data(weight2)
#'
#' dplyr::mutate(weight2, AG = ag(W_start, W_end))
#'
#'
#'
#' @export
ag <- function(ibw, fbw) {
  # Checks----
  ## Check whether inputs are NA
  if(any(is.na(ibw) | is.na(fbw)))
    stop("Inputs must not be NA!")
  
  ## Check whether inputs are numeric
  if(any(!is.numeric(ibw)| !is.numeric(fbw)))
    stop("Inputs must be numeric!")
  
  ## Check whether inputs are > 0
  if (any(ibw <= 0 | fbw <= 0))
    warning("Inputs are <= 0. The result is not meaningful.")
  
  ## Check whether inputs have the same length
  if (length(ibw) != length(fbw))
    message("Inputs have different lengths.")
  
  
  
  # Calculations----
  ## Calculate AG
  ag <- fbw - ibw
  
  ## Return result
  return(ag)
}

#' @rdname ag
#' @export
weight_gain <- ag
