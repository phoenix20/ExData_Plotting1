plot2 <- function(){
  
  listOfIndices1<- grep("1/2/2007",readLines("household_power_consumption.txt"))
  listOfIndices2<- grep("3/2/2007",readLines("household_power_consumption.txt"))
  startElement <- listOfIndices1[1]
  endElement <- listOfIndices2[1]
  numberOfRows <- endElement-startElement
  columnNames  <- read.table("household_power_consumption.txt",sep=";",nrows=1,stringsAsFactors = FALSE)
  powerConsumptionDataRaw <- read.table(file = "household_power_consumption.txt",
                                        stringsAsFactors = FALSE,skip = startElement-1,
                                        nrows= numberOfRows,
                                        sep=";",na.strings = "?")
  
  names(powerConsumptionDataRaw) <- as.character(columnNames)
  #### DATE TIME PARSING ######################################
  dateRaw <- powerConsumptionDataRaw$Date
  timeRaw <- powerConsumptionDataRaw$Time
  
  dateTimeRaw <- paste(dateRaw,timeRaw,sep=" ")
  
  dateTimeVals <- strptime(dateTimeRaw,format = "%d/%m/%Y %H:%M:%S")
  
  dateTimeValsCT <- as.POSIXct(dateTimeVals)
  
  #### OPENING THE PNG DEVILCE ################################
  png(filename = "plot2.png",width = 480,height = 480)
  #### MAKING THE PLOT ######################################## 
  plot(dateTimeValsCT,powerConsumptionDataRaw$Global_active_power,type="l",xlab = "",ylab = "Global Active Power(kilowatts)")
  #### CLOSING THE FILE DEVICE ################################
  dev.off()
  
}