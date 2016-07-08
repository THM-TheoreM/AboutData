library(maps)
library(mapdata)
library(geosphere)

#read data
trains <- read.csv("F:\\examples\\中国火车班次\\edge.csv",header=TRUE)
stations <- read.csv("F:\\examples\\中国火车班次\\vertex.csv",header=TRUE)
xlim=c(min(stations$经度),max(stations$经度))
ylim=c(min(stations$纬度),max(stations$纬度))

#create a color scale automagically
pal <- colorRampPalette(c("gray","green","black"))
colors <- pal(100)

#output all carriers to current directory with .pdf images
pdf(paste("F:\\examples\\中国火车班次\\全国铁路网.pdf"), width=11, height=7)
map("china",col="blue",fill=FALSE,bg="white",lwd=0.05,xlim=xlim,ylim=ylim)

#draw arcs in the order of the number of flights between two cities
trains <- trains[order(trains$车次总数),]
maxcnt <- max(trains$车次总数)
for(j in 1:length(trains[,1]))
{
	station1<-stations[stations$省份==trains[j,]$出发地,]
	station2<-stations[stations$省份==trains[j,]$目的地,]

	inter<-gcIntermediate(c(station1$经度,station1$纬度),c(station2$经度,station2$纬度),n=100,addStartEnd=TRUE)

	colindex <- round((trains[j,]$车次总数/maxcnt)*length(colors))
	lines(inter,col=colors[colindex],lwd=0.6)
}
dev.off()
