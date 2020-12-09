file_formating <- function()
{
  ##
  ## This function sets constants describing the formating
  ## of the data and time within the .txt file.
  ##
  
  FORMAT_DATE = "%d/%m/%Y"
  FORMAT_TIME = "%H:%M:%S"
  FORMAT_DATE_TIME = paste(FORMAT_DATE, FORMAT_TIME, sep = " ")
  FORMAT_DATE_TIME = list(date = FORMAT_DATE, time = FORMAT_TIME, date_time = FORMAT_DATE_TIME)
  FORMAT_DATE_TIME
}