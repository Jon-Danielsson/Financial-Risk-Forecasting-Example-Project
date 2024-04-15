




FitModels=function(Model="GARCH11",deMean=TRUE,Data=sp500,Print=FALSE){

	if(Print){
		cat("Running estimation\n")
		cat("Model",Model,"deMean", deMean,"\n\n")
	}

	if(deMean ) sp500$y=sp500$y-mean(sp500$y)
	
	if(Model=="GARCH11"){
		spec = ugarchspec(
		    variance.model = list(garchOrder = c(1,1)),
		    mean.model = list(armaOrder = c(0,0), include.mean = FALSE)
		)
		
		GARCH11 = ugarchfit(spec = spec, data = sp500$y.ts)
		return(GARCH11)
	}
	stop(paste("Error: Model", Model,"does not exist"))
	
}


