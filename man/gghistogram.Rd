\name{gghistogram}
\alias{gghistogram}
\title{Histogram with optional normal and kernel density functions}
\usage{gghistogram(x, add.normal=FALSE, add.kde=FALSE, add.rug=TRUE, bins)
}
\arguments{
\item{x}{a numerical vector.}
\item{add.normal}{Add a normal density function for comparison}
\item{add.kde}{Add a kernel density estimate for comparison}
\item{add.rug}{Add a rug plot on the horizontal axis}
\item{bins}{The number of bins to use for the histogram. Selected by default using the Friedman-Diaconis rule given by \code{\link[grDevices]{nclass.FD}}}
\item{\dots}{Not used (for consistency with lag.plot)}
}

\description{Plots a histogram and density estimates using ggplot.
}

\value{None.
}

\author{Rob J Hyndman}
\seealso{\code{\link[graphics]{hist}}, \code{\link[ggplot2]{geom_histogram}}}
\examples{
gghistogram(lynx, add.kde=TRUE)
}

