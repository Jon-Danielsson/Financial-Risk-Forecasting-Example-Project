

source('../Code/libraries.r')
source("../Code/ProcessRawData.r")
source("../Code/FitModels.r")
sp500=ProcessRawData(Data="sp500",Print=TRUE)

Result=FitModels(Model="GARCH11",Data=sp500,Print=TRUE)

cat("\nParameter estimates\n")
print(Result@fit$matcoef)

cat("\nLog Likelihood",likelihood(Result)  ,"\n")


png("../Output/sp500-returns-sd.png")
plot(Result,which=1)
dev.off()

pdf("../Output/sp500-returns-sd.pdf")
plot(Result,which=1)
dev.off()


svglite("../Output/sp500-returns-sd.svg", width = 4, height = 4)
plot(Result,which=1)
dev.off()