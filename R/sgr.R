#' Specific Growth Rate (SGR)
#' 
#' Calculates the Specific Growth Rate 
#' 
#' This function calculates the Specific Growth Rate (SGR) based on
#' the Instantaneous Growth Rate. The Instantaneous Growth Rate (IGR) is a useful
#' metric, although hard to interpret. The SGR, derived from IGR, can then be easily
#' interpreted as the percentage of Body Weight gained each day. 
#' Initial Body weight (IBW; m_start) in grams (g), the Final Body Weight
#' (FBW; m_end) in grams (g) and the duration of the trial (duration) in days (d).
#' 
#' @param m_start numeric; value that is providing the initial weight in
#' grams.
#' @param m_end numeric; value that is providing the final weight in
#' grams.
#' @param duration numeric value that is providing the duration of the
#' experiment in days.
#' 
#' @return Returns the SGR as percentage value. 
#' 
#' @note The SGR is a growth metric for fishes, describing the increase in bodyweight
#' over a period of time.
#' 
#' SGR = (ln(FBW[g]) - ln(IBW[g])) / t[d] *100
#' 
#' The natural logarithm of the initial body weight is subtracted from
#' the natural logarithm of the final body weight. The term is then
#' divided by the trial duration and multiplied by 100 to convert into a
#' percentage.
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
#' dplyr::mutate(weight2, SGR = sgr(W_start, W_end, duration = 84))
#' 
#' 
#' 
#' @export 
sgr <- function(m_start, 
                m_end, 
                duration
                ){

# Calculate the SGR
  sgr <- (log(m_end / m_start)) / duration * 100

# Return the result
  return(sgr)
}
