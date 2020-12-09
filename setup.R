##
## This is the functin which downloads the .zip file, unzips it,
## and generates a tibble which is passed as parameter
## to png1(), png2(), png3(), and png4().
##

setup <- function()
{
  ZIPFILENAME = "household_power_consumptiom.zip"
  
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
               destfile = ZIPFILENAME)
  unzip(ZIPFILENAME)
  
  ##
  ## Library data.table is needed for fread()
  ##
  library("data.table")
  
  TEXTFILENAME <- "household_power_consumption.txt"
  ##
  ## Process the header row to grab the column names
  ##
  header <- fread(TEXTFILENAME, sep=";", nrows = 0)

  ##
  ## we want 2 days of data, where data are sampled
  ## every minute.  We ask for 1 added sample,
  ## occuring on the 3rd day, 
  ## so that we can generate the requested labels on the graphs.
  ##
  NROWS = 2 * 24 * 60 + 1
  data <- fread(TEXTFILENAME, sep=";", skip = "1/2/2007",
              nrows = NROWS)
  names(data) <- names(header)
  
  library("dplyr")
  data <- tbl_df(data)

  ##
  ## Add a Delta_seconds column to the table.
  ## This column contains elapsed time, in seconds,
  ## since 1/2/2007, 00:00:00.
  ##
  FORMAT_DATE_TIME = file_formating()$date_time
  
  ##
  ## t0 is the date 1/2/2007 00:00:00.
  ##
  t0 <- strptime(paste(data$Date[1], data$Time[1]), FORMAT_DATE_TIME)

  
  ##
  ## Add the column to the data tibble, using difftime to 
  ## calculate the time in seconds since t0.
  ##
  data <- data %>% 
    mutate(Delta_Seconds = as.numeric(
                           difftime(strptime(paste(data$Date, data$Time), FORMAT_DATE_TIME),
                                    t0, units = "secs")))

  data
}