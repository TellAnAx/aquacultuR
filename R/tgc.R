#' Thermal Growth Coefficient (TGC)
#'
#' A function that calculates Thermal Growth Coefficient (TGC) based on
#' the Initial Body weight (IBW) in grams (g), the Final Body
#' Weight (FBW) in grams (g) and the average water temperature (Temp.) in 
#' Celsius (°C) for the duration of the trial.
#'  
#' The TGC is an alternative growth metric for fishes, describing the 
#' increase in bodyweight over a period of time. It is suitable for 
#' poikilothermic animals due to its standardisation for temperature. It 
#' should, however, be taken into account, that the temperature during the 
#' experiment should remain within the optimum range. It is also noteworthy 
#' that the equation is optimized for a constant temperature throughout the 
#' experiment.
#'
#' @param ibw a numeric value that is providing the initial body weight in
#' grams.
#' @param fbw a numeric value that is providing the final body weight in
#' grams.
#' @param duration a numeric value that is providing the duration of the
#' experiment in days.
#' @param temp a numeric value that is providing the average temperature 
#' during the experiment in degrees Celsius.
#' @param scale_coef Scaling coefficient. A numeric value that scales the
#' TGC result so it is more intuitive and interpretable. Default is 1000.
#'
#' @return Returns a numeric value that is the TGC.
#'
#'
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
#' @export
tgc <- function(ibw, fbw, duration, temp, scale_coef = 1000) {
  # Checks----
  ## Check whether input is NA
  if (any(is.na(c(ibw, fbw, duration, temp))))
    stop("Inputs must not be NA!")
  
  
  ## Check whether input is numeric
  if (any(!is.numeric(ibw) |
          !is.numeric(fbw) |
          !is.numeric(duration) |
          !is.numeric(temp)) | !is.numeric(scale_coef))
    stop("Inputs must be numeric!")
  
  
  ## Check whether duration | temp == 0
  if (any(duration == 0 | temp == 0))
    stop("'duration' or 'temp' is zero! Result cannot be calculated.")
  
  
  ## Check whether inputs are < 0
  if (any(ibw <= 0 | fbw <= 0))
    warning("IBW or FBW <= 0! The result is not meaningful.")
  
  if (any(duration < 0 | temp < 0))
    warning("duration or temp < 0! The result is not meaningful.")
  
  
  ## Check whether inputs have the same length
  length_ratio <- c(length(ibw), 
                    length(fbw), 
                    length(duration), 
                    length(temp)
                    ) / length(ibw)
  
  if (any(length_ratio != 1))
    message("Input do not have the same length.")
  
  
  
  # Calculations----
  tgc <- ((fbw^(1 / 3) - ibw^(1 / 3)) / (duration * temp)) * scale_coef
  
  return(tgc)
}
