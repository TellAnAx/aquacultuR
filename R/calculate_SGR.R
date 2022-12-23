#
#  TITLE: 
#         Function - SGR(initWeight, finalWeight, duration)
#
#  DESCRIPTION:
#         A function that calculates the Specific Growth Rate (SGR) based on
#         the Initial Body weight (IBW; initWeight) in gram (g), the Final Body 
#         Weight (FBW; finalWeight) in gram (g) and the duration of the trial
#         (duration) in days (d).
#
#         SGR = (ln(FBW[g]) - ln(IBW[g])) / t[d] *100
#
#         The natural logarithm of the initial body weight is subtracted from
#         the natural logarithm of the final body weight. The term is then 
#         divided by the trial duration and multiplied by 100 to convert into a 
#         percentage.
#
#
#
# written by: Anil Axel Tellbuescher
#
# date written:   November 18th, 2021
# last modified:  November 18th, 2021
#
#
#
###############################################################################



SGR <- function(initWeight, finalWeight, duration){
  
# Calculate the SGR  
  result <- (logb(finalWeight / initWeight)) / duration * 100
  
# Return the result
  return(result)
  
}