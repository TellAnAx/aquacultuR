#' Daily water parameters
#' 
#' This dataset contains daily readings of water temperature, salinity, and 
#' dissolved oxygen from a feeding trial with Atlantic salmon (Salmo salar).
#' The original dataset ("WaterParametersDaily") was published by
#' Liland et al. (2024) and is from the first out of two trials 
#' ("Trial A"). Alterations to the original data structure were done by 
#' 1) converting the double-row column names into single-row column names,
#' 2) shortening the column names, and 3) converting the table into long 
#' format by moving the tank IDs into a separate column.
#' 
#' @format A data frame with 270 rows and 6 columns:
#' \describe{
#'  \item{date}{date; date of data recording}
#'  \item{tank}{factor; rearing tank identifier}
#'  \item{temp}{numeric; water temperature in degrees Celsius}
#'  \item{salinity}{numeric; salinity in parts per thousand}
#'  \item{do_perc}{numeric; dissolved oxygen in percentage saturation}
#'  \item{do_conc}{numeric; dissolved oxygen concentration in mg/L}
#' }
#'
#' @examples
#' water_params
#' 
#' @references Liland, N., Rønnestad, I., Azevedo, M., Lai, F., Oulie, F., 
#' Conceição, L., Soares, F. (2024): Dataset on the performance of Atlantic 
#' salmon (Salmo salar) reared at different dissolved oxygen levels under 
#' experimental conditions. Data in Brief 57, 110983. 
#' https://doi.org/10.1016/j.dib.2024.110983
#' 
#' @docType data
#' @keywords datasets
#' @name water_params
NULL





#' Daily feed intake
#' 
#' This dataset contains daily feed intake data from a feeding trial with 
#' Atlantic salmon (Salmo salar).
#' The original dataset ("FeedIntake") was published by Liland et al. (2024) 
#' and is from the first out of two trials ("Trial A"). Alterations to the 
#' original data structure were done by 1) converting the double-row column 
#' names into single-row column names, 2) shortening the column names, and 3) 
#' converting the table into long format by moving the tank IDs into a separate 
#' column. NA values have been replaced by the recalculated feed intakes for 
#' the respective day.
#' 
#' @format A data frame with 270 rows and 4 columns:
#' \describe{
#'  \item{date}{date; date of data recording}
#'  \item{tank}{factor; rearing tank identifier}
#'  \item{daily_feed_intake}{numeric; daily feed intake in gram per fish}
#'  \item{cumulative_feed_intake}{numeric; cumulatic feed intake in gram per fish}
#' }
#' 
#' @examples
#' feed_intake
#' 
#' @references Liland, N., Rønnestad, I., Azevedo, M., Lai, F., Oulie, F., 
#' Conceição, L., Soares, F. (2024): Dataset on the performance of Atlantic 
#' salmon (Salmo salar) reared at different dissolved oxygen levels under 
#' experimental conditions. Data in Brief 57, 110983. 
#' https://doi.org/10.1016/j.dib.2024.110983
#' 
#' @docType data
#' @keywords datasets
#' @name feed_intake
NULL





#' Sampling data
#' 
#' This dataset contains the fish weight, fork length, sex, liver weight, 
#' hepatosomatic index, heart weight, cardiosomatic index, gonad weight, 
#' gonadosomatic index, viscera weight, and viscerosomatic index from a 
#' feeding trial with Atlantic salmon (Salmo salar).
#' The original dataset ('FeedIntake') was published by Liland et al. (2024)
#' and is from the first out of two trials ('Trial A'). Alterations to the 
#' original data structure were done by 1) converting the double-row column 
#' names into single-row column names, and 2) removing the 'sex' column.
#' 
#' @format A data frame with 181 rows and 14 columns:
#' \describe{
#'  \item{date}{date; date of data recording}
#'  \item{tank}{factor; rearing tank identifier}
#'  \item{replicate}{factor; replicate identifier}
#'  \item{sample_type}{character; type of sample}
#'  \item{fish_weight}{numeric; weight of fish in gram}
#'  \item{fork_length}{numeric; length of fish from the tip of the snout to the 
#'  end of the middle caudal fin rays in centimeter}
#'  \item{liver_weight}{numeric; weight of the liver in gram}
#'  \item{hsi}{numeric; hepatosomatic index in percent}
#'  \item{heart_weight}{numeric; weight of the heart in gram}
#'  \item{csi}{numeric; cardiosomatic index in percent}
#'  \item{gonad_weight}{numeric; weight of the gonads in gram}
#'  \item{gsi}{numeric; gonadosomatic index in percent}
#'  \item{viscera_weight}{numeric; weight of the viscera ni gram}
#'  \item{vsi}{numeric; viscerosomatic index in percent}
#' }
#' 
#' @examples
#' samplings
#' 
#' @references Liland, N., Rønnestad, I., Azevedo, M., Lai, F., Oulie, F., 
#' Conceição, L., Soares, F. (2024): Dataset on the performance of Atlantic 
#' salmon (Salmo salar) reared at different dissolved oxygen levels under 
#' experimental conditions. Data in Brief 57, 110983. 
#' https://doi.org/10.1016/j.dib.2024.110983
#' 
#' @docType data
#' @keywords datasets
#' @name samplings
NULL





#' Daily count of live and dead fish
#' 
#' This dataset contains the daily count of dead and alive fish during a 29-day
#' feeding trial with Atlantic salmon (Salmo salar).
#' The original dataset ('NumberOfFish') was published by Liland et al. (2024)
#' and is from the first out of two trials ('Trial A'). Alterations to the 
#' original data structure were done by 1) converting the double-row column 
#' names into single-row column names, 2) shortening the column names, and 3) 
#' converting the table into long format by moving the tank IDs into a separate 
#' column.
#' 
#' @format A data frame with 270 rows and 4 columns:
#' \describe{
#'  \item{date}{date; date of data recording}
#'  \item{tank}{factor; rearing tank identifier}
#'  \item{total_number}{numeric; count of fish stocked at the beginning of the experiment}
#'  \item{dead}{numeric; count of dead fish on each recorded day of the experiment}
#' }
#' 
#' @examples
#' fishcount
#' 
#' @references Liland, N., Rønnestad, I., Azevedo, M., Lai, F., Oulie, F., 
#' Conceição, L., Soares, F. (2024): Dataset on the performance of Atlantic 
#' salmon (Salmo salar) reared at different dissolved oxygen levels under 
#' experimental conditions. Data in Brief 57, 110983. 
#' https://doi.org/10.1016/j.dib.2024.110983
#' 
#' @docType data
#' @keywords datasets
#' @name fishcount
NULL





#' Fish body composition
#' 
#' This dataset contains compositional data on the proximate composition and
#' some key minerals in the body of Atlantic salmon (Salmo salar) at the 
#' beginning and the end of a trial.
#' The original dataset ('BodyComposition_tank') was published by Liland et al. 
#' (2024) and is from the first out of two trials ('Trial A'). Alterations to 
#' the original data structure were done by 1) converting the double-row column 
#' names into single-row column names and 2) removing the 'sex' column.
#' 
#' @format A data frame with 12 rows and 14 columns:
#' \describe{
#'  \item{date}{date; }
#'  \item{treatment}{factor; }
#'  \item{tank}{factor; }
#'  \item{dm}{numeric; dry matter content of fish tissue in g/100 g}
#'  \item{water}{numeric; content of fish tissue in g/100 g}
#'  \item{ash}{numeric; content of fish tissue in g/100 g on dry matter 
#'  basis}
#'  \item{energy}{numeric; gross energy content of fish tissue in kJ/g on dry 
#'  matter basis}
#'  \item{fat}{numeric; crude fat content of fish tissue in g/100 g on dry 
#'  matter basis}
#'  \item{protein}{numeric; crude protein content of fish tissue in g/100 g on
#'  dry matter basis}
#'  \item{ca}{numeric; calcium content of fish tissue in mg/kg on dry matter 
#'  basis}
#'  \item{k}{numeric; potassium content of fish tissue in mg/kg on dry matter 
#'  basis}
#'  \item{mg}{numeric; magnesium content of fish tissue in mg/kg on dry matter 
#'  basis}
#'  \item{na}{numeric; sodium content of fish tissue in mg/kg on dry matter 
#'  basis}
#'  \item{phosphorus}{numeric; content of fish tissue in mg/kg on 
#'  dry matter basis}
#' } 
#' 
#' @examples
#' bodycomp
#' 
#' @references Liland, N., Rønnestad, I., Azevedo, M., Lai, F., Oulie, F., 
#' Conceição, L., Soares, F. (2024): Dataset on the performance of Atlantic 
#' salmon (Salmo salar) reared at different dissolved oxygen levels under 
#' experimental conditions. Data in Brief 57, 110983. 
#' https://doi.org/10.1016/j.dib.2024.110983
#' 
#' @docType data
#' @keywords datasets
#' @name bodycomp
NULL





#' Feed composition
#' 
#' This dataset contains compositional data of Skretting Protec, a commercial
#' fish feed. The data comprises the proximate composition, phosphorus, and
#' some essential amino acids. 
#' 
#' @format A data frame with one row and 25 columns:
#' \describe{
#'  \item{diet}{character; feed name}
#'  \item{dry_matter}{numeric; content of feed in percent}
#'  \item{crude_protein}{numeric; content of feed in percent as fed}
#'  \item{crude_lipids}{numeric; content of feed in percent as fed}
#'  \item{ash}{numeric; content of feed in percent as fed}
#'  \item{gross_energy}{numeric; content of feed in MJ per kg as fed}
#'  \item{phosphorus}{numeric; content of feed in percent as fed}
#'  \item{arginine}{numeric; content of feed in percent as fed}
#'  \item{histidine}{numeric; content of feed in percent as fed}
#'  \item{isoleucine}{numeric; content of feed in percent as fed}
#'  \item{leucine}{numeric; content of feed in percent as fed} 
#'  \item{lysine}{numeric; content of feed in percent as fed}
#'  \item{threonine}{numeric; content of feed in percent as fed}
#'  \item{tryptophan}{numeric; content of feed in percent as fed}
#'  \item{valine}{numeric; content of feed in percent as fed}
#'  \item{methionine}{numeric; content of feed in percent as fed}
#'  \item{cysteine}{numeric; content of feed in percent as fed}
#'  \item{phenylalanine}{numeric; content of feed in percent as fed}
#'  \item{tyrosine}{numeric; content of feed in percent as fed}
#'  \item{aspartic_acid}{numeric; content of feed in percent as fed}
#'  \item{glutamic_acid}{numeric; content of feed in percent as fed}
#'  \item{alanine}{numeric; content of feed in percent as fed}
#'  \item{glycine}{numeric; content of feed in percent as fed}
#'  \item{proline}{numeric; content of feed in percent as fed}
#'  \item{serine}{numeric; content of feed in percent as fed}
#' }
#' 
#' @examples
#' feedcomp
#' 
#' @references Liland, N., Rønnestad, I., Azevedo, M., Lai, F., Oulie, F., 
#' Conceição, L., Soares, F. (2024): Dataset on the performance of Atlantic 
#' salmon (Salmo salar) reared at different dissolved oxygen levels under 
#' experimental conditions. Data in Brief 57, 110983. 
#' https://doi.org/10.1016/j.dib.2024.110983
#' 
#' @docType data
#' @keywords datasets
#' @name feedcomp
NULL
