% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sdf_duplicate_marker.R
\name{sdf_duplicate_marker}
\alias{sdf_duplicate_marker}
\title{Calculate the standard error}
\usage{
sdf_duplicate_marker(sc, data, partcol, ordcol, new_col1)
}
\arguments{
\item{sc}{A \code{spark_connection}.}

\item{data}{A \code{jobj}: the Spark \code{DataFrame} on which to perform the
function.}

\item{x_col}{A string. The column to be used as X in the calculation.}

\item{y_col}{A string. The column to be used as Y in the calculation.}

\item{z_col}{A string. The column to be used as Z in the calculation.}

\item{new_column_name}{A string. This is what the standard error column is
called, it can be defaulted to "StandardError".}
}
\value{
Returns a \code{jobj}.
}
\description{
This function will add an extra column on to a Spark DataFrame containing the
standard error.
}
\examples{
\dontrun{
# Set up a spark connection
sc <- spark_connect(master = "local", version = "2.2.0")

# Extract some data
std_data <- spark_read_json(
  sc,
  "std_data",
  path = system.file(
    "data_raw/StandardErrorDataIn.json",
    package = "sparkts"
  )
) \%>\%
  spark_dataframe()

# Call the method
p <- sdf_standard_error(
  sc, std_data, x_col = "xColumn", y_col = "yColumn", z_col = "zColumn",
  new_column_name = "StandardError"
)

# Return the data to R
p \%>\% dplyr::collect()

spark_disconnect(sc = sc)
}

}
