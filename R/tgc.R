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
#' optimized for a constant temperature throughout the experiment. 
#' 
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
                temp, scale_coef = 1000
                ){
  
  # Checks
  
  # no-NAs
  if (any(is.na(c(ibw, fbw, duration, temp)))) 
    stop("Inputs cannot be NA")
  
  #numeric
  if (!is.numeric(ibw) || !is.numeric(fbw) || !is.numeric(duration) || !is.numeric(temp)) 
    stop("All inputs must be numeric")
  
  #positive
  if (ibw < 0) 
    stop("IBW is negative. The result cannot be calculated.")
  
  if (fbw < 0) 
    stop("FBW is negative. The result cannot be calculated.")
  
  if (duration < 0) 
    stop("Duration is negative. The result cannot be calculated.")
  
  if (temp < 0) 
    stop("Temperature is negative. The result is not meaningful.")
  
  # no-zeros
  if (ibw == 0)
    warning("IBW is zero. The result is not meaningful.")
  
  if (fbw == 0) 
    warning("FBW is zero. The result is not meaningful.")
  
  if (duration == 0) 
    warning("Duration is zero. The result is not meaningful.")
  
  if (temp == 0) 
    warning("Temperature is zero. The result may not be meaningful.")
  
  # Ensure inputs have the same length
  input_lengths <- c(length(ibw), length(fbw), length(duration))
  if (length(unique(input_lengths)) != 1) {
    stop("All input vectors must have the same length.")
  }


  # Calculate the SGR
  tgc <- ((fbw^(1/3) - ibw^(1/3)) / (duration * temp)) * scale_coef

  # Return the result
  return(tgc)
}
