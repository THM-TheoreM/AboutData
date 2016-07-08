a<-read.csv("F:\\examples\\中国火车班次\\analysis.csv",header=TRUE)
anal=a[c(4,5,8,9,10)]
ans=kmeans(scale(anal),4,nstart=15)
class=data.frame(a$省份,ans[1])
print(class[order(class$cluster),])