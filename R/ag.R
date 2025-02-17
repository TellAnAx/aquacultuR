#' Absolute Growth (AG)
#' 
#' Calculates the Absolute Growth
#' 
#' A function that calculates the Absolute Growth (AG), also denoted as
#' Absolute Weight Gain (AWG) based on the Initial Body weight (IBW;
#' m_start) in gram (g) and the Final Body Weight (FBW; m_end)
#' in gram (g).
#' 
#' @param m_start numeric; value providing the initial weight in grams.
#' @param m_end numeric; value providing the final weight in grams.
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
ag <- function(m_start, 
               m_end) {

  # Calculate AG
  ag <- m_end - m_start

  # Return result
  return(ag)
}

#' @rdname ag
#' @export
weight_gain <- ag
