#' Feed conversion efficiency (FCE)
#' 
#' A function that calculates the feed conversion efficiency (FCE), which is the 
#' inverse of the feed conversion ratio (FCR). As FCR, this metric measures how
#' effectively cultivated species convert feed into weight. However, contrarily 
#' to FCR, the higher the FCE the more efficient the feed conversion is. 
#' 
#' @param ibw numeric; value that is providing the initial body weight in
#' grams.
#' @param fbw numeric; value that is providing the final body weight in
#' grams.
#' @param fi numeric; value providing the total feed intake in grams
#' during the experiment.
#' @param dm numeric; value indicating the dry matter content of the feed.
#' Value in the interval of (0:1),
#' 
#' @return a numeric value that is the feed conversion efficiency (FCE)
#' 
#' @author Anıl Axel Tellbüscher
#' @author Davide A. Machado e Silva
#' @author Madhav Karthikeyan
#' 
#' @export
fce <- function(m_start,
                m_end,
                fi,
                dm = 1){
  #Checks
  if (any(is.na(c(m_start, m_end, fi, dm))))
    stop("Inputs cannot be NA")
  
  if (!is.numeric(m_start) || !is.numeric(m_end) ||
      !is.numeric(fi) || !is.numeric(dm))
    stop("All inputs must be numeric")
  
  if (m_start == 0)
    stop("m_start cannot be zero")
  
  if (m_start < 0 || m_end < 0 || fi < 0 || dm < 0)
    warning("Inputs should not be negative")
  
  if (fi == 0 || dm == 0 || m_end == 0)
    warning("Feed intake, dry matter, or final mass is zero, result may be unreliable")
  
  fce <- 1/fcr(m_start = m_start,
               m_end = m_end,
               fi = fi,
               dm = dm)
  
  return(fce)
}
