#
# date written:   November 18th, 2021
# last modified:  November 18th, 2021
#
#
#
###############################################################################

#' Function to calculate the Specific Growth Rate
#' 
#' A function that calculates the Specific Growth Rate (SGR) based on
#' the Initial Body weight (IBW; initWeight) in gram (g), the Final Body
#' Weight (FBW; finalWeight) in gram (g) and the duration of the trial
#' (duration) in days (d).
#' 
#' @param initWeight numeric value that is providing the initial weight in
#' grams.
#' @param finalWeight numeric value that is providing the final weight in
#' grams.
#' @param duration numeric value that is providing the duration of the
#' experiment in days.
#' @return Returns the SGR as percentage value. %% ~Describe the value returned
#' %% If it is a LIST, use %% \item{comp1 }{Description of 'comp1'} %%
#' \item{comp2 }{Description of 'comp2'} %% ...
#' @note The SGR is a growth metric for fishes, describing the increase in bodyweight
#' over a period of time.
#' 
#' SGR = (ln(FBW[g]) - ln(IBW[g])) / t[d] *100
#' 
#' The natural logarithm of the initial body weight is subtracted from
#' the natural logarithm of the final body weight. The term is then
#' divided by the trial duration and multiplied by 100 to convert into a
#' percentage.
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
#' @export calculate_SGR
calculate_SGR <- function(initWeight, finalWeight, duration){

# Calculate the SGR
  result <- (logb(finalWeight / initWeight)) / duration * 100

# Return the result
  return(result)
}
