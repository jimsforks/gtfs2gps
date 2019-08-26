
#' Read files of a gtfs.zip feed and load them to memory as data.frames/data.tables. The 
#' function will load to memory the following files: "calendar.txt", "routes.txt", "shapes.txt", 
#' "stop_times.txt", "stops.txt" and "trips.txt".
#'
#' @param gtfszip A zipped Year of the data (defaults to 2010)
#' @export
#' @examples \donttest{
#'
#' library(gtfs2gps)
#'
#' read_gtfs(gtfszip= "./data/poa_gtfs.zip")
#'}
read_gtfs <- function(gtfszip){
# Use GForce Optimisations in data.table operations
  # details > https://jangorecki.gitlab.io/data.cube/library/data.table/html/datatable-optimize.html
  options(datatable.optimize=Inf)

# Unzip files
  tempd <- file.path(tempdir(), "gtfsdir") # create tempr dir to save GTFS unzipped files
  unlink(paste0(normalizePath(tempd), "/", dir(tempd)), recursive = TRUE) # clean tempfiles in that dir
  unzip(zipfile = gtfszip, exdir = tempd, overwrite = T) # unzip files
  unzippedfiles <- list.files(tempd) # list of unzipped files

    
# read files to memory
  if("routes.txt" %in% unzippedfiles){     routes <<- data.table::fread( paste0(tempd,"/routes.txt"), encoding="UTF-8")}       else{stop(message("Error: File routes.txt is missing"))}
  if("stops.txt" %in% unzippedfiles){      stops <<- data.table::fread( paste0(tempd,"/stops.txt"), encoding="UTF-8")}         else{stop(message("Error: File stops.txt is missing"))}
  if("stop_times.txt" %in% unzippedfiles){ stoptimes <<- data.table::fread( paste0(tempd,"/stop_times.txt"), encoding="UTF-8")}else{stop(message("Error: File stop_times.txt is missing"))}
  if("shapes.txt" %in% unzippedfiles){     shapes <<- data.table::fread( paste0(tempd,"/shapes.txt"), encoding="UTF-8")}       else{stop(message("Error: File shapes.txt is missing"))}
  if("trips.txt" %in% unzippedfiles){      trips <<- data.table::fread( paste0(tempd,"/trips.txt"), encoding="UTF-8")}         else{stop(message("Error: File trips.txt is missing"))}
  if("calendar.txt" %in% unzippedfiles){   calendar <<- data.table::fread( paste0(tempd,"/calendar.txt"), encoding="UTF-8")}   else{stop(message("Error: File calendar.txt is missing"))}
  if("frequencies.txt" %in% unzippedfiles){frequencies <<- data.table::fread( paste0(tempd,"/frequencies.txt"), encoding="UTF-8") }
}