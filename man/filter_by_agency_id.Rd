% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/filter_gtfs.R
\name{filter_by_agency_id}
\alias{filter_by_agency_id}
\title{Filter GTFS data by agency ids}
\usage{
filter_by_agency_id(gtfs_data, agency_ids)
}
\arguments{
\item{gtfs_data}{A list of data.tables read using gtfs2gps::reag_gtfs().}

\item{agency_ids}{A vector of strings belonging to the agencies of the
gtfs_data data.}
}
\value{
A filtered GTFS data.
}
\description{
Filter a GTFS data by its agency ids. It also removes the
unnecessary routes, trips, frequencies, stop_times, calendars, shapes, and
stops accordingly.
}
\examples{
poa <- read_gtfs(system.file("extdata/poa.zip", package = "gtfs2gps"))

result <- filter_by_agency_id(poa, "EPTC")
}
