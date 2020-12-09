png3 <- function(data, single_plot = TRUE)
{
  ##
  ## Generates a plot of global active power
  ## versus time.

  if (single_plot)
  {
    png(file = "figure/plot3.png")
  }
  
  ##
  ## Generate the plot, suppressing the tic marks
  ##
  plot(data$Delta_Seconds, data$Sub_metering_1, 
       xlab = "Time",
       ylab = "Energy sub metering",
       type = "l",
       main = "Sub metering",
       xaxt="n"
       )
  
  lines(data$Delta_Seconds, data$Sub_metering_2, col="red",lty=1)
  
  lines(data$Delta_Seconds, data$Sub_metering_3, col="blue",lty=1)
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
  
  legend(x="topright", col = c("black", "red", "blue"), lty = 1,
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
  
  if (single_plot)       
  {
    dev.off()
  }
}