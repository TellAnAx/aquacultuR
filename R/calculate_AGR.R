#
#  TITLE: 
#         Function - calculate_AGR(initWeight, finalWeight, duration)
#
#  DESCRIPTION:
#         A function that calculates the Absolute Growth Rate (AGR), also denoted as 
#         Weight Gain (WG) when applied to weight data.
#
#
#
# written by: Anil Axel Tellbuescher
#
# date written:   December 18th, 2021
# last modified:  August 25th, 2024
#
#
#
###############################################################################




calculate_AGR <- function(initWeight, finalWeight, duration){
  
  # Calculate the absolute growth rate
  result = (finalWeight - initWeight) / duration
  
  # Return the result
  return(result)
}