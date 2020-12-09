png2 <- function(data, single_plot = TRUE)
{
  ##
  ## Generates a plot of global active power
  ## versus time.

  if (single_plot)
  {
    png(file = "figure/plot2.png")
  }
  
  ##
  ## Generate the plot, suppressing the tic marks
  ##
  plot(data$Delta_Seconds, data$Global_active_power, 
       xlab = "Time",
       ylab = "Global Active Power (kilowatts)",
       type = "l",
       main = "Global Active Power",
       xaxt="n"
       )
  ##
  ## Get the tic mark info which is identical for all plots.
  ##
  info <- get_tick_mark_info(data)

  ##
  ## Apply the tic marks at the locations specified in info,
  ## using the labels (ie, day names) specified in info.
  ##
  axis(1, 
       at=info$sec,
       labels= info$day, 
       lty=1
      )   
  
  if (single_plot)
  {
    dev.off()
  }

  
}