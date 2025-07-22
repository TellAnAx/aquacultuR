#' Absolute Growth (AG)
#'
#' A function that calculates the Absolute Growth (AG), also denoted as
#' Absolute Weight Gain (AWG) based on the Initial Body weight (IBW;
#' ibw) in gram (g) and the Final Body Weight (FBW; fbw)
#' in gram (g).
#'
#' @param ibw numeric; value providing the initial weight in grams.
#' @param fbw numeric; value providing the final weight in grams.
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
ag <- function(ibw,
               fbw) {

  # Checks----
  ## Ensure inputs are numeric
  stopifnot(is.numeric(ibw), is.numeric(fbw))

  ## Ensure inputs have the same length
  if (length(ibw) != length(fbw)) {
    stop("Error: 'ibw' and 'fbw' must be of the same length.")
  }

  ## Check whether inputs are > 0
  if (any(ibw < 0 | fbw < 0)) {
    warning("Some input values are negative. The result may not be meaningful.")
  }


  # Calculations----
  ## Calculate AG
  ag <- fbw - ibw

  ## Return result
  return(ag)
}

#' @rdname ag
#' @export
weight_gain <- ag
