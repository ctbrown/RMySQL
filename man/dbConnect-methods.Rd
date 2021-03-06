\name{dbConnect-methods}
\docType{methods}
\alias{dbDisconnect-methods}
\alias{dbConnect-methods}
\alias{dbDisconnect,MySQLConnection-method}
\alias{dbConnect,MySQLDriver-method}
\alias{dbConnect,MySQLConnection-method}
\alias{dbConnect,character-method}
\title{
  Create a connection object to an MySQL DBMS
}
\description{
   These methods are straight-forward implementations of the corresponding
   generic functions.
}
\section{Methods}{\describe{
\item{drv}{
  an object of class \code{MySQLDriver}, or
  the character string "MySQL" or an \code{MySQLConnection}.
  }
\item{conn}{
  an \code{MySQLConnection} object as produced by \code{dbConnect}.
  }
\item{username}{string of the MySQL login name or NULL. If NULL or the empty string \code{""}, the current user is assumed.}
\item{password}{string with the MySQL password or NULL. If NULL, only entries in the user table for the users that have a blank (empty) password field are checked for a match.}
\item{dbname}{string with the database name or NULL. If NOT NULL, the connection sets the default database to this value.}
\item{host}{string identifying the host machine running the MySQL server or NULL.
If NULL or the string \code{"localhost"}, a connection to the local host is assumed.}
\item{unix.socket}{(optional) string of the unix socket or named pipe.}
\item{port}{(optional) integer of the TCP/IP default port.}
\item{client.flag}{(optional) integer setting various MySQL client flags.
See the MySQL manual for details.}
\item{group}{string identifying a section in the \code{default.file}
   to use for setting authentication parameters (see \code{\link{MySQL}}.)}
\item{default.file}{string of the filename with MySQL client options. Defaults to
   \code{\$HOME/.my.cnf}}
\item{\dots }{Currently unused.}
}
}
\section{Side Effects}{
  A connection between R/S-Plus and an MySQL  server is 
  established.   The current implementation supports up to
  100 simultaneous connections.
}
\references{
  See the Database Interface definition document
  \code{DBI.pdf} in the base directory of this package
  or \url{http://stat.bell-labs.com/RS-DBI}.
}
\seealso{
  \code{\link{MySQL}},
  \code{\link[DBI]{dbConnect}},
  \code{\link[DBI]{dbSendQuery}},
  \code{\link[DBI]{dbGetQuery}},
  \code{\link[DBI]{fetch}},
  \code{\link[DBI]{dbCommit}},
  \code{\link[DBI]{dbGetInfo}},
  \code{\link[DBI]{dbReadTable}}.
}
\examples{\dontrun{
# create an MySQL instance and create one connection.
drv <- dbDriver("MySQL")

# open the connection using user, passsword, etc., as
con <- dbConnect(drv, group = "rs-dbi")

# Run an SQL statement by creating first a resultSet object
rs <- dbSendQuery(con, statement = paste(
                      "SELECT w.laser_id, w.wavelength, p.cut_off",
                      "FROM WL w, PURGE P", 
                      "WHERE w.laser_id = p.laser_id", 
                      "SORT BY w.laser_id")
# we now fetch records from the resultSet into a data.frame
data <- fetch(rs, n = -1)   # extract all rows
dim(data)
}
}
\keyword{methods}
\keyword{interface}
\keyword{database}
% vim: syntax=tex
