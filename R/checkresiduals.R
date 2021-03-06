checkresiduals <- function(object, lag)
{
  # Extract residuals
  if(is.element("ts",class(object)) | is.element("numeric",class(object)) )
    residuals <- object
  else
    residuals <- residuals(object)

  # Produce plots
  ggtsdisplay(residuals, plot.type="histogram")

  # Check if we have the model
  if(is.element("forecast",class(object)))
    object <- object$model
  if(is.null(object))
    return()

  # Find model df
  if(is.element("ets",class(object)))
    df <- length(object$par)
  else if(is.element("Arima",class(object)))
    df <- length(object$coef)
  else if(is.element("bats",class(object)))
    df <- length(object$parameters$vect) + NROW(object$seed.states)
  else
    df <- NULL

  # Do Ljung-Box test
  if(!is.null(df))
  {
    freq <- frequency(residuals)
    if(missing(lag))
      lag <- max(df+3, ifelse(freq>1, 2*freq, 10))
    print(Box.test(residuals, fitdf=df, lag=lag, type="Ljung"))
    cat(paste("Model df: ",df,".   Total lags used: ",lag,"\n\n",sep=""))
  }
}

