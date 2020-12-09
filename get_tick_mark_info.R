## This function returns a list consisting of two vectors:
## 1. A numeric vector consisting of the times at which the
## tic marks are to be placed.  These times are expressed in elapsed
## time (in seconds) since the start of the plot
## 2. A character vector of the day names (ie, "Fri")
## which are the labels to be applied at the tick marks.


get_tick_mark_info <- function(data)
{

  ##
  ## The vectors below specify the locations of the tic marks.
  ##
  tick_mark_dates = c("1/2/2007", "2/2/2007", "3/2/2007")
  tick_mark_time = "00:00:00"

  FORMAT_DATA_TIME = file_formating()$date_time

  info = list()
  ##
  ## Iterate thru the list of tic mark dates and extract
  ## the elapsed time in seconds and the day name.
  ## Stuff the results in info, which is the returned variable.
  ##
  for(d in tick_mark_dates)
  {
    index = (data$Date == d) & (data$Time == tick_mark_time)
    delta_seconds = data$Delta_Seconds[index]    
    day = substr(weekdays(strptime(paste(d, tick_mark_time), FORMAT_DATA_TIME)),1,3)
    info[["day"]] <- c(info[["day"]], day)
    info[["sec"]] <- c(info[["sec"]], delta_seconds)    
  }
  info
}