#
#  TITLE:
#         Function - calculate_FCR(initWeight, finalWeight, feedIntake, dryMatter)
#
#  DESCRIPTION:
#         A function that calculates the Feed Conversion Ratio (FCR) based on
#         the Initial Body weight (IBW; initWeight) in gram (g), the Final Body
#         Weight (FBW; finalWeight) in gram (g), the total Feed Intake (FI; feedIntake)
#         in gram and the dry matter (DM; dryMatter) content of the feed in percent.
#         (duration) in days (d).
#
#         FCR = (FI * DM) / (FBW - IBW)
#
#         The FI is multiplied by the DM of the feed to calculate the true FI.
#         This is then divided by the weight increase during the experimental
#         period to calculate the amount of feed consumed per unit of weight
#         increase.
#
#
#
# written by: Anıl Axel Tellbüscher
#
# date written:   December 6th, 2021
# last modified:  August 6th, 2022
#
#
#
###############################################################################



calculate_FCR <- function(initWeight, finalWeight, feedIntake, dryMatter){

  # Calculate SGR
  result <- (feedIntake * dryMatter) / (finalWeight - initWeight)

  # Return result
  return(result)

}
