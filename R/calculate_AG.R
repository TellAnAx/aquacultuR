#
#  TITLE:
#         Function - calculate_AG(initWeight, finalWeight)
#
#  DESCRIPTION:
#         A function that calculates the Absolute Growth (AG), also denoted as
#         Absolute Weight Gain (AWG) based on the Initial Body weight (IBW;
#         initWeight) in gram (g) and the Final Body Weight (FBW; finalWeight)
#         in gram (g).
#
#         AG = FBW - IBW
#
#         The IBW is subtracted from the FBW.
#
#
#
#
# date written:   August 6th, 2022
# last modified:  August 6th, 2022
#
#
#
###############################################################################




#' AG
#' 
#' Calculates the Absolute Growth %% ~~ A concise (1-5 lines) description of
#' what the function does. ~~
#' 
#' A function that calculates the Absolute Growth (AG), also denoted as
#' Absolute Weight Gain (AWG) based on the Initial Body weight (IBW;
#' initWeight) in gram (g) and the Final Body Weight (FBW; finalWeight)
#' in gram (g).
#' 
#' @param initWeight a numeric value providing the initial weight in grams.
#' @param finalWeight a numeric value providing the final weight in grams.
#' @return returns a numeric value that is the AG.
#' 
#' @note The AG, also termed Absolute Weight Gain (AWG), is the weight that was
#' gained within the duration of a growth trial. It does by default not
#' distinguish between weight gain in form of dry matter or water.
#' 
#' AG = FBW - IBW
#' 
#' The IBW is subtracted from the FBW.
#' 
#' @author Anıl Axel Tellbüscher
#' 
#' @seealso \code{\link[Aquaculture Formulary]{https://blog.tellbuescher.online/formulary}}
#' 
#' @references Lugert, V., Thaller, G., Tetens, J., Schulz, C., & Krieter, J.
#' (2016): A review on fish growth calculation: multiple functions in fish
#' production and their specific application. Reviews in Aquaculture, 8,
#' p.30–42.
#' 
#' @examples
#' 
#' 
#' @export calculate_AG
calculate_AG <- function(initWeight, finalWeight){

  # Calculate AG
  result <- finalWeight - initWeight

  # Return result
  return(result)
}
