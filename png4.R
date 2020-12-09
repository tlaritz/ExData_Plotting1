png4 <- function(data)
{
  png(file = "figure/plot4.png")
  
  par(mfrow=c(2, 2))
  
  png2(data, FALSE)
  
  
  ##
  ## Generate Voltage vs time plot
  ##
  plot(data$Delta_Seconds, data$Voltage, 
       col = "black",
       xlab = "datetime",
       ylab = paste("Voltage"),
       type = "l",
       main = "Voltage",
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
  
  
  png3(data, FALSE)
  
  
  ##
  ## Generate Global_reactive_power vs time plot
  ##
  plot(data$Delta_Seconds, data$Global_reactive_power, 
       col = "black",
       xlab = "datetime",
       ylab = "Global_reactive_power",
       type = "l",
       main = "Global_reactive_power",
       xaxt="n"
  )

  ##
  ## Apply the tic marks at the locations specified in info,
  ## using the labels (ie, day names) specified in info.
  ##
  axis(1, 
       at=info$sec,
       labels= info$day, 
       lty=1
  ) 

         
  dev.off()

  
}