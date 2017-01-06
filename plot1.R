plot1 <- function(){
  
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
      #### OPENING THE PNG DEVILCE ################################
      png(filename = "plot1.png",width = 480,height = 480)
      #### MAKING THE PLOT ######################################## 
      hist(powerConsumptionDataRaw$Global_active_power,xlab = "Global Active Power(kilowatts)",col="purple",main="Global Active Power")
      #### CLOSING THE FILE DEVICE ################################
      dev.off()
          
}