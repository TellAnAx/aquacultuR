#' Feed conversion efficiency (FCE)
#' 
#' A function that calculates the feed conversion efficiency (FCE), which is the 
#' inverse of the feed conversion ratio
#' 
#' @param m_start numeric; value that is providing the initial weight in
#' grams.
#' @param m_end numeric; value that is providing the final weight in
#' grams.
#' @param fi numeric; value providing the total feed intake in grams
#' during the experiment.
#' @param dm numeric; value within the interval of (0:1), indicating the dry 
#' matter content of the feed.
#' 
#' @return a numeric value
#' 
#' @author Anıl Axel Tellbüscher
#' 
#' @export
fce <- function(m_start,
                m_end,
                fi,
                dm = 1){
  
  fce <- 1/fcr(m_start = m_start,
               m_end = m_end,
               fi = fi,
               dm = dm)
  
  return(fce)
  }