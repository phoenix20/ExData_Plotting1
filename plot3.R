plot3 <- function(){
  
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
  png(filename = "plot3.png",width = 480,height = 480)
  #### MAKING THE PLOT ######################################## 
  plot(dateTimeValsCT,powerConsumptionDataRaw$Sub_metering_1,type="l",xlab = "",ylab = "Energy Sub metering")
  lines(dateTimeValsCT,powerConsumptionDataRaw$Sub_metering_2,type="l",col="red")
  lines(dateTimeValsCT,powerConsumptionDataRaw$Sub_metering_3,type="l",col="blue")
  #### ADDING LEGEND ##########################################
  legend("topright",lty=rep(1,3),col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  #### CLOSING THE FILE DEVICE ################################
  dev.off()
  
}