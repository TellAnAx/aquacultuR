#' Absolute Growth (AG)
#'
#' A function that calculates the Absolute Growth (AG), also denoted as
#' Absolute Weight Gain (AWG) based on the Initial Body weight (IBW;
#' ibw) in gram (g) and the Final Body Weight (FBW; fbw)
#' in gram (g).
#'
#' @param ibw numeric; value providing the initial bodyweight in grams.
#' @param fbw numeric; value providing the final bodyweight in grams.
#'
#' @return returns a numeric value that is the AG.
#'
#' @examples
#' data(weight2)
#' dplyr::mutate(weight2, AG = ag(ibw_g, fbw_g))
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
ag <- function(ibw, fbw) {
  # Checks----
  ## Check whether inputs are NA
  if(any(is.na(ibw) | is.na(fbw)))
    stop("Inputs must not be NA!")
  
  ## Check whether inputs are numeric
  if(any(!is.numeric(ibw)| !is.numeric(fbw)))
    stop("Inputs must be numeric!")
  
  ## Check whether inputs are > 0
  if (any(ibw <= 0 | fbw <= 0))
    warning("Inputs are <= 0. The result is not meaningful.")
  
  ## Check whether inputs have the same length
  if (length(ibw) != length(fbw))
    message("Inputs have different lengths.")
  
  
  
  # Calculations----
  ## Calculate AG
  ag <- fbw - ibw
  
  ## Return result
  return(ag)
}

#' @rdname ag
#' @export
weight_gain <- ag





#' Relative Growth (RG)
#'
#' A function that calculates the Relative Growth (RG) based on the
#' Initial Body weight (IBW; ibw) and the Final Body Weight (FBW; fbw)
#' in grams (g).
#'
#' @param ibw numeric; value providing the initial weight in grams.
#' @param fbw numeric; value providing the final weight in grams.
#'
#' @return returns a numeric value that is the Relative Growth. Multiply by 100
#' for conversion into a percentage.
#'
#' @examples
#' data(weight2)
#' dplyr::mutate(weight2, RG = rg(ibw_g, fbw_g))
#'
#' @author Anıl Axel Tellbüscher
#'
#' @importFrom dplyr mutate
#'
#' @export
rg <- function(ibw, fbw) {
  # Checks----
  
  ## Check whether inputs are NA
  stopifnot("Inputs cannot be NA" = !is.na(ibw), !is.na(fbw))
  
  ## Check whether inputs are non-numeric
  stopifnot("All inputs must be numeric" = is.numeric(ibw), is.numeric(fbw))
  
  ## Check whether inputs are < 0
  if (any(ibw <= 0 | fbw <= 0))
    warning("Inputs are <= 0. The result is not meaningful.")
  
  ## Check whether inputs have the same length
  if (length(ibw) != length(fbw))
    message("Inputs are of different length.")
  
  
  
  # Calculations----
  ## Calculate RG
  rg <- (fbw - ibw) / ibw
  
  ## Return result
  return(rg)
}




#' Absolute Growth Rate (AGR)
#'
#' A function that calculates the Absolute Growth Rate (AGR), also denoted as
#' Weight Gain (WG) when applied to weight data.
#'
#'
#' @param ibw numeric; value that is providing the initial body weight in
#' grams.
#' @param fbw numeric; value that is providing the final body weight in
#' grams.
#' @param duration numeric value that is providing the duration of the
#' experiment in days.
#'
#' @return returns a numeric value which is the total body weight change
#' over the specified period of time.
#'
#' @examples
#' data(weight2)
#' dplyr::mutate(weight2, AGR = agr(ibw_g, fbw_g, duration = 84))
#'
#' @author Anıl Axel Tellbüscher
#' @author Madhav Karthikeyan
#' @author Davide A. Machado e Silva
#
#' @references Lugert, V., Thaller, G., Tetens, J., Schulz, C., & Krieter, J.
#' (2016): A review on fish growth calculation: multiple functions in fish
#' production and their specific application. Reviews in Aquaculture, 8,
#' p.30–42.
#' @references Hopkins K.D. (1992) Reporting fish growth, a review of the 
#' basics. Journal of World Aquaculture Society, 23, p.173-179
#'
#' @importFrom dplyr mutate
#'
#' @export
agr <- function(ibw, fbw, duration) {
  # Checks----
  ## Check whether input is NA
  if (any(is.na(c(ibw, fbw, duration))))
    stop("Inputs cannot be NA")
  
  
  if (any(!is.numeric(ibw) |
          !is.numeric(fbw) | 
          !is.numeric(duration)))
    stop("All inputs must be numeric")
  
  if (any(duration <= 0))
    stop("Duration <= 0! The result cannot be calculated.")
  
  if (any(ibw <= 0 | 
          fbw <= 0 ))
    warning("Input is zero or negative! The result is not meaningful.")
  
  ## Check for inputs of differing length
  length_ratios <- c(length(ibw), 
                     length(fbw), 
                     length(duration)) / length(ibw)
  if (!all(length_ratios == 1))
    message("Inputs have different lengths.")
  
  
  
  # Calculations----
  agr <- (fbw - ibw) / duration
  
  return(agr)
}



#' Specific Growth Rate (SGR)
#'
#' This function calculates the Specific Growth Rate (SGR) based on
#' the Instantaneous Growth Rate (IGR). The IGR is a useful
#' metric, although hard to interpret. The SGR, derived from IGR, can then be 
#' easily interpreted as the percentage of Body Weight gained each day.
#' The SGR is a growth metric for aquaculture products (e.g., fish,
#' crustaceans, bivalves, algae), describing the increase in body weight over
#' a period of time. Body weight can be substituted by other metrics,
#' such as length. However, body weight is the used in the vast majority
#' of studies and alternatives are not advised for the sake of consistency.
#'
#' @param ibw numeric; value that is providing the initial body weight in
#' grams.
#' @param fbw numeric; value that is providing the final body weight in
#' grams.
#' @param duration numeric value that is providing the duration of the
#' experiment in days.
#' @param return_igr logical; default is FALSE. Indicates whether the 
#' instantaneous growth rate shall be returned together with the SGR or not.
#'
#' @return Returns a numeric, which is the SGR as percentage of the body
#' weight gain per day, or a list containing the SGR and the IGR.
#'
#' @examples
#' dplyr::mutate(weight2, SGR = sgr(ibw_g, fbw_g, duration = 84))
#' 
#' @author Anıl Axel Tellbüscher
#' @author Davide A. Machado e Silva
#'
#' @references Crane, D.P., Ogle, D.H. and Shoup, D.E. (2020), Use and misuse
#' of a common growth metric: guidance for appropriately calculating and
#' reporting specific growth rate. Rev Aquacult, 12: 1542-1547.
#' https://doi.org/10.1111/raq.12396
#'
#' @importFrom dplyr mutate
#'
#' @export
sgr <- function(ibw, fbw, duration, return_igr = FALSE) {
  # Checks----
  
  ## Check whether inputs are NA
  if (any(is.na(c(ibw, fbw, duration))))
    stop("Inputs cannot be NA")
  
  ## Check whether inputs are non-numeric
  if (any(!is.numeric(ibw) |
          !is.numeric(fbw) | !is.numeric(duration)))
    stop("All inputs must be numeric")
  
  
  if (any(duration == 0))
    stop("Duration is 0. The result cannot be calculated.")
  
  if (any(ibw <= 0 | fbw <= 0))
    warning("Body Weight is zero or negative. The result may not be meaningful.")
  
  
  if (any(duration < 0))
    warning("Duration is negative. The result may not meaningful.")
  
  
  ## Check for inputs of differing length
  length_ratios <- c(length(ibw), length(fbw), length(duration)) / length(ibw)
  if (!all(length_ratios == 1))
    message("Inputs have different lengths.")
  
  
  
  # Calculations----
  ## Calculate IGR
  igr <- (logb(fbw / ibw)) / duration
  
  ## Calculate the SGR based on IGR
  sgr <- ((exp(igr)) - 1) * 100
  
  ## Return the result
  if (return_igr) {
    return(list(sgr = sgr, igr = igr))
  } else {
    return(sgr)
  }
}





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





#' Geometric Mean Bodyweight (GMBW)
#'
#' A function that calculates the geometric mean of the initial and final
#' bodyweight.
#'
#' While the arithmetic mean assumes a linear relationship between the averaged
#' numbers, the geometric mean accounts for the non-linear and potentially 
#' variable nature of animal growth.
#'
#'
#' @param ibw numeric; initial bodyweight weight in grams.
#' @param fbw numeric; final bodyweight in grams.
#'
#' @return numeric value that is the geometric mean bodyweight.
#'
#' @examples
#' data(weight2)
#' dplyr::mutate(weight2, GMBW = gbw(ibw_g, fbw_g))
#'
#' @author Anıl Axel Tellbüscher
#'
#' @importFrom dplyr mutate
#'
#' @export
gbw <- function(ibw, fbw) {
  # Checks----
  ## Check whether inputs are NA
  stopifnot("Inputs must not be NA!" = any(!is.na(c(ibw, fbw))))
  
  
  ## Check whether inputs are numeric
  stopifnot("Inputs must be numeric!" = any(is.numeric(c(ibw, fbw))))
  
  
  ## Check whether inputs are < 0
  stopifnot("Inputs are < 0! Result cannot be calculated." = all(c(ibw, 
                                                                   fbw) >= 0))
  
  
  # Check whether inputs are == 0
  if (any(c(ibw, fbw) == 0))
    warning("Inputs are == 0! The result is not meaningful.")
  
  
  ## Check whether inputs have the same length
  length_ratio <- c(length(ibw), length(fbw)) / length(ibw)
  if (any(length_ratio != 1))
    message("Inputs have different lengths.")
  
  
  
  # Calculations----
  gbw <- sqrt(ibw * fbw)
  
  
  return(gbw)
}





#' Metabolic bodyweight (MBW)
#'
#' The metabolic bodyweight is the rate of energy expenditure in dependence of
#' the bodyweight of an organism. The metabolism of larger animals is generally
#' slower per Kg when comparing with smaller animals. An exponent between 0-1
#' takes that relationship into account in a fairly simple equation.
#'
#' The default exponent is suited to fish only. It was set to 0.8 based on
#' Lupatsch et al. (2003) and should be adjusted to other scenarios.
#'
#' @param ibw a numeric value that is providing the initial weight in
#' grams.
#' @param fbw a numeric value that is providing the final weight in
#' grams.
#' @param mb_exp a numeric value between 0-1 providing the exponent. Default
#' is 0.8 adapted to most fish species.
#'
#' @return returns a numeric value that is the metabolic bodyweight.
#'
#' @examples
#' data(weight2)
#' dplyr::mutate(weight2, MBW = mbw(ibw_g, fbw_g))
#'
#' @author Anıl Axel Tellbüscher
#' @author Davide A. Machado e Silva
#' @author Madhav Karthikeyan
#'
#' @references Lupatsch, I. et al. (2003): Comparison of energy and protein
#' efficiency among three fish species gilthead sea bream (Sparus aurata),
#' European sea bass (Dicentrarchus labrax) and white grouper (Epinephelus
#' aeneus): energy expenditure for protein and lipid deposition. Aquaculture
#' 225, p.175-189.
#'
#' @importFrom dplyr mutate
#'
#' @export
mbw <- function(ibw, fbw, mb_exp = 0.8) {
  # Checks----
  ## Check whether inputs are NA
  stopifnot("Inputs cannot be NA" = any(c(!is.na(ibw), !is.na(fbw))))
  
  
  ## Check whether inputs are non-numeric
  stopifnot("All inputs must be numeric" = any(c(is.numeric(ibw), 
                                                 is.numeric(fbw))))
  
  
  ## Check whether inputs are < 0
  if (any(c(ibw, fbw) < 0))
    stop("Input values are zero or negative. Result cannot be calculated.")
  
  
  ## Check whether inputs are == 0
  if (any(c(ibw, fbw) == 0))
    warning("Input values are zero or negative. The result is not meaningful.")
  
  
  ## Check whether mb_exp is 0-1
  if (any(mb_exp > 1) | any(mb_exp < 0))
    warning("'mb_exp' should be between 0 and 1")
  
  
  ## Check whether inputs have the same length
  length_ratio <- c(length(ibw), length(fbw), length(mb_exp)) / length(ibw)
  if (any(length_ratio != 1))
    message("Input vectors do not have the same length.")
  
  
  
  # Calculations----
  gbw <- sqrt(ibw * fbw)
  
  mbw <- gbw^mb_exp
  
  return(mbw)
}

