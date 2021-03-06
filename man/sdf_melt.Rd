% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sdf_melt.R
\name{sdf_melt}
\alias{sdf_melt}
\title{Call the melt method}
\usage{
sdf_melt(sc, data, id_variables, value_variables, variable_name, value_name)
}
\arguments{
\item{sc}{A \code{spark_connection}.}

\item{data}{A \code{jobj}: the Spark \code{DataFrame} on which to perform the
function.}

\item{id_variables}{list(string). Column(s) which are used as unique
identifiers.}

\item{value_variables}{list(string). Column(s) which are being unpivoted.}

\item{variable_name}{c(string). The name of a new column, which holds all
the \code{value_variables} names, defaulted to "variable".}

\item{value_name}{c(string). The name of a new column, which holds all the
values of \code{value_variables} column(s). Defaults to "value".}
}
\value{
Returns a \code{jobj}
}
\description{
This method will take a sequence of column names (strings) and unpivots them
into two columns, the "variable_name" and its values.
}
\examples{
\dontrun{
# Set up a spark connection
sc <- spark_connect(master = "local", version = "2.2.0")

# Extract some data
melt_data <- spark_read_json(
  sc,
  "melt_data",
  path = system.file(
    "data_raw/Melt.json",
    package = "sparkts"
  )
) \%>\%
  spark_dataframe()

# Call the method
p <- sdf_melt(
  sc = sc, data = melt_data, id_variables = c("identifier", "date"),
  value_variables = c("two", "one", "three", "four"),
  variable_name = "variable", value_name = "turnover"
)

#' # Return the data to R
p \%>\% dplyr::collect()

spark_disconnect(sc = sc)
}

}
