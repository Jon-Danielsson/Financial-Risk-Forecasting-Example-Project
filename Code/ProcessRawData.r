

ProcessRawData=function(Data="sp500",Print=FALSE){
	fname=paste0('../RawData/',Data,'.csv')
	data=read.csv(fname)

	names(data)[2]="price"
	
	data$y = c(NA,diff(log(data$price)))
	data=data[!is.na(data$y),]
	
	data$date.ts=ymd(data$date)
	
	data$y.ts = zoo(data$y, order.by = data$date.ts)
	data$price.ts = zoo(data$price, order.by = data$date.ts)
	if(Print){
		cat("\nLoading data\n")
		cat("data:        \t",Data,"\n")
		cat("file:        \t",fname,"\n")
		cat("Timespan:    \t", format(min(data$date.ts)),"to", format(max(data$date.ts)),"\n")
		cat("Observations:\t", prettyNum(length(data$date.ts), big.mark = ","),"\n\n")
	}
	return(data)
}