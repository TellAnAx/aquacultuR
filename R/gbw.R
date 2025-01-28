#' Geometric Bodyweight (GBW)
#' 
#' A function that calculates the geometric mean bodyweight.
#' 
#' 
#' @param m_start a numeric value that is providing the initial weight in
#' grams.
#' @param m_end a numeric value that is providing the final weight in
#' grams.
#' 
#' @return returns a numeric value that is the geometric bodyweight.
#' 
#' 
#' @author Anıl Axel Tellbüscher
#' 
#' @seealso \code{\link[Aquaculture Formulary]{https://blog.tellbuescher.online/formulary}}
#' 
#' @importFrom dplyr mutate
#' 
#' #' @examples
#' data(weight2)
#' 
#' dplyr::mutate(weight2, GBW = gbw(W_start, W_end))
#' 
#' 
#' 
#' @export
gbw <- function(m_start, 
                m_end){
  
  # Calculate the geometric mean bodyweight
  gbw = sqrt(m_start * m_end) 
  
  # Return the result
  return(gbw)
}
