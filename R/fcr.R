#' Feed Conversion Ratio (FCR)
#' 
#' A function that calculates the Feed Conversion Ratio (FCR) based on
#' the Initial Body weight (IBW; m_start) in gram (g), the Final Body
#' Weight (FBW; m_end) in gram (g), the total Feed Intake (FI; fi)
#' in gram and the dry matter (DM; dm) content of the feed in percent.
#' 
#' @param m_start numeric; value that is providing the initial weight in
#' grams.
#' @param m_end numeric; value that is providing the final weight in
#' grams.
#' @param fi numeric; value providing the total feed intake in grams
#' during the experiment.
#' @param dm numeric; value within the interval of (0:1), indicating the dry 
#' matter content of the feed.
#' 
#' @return returns a numeric value that is the FCR.
#' 
#' @note The Feed Conversion Ratio (FCR) describes the amount of feed on dry matter
#' (DM) basis that is required to gain 1 kg of body weight on wet weight basis.
#' 
#' FCR = (FI * DM) / (FBW - IBW)
#' 
#' The FI is multiplied by the DM of the feed to calculate the true FI.
#' This is then divided by the weight increase during the experimental
#' period to calculate the amount of feed consumed per unit of weight
#' increase.
#' 
#' @author Anıl Axel Tellbüscher
#' 
#' 
#' @references Lugert, V., Thaller, G., Tetens, J., Schulz, C., & Krieter, J.
#' (2016): A review on fish growth calculation: multiple functions in fish
#' production and their specific application. Reviews in Aquaculture, 8,
#' p.30–42.
#' 
#' 
#' 
#' @export 
fcr <- function(m_start, 
                m_end, 
                fi, 
                dm = 1
                ){

  # Calculate SGR
  fcr <- (fi * dm) / (m_end - m_start)

  # Return result
  return(fcr)
}
