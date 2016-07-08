library(maps)
library(mapdata)
library(geosphere)

#lat_sh <- 31.22
#lon_sh <- 121.48
#lat_bj <- 39.90403
#lon_bj <- 116.4075
#inter <- gcIntermediate(c(lon_sh,lat_sh),c(lon_bj,lat_bj),n=50,addStartEnd=TRUE)
#lines(inter)

#read data
trains <- read.csv("F:\\examples\\中国火车班次\\edge.csv",header=TRUE)
stations <- read.csv("F:\\examples\\中国火车班次\\vertex.csv",header=TRUE,as.is=TRUE)

#unique carriers
carriers <- unique(stations$省份)

#create a color scale automagically
pal <- colorRampPalette(c("#333333","white","#1292db"))
colors <- pal(100)

#output all carriers to current directory with .pdf images
for(i in 1:length(carriers))
{
	pdf(paste("F:\\examples\\中国火车班次\\", carriers[i], ".pdf", sep=""), width=11, height=7)
	map("china",col="#191919",fill=TRUE,bg="#000000",lwd=0.05)
	
	#draw arcs in the order of the number of flights between two cities
	fsub <- trains[trains$出发地==carriers[i],]
	fsub <- fsub[order(fsub$车次总数),]
	maxcnt <- max(fsub$车次总数)
	for(j in 1:length(fsub$出发地))
	{
		air1<-stations[stations$省份==fsub[j,]$出发地,]
		air2<-stations[stations$省份==fsub[j,]$目的地,]

		inter<-gcIntermediate(c(air1[1,]$经度,air1[1,]$纬度),c(air2[1,]$经度,air2[1,]$纬度),n=100,addStartEnd=TRUE)

		colindex <- round((fsub[j,]$车次总数/maxcnt)*length(colors))
		lines(inter,col=colors[colindex],lwd=0.6)
	}
	dev.off()
}
