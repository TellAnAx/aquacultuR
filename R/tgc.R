#'  Thermal Growth Coefficient (TGC).
#' 
#'  A function that calculates Thermal Growth Coefficient (TGC) based on
#'  the Initial Body weight (IBW; initWeight) in gram (g), the Final Body
#'  Weight (FBW; finalWeight) in gram (g) and the average water temperature
#'  during the duration of the trial.
#' 
#' @param m_start a numeric value that is providing the initial weight in
#' grams.
#' @param m_end a numeric value that is providing the final weight in
#' grams.
#' @param duration a numeric value that is providing the duration of the
#' experiment in days.
#' @param temp a numeric value that is providing the average temperature during
#' the experiment in degrees Celsius.
#' @return Returns a numeric value that is the TGC. 
#' 
#' @note The TGC is an alternative growth metric for fishes, describing the increase
#' in bodyweight over a period of time. It is suitable for poikilothermic
#' animals due to its standardisation for temperature. It should, however, be
#' taken into account, that the temperature during the experiment should remain
#' within the optimum range.
#' 
#' TGC = (FBW[g]^(1/3)) - IBW[g]^(1/3))) / duration * Temp[degreeCelsius]) * 1000
#' 
#' The cubic root of the initial body weight is subtracted from
#' the cubic root of the final body weight. The term is then
#' divided by the product of the duration and the average temperature and
#' multiplied by 1000 to convert the result into a larger number.
#' 
#' @author Anıl Axel Tellbüscher
#' 
#' @references Lugert, V., Thaller, G., Tetens, J., Schulz, C., & Krieter, J.
#' (2016): A review on fish growth calculation: multiple functions in fish
#' production and their specific application. Reviews in Aquaculture, 8,
#' p.30–42.
#' @references Jobling, M. (2003): The thermal growth coefﬁcient (TGC) model 
#' of ﬁsh growth: a cautionary note. Aquaculture Research, 34, p. 581–584.

#' 
#' 
#' 
#' @export
tgc <- function(m_start, 
                m_end, 
                duration, 
                temp
                ){

  # Calculate the SGR
  tgc <- ((m_end^(1/3) - m_start^(1/3)) / (duration * temp)) * 1000

  # Return the result
  return(tgc)
}
