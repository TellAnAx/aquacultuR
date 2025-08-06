#'  Thermal Growth Coefficient (TGC).
#' 
#'  A function that calculates Thermal Growth Coefficient (TGC) based on
#'  the Initial Body weight (IBW) in grams (g), the Final Body
#'  Weight (FBW) in grams (g) and the average water temperature (Temp.) in Celsius (°C)
#'  for the duration of the trial.
#' 
#' @param ibw a numeric value that is providing the initial body weight in
#' grams.
#' @param fbw a numeric value that is providing the final body weight in
#' grams.
#' @param duration a numeric value that is providing the duration of the
#' experiment in days.
#' @param temp a numeric value that is providing the average temperature during
#' the experiment in degrees Celsius.
#' 
#' @return Returns a numeric value that is the TGC. 
#' 
#' @note The TGC is an alternative growth metric for fishes, describing the increase
#' in bodyweight over a period of time. It is suitable for poikilothermic
#' animals due to its standardisation for temperature. It should, however, be
#' taken into account, that the temperature during the experiment should remain
#' within the optimum range. It is also noteworthy that the equation is 
#' optimized for a constant temperature throughout the experiment

#' @author Anıl Axel Tellbüscher
#' @author Davide A. Machado e Silva
#' @author Madhav Karthikeyan
#' 
#' @references Lugert, V., Thaller, G., Tetens, J., Schulz, C., & Krieter, J.
#' (2016): A review on fish growth calculation: multiple functions in fish
#' production and their specific application. Reviews in Aquaculture, 8,
#' p.30–42.
#' @references Jobling, M. (2003): The thermal growth coefﬁcient (TGC) model 
#' of ﬁsh growth: a cautionary note. Aquaculture Research, 34, p. 581–584.
#' 
#' 
#' @export
tgc <- function(ibw, 
                fbw, 
                duration, 
                temp
                ){
  #Checks
  # NA checks
  if (any(is.na(c(ibw, fbw, duration, temp)))) 
    stop("Inputs cannot be NA.")
  
  
  # Zero or negative duration -> error
  if (duration == 0) 
    stop("Duration cannot be zero.")
  
  if (duration < 0) 
    stop("Duration cannot be negative.")
  
  
  # Warnings for zero or negative values
  if (ibw <= 0) warning("Initial body weight is zero or negative.")
  if (fbw <= 0) warning("Final body weight is zero or negative.")
  if (temp <= 0) warning("Temperature is zero or negative.")

  # Calculate the SGR
  tgc <- ((fbw^(1/3) - ibw^(1/3)) / (duration * temp)) * 1000

  # Return the result
  return(tgc)
}
