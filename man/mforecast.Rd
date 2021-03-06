\name{mforecast}
\alias{mforecast}
\alias{forecast.mts}
\alias{print.mforecast}
\alias{summary.mforecast}
\title{Forecasting time series}


\description{
\code{mforecast} is a class of objects for forecasting from multivariate time series or multivariate time series models.
The function invokes particular \emph{methods} which depend on the class of the first argument.

For example, the function \code{\link{forecast.mlm}} makes multivariate forecasts based on the results produced by \code{\link{tslm}}.
}

\usage{
\method{forecast}{mts}(object, h=ifelse(frequency(object)>1, 2*frequency(object), 10),
        level=c(80,95), fan=FALSE, robust=FALSE, lambda = NULL, find.frequency = FALSE,
        allow.multiplicative.trend=FALSE, ...)}

\arguments{
\item{object}{a multivariate time series or multivariate time series model for which forecasts are required}
\item{h}{Number of periods for forecasting}
\item{level}{Confidence level for prediction intervals.}
\item{fan}{If TRUE, \code{level} is set to \code{seq(51,99,by=3)}. This is suitable for fan plots.}
\item{robust}{If TRUE, the function is robust to missing values and outliers in \code{object}. This argument is only valid when \code{object} is of class \code{mts}.}
\item{lambda}{Box-Cox transformation parameter.}
\item{find.frequency}{If TRUE, the function determines the appropriate period, if the data is of unknown period.}
\item{allow.multiplicative.trend}{If TRUE, then ETS models with multiplicative trends are allowed. Otherwise, only additive or no trend ETS models are permitted.}
\item{...}{Additional arguments affecting the forecasts produced.}
}
\value{An object of class "\code{mforecast}".

The function \code{summary} is used to obtain and print a summary of the results, while the function \code{plot} produces a plot of the multivariate forecasts and prediction intervals.

The generic accessors functions \code{fitted.values} and \code{residuals} extract various useful features of the value returned by \code{forecast$model}.

An object of class \code{"mforecast"} is a list usually containing at least the following elements:
\item{model}{A list containing information about the fitted model}
\item{method}{The name of the forecasting method as a character string}
\item{mean}{Point forecasts as a time series}
\item{lower}{Lower limits for prediction intervals}
\item{upper}{Upper limits for prediction intervals}
\item{level}{The confidence values associated with the prediction intervals}
\item{x}{The original time series (either \code{object} itself or the time series used to create the model stored as \code{object}).}
\item{residuals}{Residuals from the fitted model. For models with additive errors, the residuals will be x minus the fitted values.}
\item{fitted}{Fitted values (one-step forecasts)}
}

\seealso{Other functions which return objects of class \code{"mforecast"} are
\code{\link{forecast.mlm}}, \code{forecast.varest}.
}

\author{Rob J Hyndman & Mitchell O'Hara-Wild}
