#
#  TITLE:
#         Function - TGC(initWeight, finalWeight, temperature)
#
#  DESCRIPTION:
#         A function that calculates Thermal Growth Coefficient (TGC) based on
#         the Initial Body weight (IBW; initWeight) in gram (g), the Final Body
#         Weight (FBW; finalWeight) in gram (g) and the average water temperature
#         during the duration of the trial.
#
#         TGC = (FBW[g]^(1/3)) - IBW[g]^(1/3))) / duration * Temp[degreeCelsius]) * 1000
#
#         The cubic root of the initial body weight is subtracted from
#         the cubic root of the final body weight. The term is then
#         divided by the product of the duration and the average temperature and
#         multiplied by 1000 to convert the result into a larger number.
#
#
#
# written by: Anıl Axel Tellbüscher
#
# date written:   November 18th, 2021
# last modified:  August 6th, 2022
#
#
#
###############################################################################


calculate_TGC <- function(initWeight, finalWeight, duration, temp){

  # Calculate the SGR
  result <- ((finalWeight^(1/3) - initWeight^(1/3)) / (duration * temp)) * 1000

  # Return the result
  return(result)

}
