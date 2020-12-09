png1 <- function(data)
{
  ##
  ## Generates a histogram of counts of global active power
  ## versus global active power as specified in passed variable
  ## data
  ##
  png(file = "figure/plot1.png")
  
  hist(data$Global_active_power, breaks = 12, col = "red",
       xlab = "Global Active Power (kilowatts)",
       ylab = "Frequency",
       main = "Global Active Power"
       )
  
  dev.off()
}