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
#' @param m_start numeric; value that is providing the initial body weight in
#' grams.
#' @param m_end numeric; value that is providing the final body weight in
#' grams.
#' @param duration numeric value that is providing the duration of the
#' experiment in days.
#' 
#' @return Returns the SGR as percentage of the body weight gain per day. 
#' 
#' @note The SGR is a growth metric for aquaculture products (e.g., fish,
#' crustaceans, bivalves, algae), describing the increase in body weight over
#' a period of time. Body weight can be substituted by other weight metrics,
#' such as length. However, body weight is the used in the vast majority
#' of studies and alternatives are not advised for the sake of consistency.
#' 
#' SGR = e^(((ln(FBW[g] / IBW[g])) / t[d]) - 1)  * 100
#' 
#' @author Anıl Axel Tellbüscher
#' @author Davide A. Machado e Silva
#' 
#' @references Crane, D.P., Ogle, D.H. and Shoup, D.E. (2020), Use and misuse
#' of a common growth metric: guidance for appropriately calculating and
#' reporting specific growth rate. Rev Aquacult, 12: 1542-1547.
#' https://doi.org/10.1111/raq.12396
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

# Calculate IGR
  igr <- (logb(m_end / m_start)) / duration
  
# Calculate the SGR based on IGR
  sgr <- ((exp(igr)) - 1) * 100

# Return the result
  return(sgr)
}
