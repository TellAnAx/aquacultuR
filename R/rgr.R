#' Relative Growth Rate (RGR)
#'
#' A function that calculates the Relative Growth Rate (RGR), which is the 
#' relative weight increase per time unit.
#'
#' @param ibw numeric; provides the initial weight in gram.
#' @param fbw numeric; provides the final weight in gram.
#' @param duration numeric; duration of the growth experiment.
#' @param mean_fun character; specifies the mean ("geometric" or "arithmetic")
#' to be calculated as denominator. Default: "geometric". 
#'
#' @return either a single numeric value or vector holding the calculated RGR
#' values. Multiply by 100 for conversion into percentage.
#'
#' @examples
#' data(weight2)
#' dplyr::mutate(weight2, RGR = rgr(ibw_g, fbw_g, duration = 84))
#'
#' @author Anıl Axel Tellbüscher
#'
#' @references Lugert, V., Thaller, G., Tetens, J., Schulz, C., & Krieter, J.
#' (2016): A review on fish growth calculation: multiple functions in fish
#' production and their specific application. Reviews in Aquaculture, 8,
#' p.30–42.
#'
#' @importFrom dplyr mutate
#'
#' @export
rgr <- function(ibw, 
                fbw, 
                duration, 
                mean_fun = "geometric") {
  
  # Checks----
  ## Ensure inputs are numeric
  if (any(!is.numeric(ibw) | !is.numeric(fbw) | !is.numeric(duration))) {
    stop("Inputs must be numeric!")
  }
  
  ## Ensure ibw and duration are != 0
  if (any(ibw == 0 | duration == 0)) {
    stop("Inputs must be != 0!")
  }
  
  ## Ensure mean_fun %in% c("geometric", "arithmetic")
  if (!mean_fun %in% c("geometric", "arithmetic")) {
    stop("mean_fun must be 'geometric' or 'arithmetic'!")
  }
  
  ## Stop if ibw or fbw are < 0 (related to gbw())
  if (any(ibw < 0) | any(fbw < 0)) {
    stop("Inputs < 0. The result cannot be calculated!")
  }
  
  ## Inform if inputs are not of the same length
  if (any(c(length(ibw), length(fbw), length(duration)) > 1)) {
    message("Inputs are not of same length.")
  }
  
  
  
  # Calculations----
  numerator <- fbw - ibw
  denominator <- switch(mean_fun,
                        geometric = gbw(ibw, fbw),
                        arithmetic = (ibw + fbw)/2
                        )
  
  
  ## Calculate the relative growth rate
  rgr <- numerator / (denominator * duration)
  
  
  ## Return the result
  return(rgr)
}
