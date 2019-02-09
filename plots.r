rain=c(3,5,7,5,3,2,6,8,5,6,9,8)
barplot(rain) #simple

month=c("jan","feb","mar","apr","may","jun","jul","aug","sep","oct","nov","dec")
barplot(rain,names=month)
names(rain)=month
rain

barplot(rain)
title(xlab="month",ylab="rainfall in cm")

barplot(rain,xlab = 'month',ylab='rainfall cm',ylim = c(0,10))
abline(h=5)
abline(h=0)
abline(h=seq(1,9,2),lty=8,lwd=2,col='red')
barplot(rain,xlab = 'month',ylab='rainfall cm',ylim = c(0,10),col='lightblue')
box()

table(rain)
barplot(table(rain),ylab='freq',xlab='numeric category')
abline(h=0)

count=c(9,25,15,2,14,25,24,47)
speed=c(2,3,5,9,14,24,29,34)
name=c("taw","torridge","ouse","exe","lyn","brook","ditch","fal")
fw=data.frame(name,count,speed)
fw
row.names(fw)=name
fw
barplot(fw$count,names=row.names(fw),ylab = 'invertebrate count',col = 'tan')
abline(h=0)

barplot(fw)  #error 
barplot(as.matrix(fw))  #stacked bar chart
barplot(as.matrix(fw),col=rainbow(7))  #stacked bar chart

garden=c(47,19,50,46,9,4)
hedgerow=c(10,3,0,16,3,0)
parkland=c(40,5,10,8,0,6)
pasture=c(2,0,7,4,0,0)
woodland=c(2,2,0,0,2,0)
bird=data.frame(garden,hedgerow,parkland,pasture,woodland)
bird
row.names(bird)=c("blackbird","chaffinch","great tit","house sparrow","robin","song")
yo=as.matrix(bird)
bird
barplot(yo)
barplot(yo,ylim = c(0,250))
barplot(yo,ylim = c(0,250),col = rainbow(7))

barplot(yo,beside=TRUE,ylab="total birds counted",xlab="habitat",col = rainbow(5))
barplot(yo,beside = TRUE,legend=TRUE)
title(ylab='total birds',xlab = 'habitat')
barplot(yo,beside=TRUE,legend=TRUE,ylab="total birds counted",xlab="habitat",col = rainbow(5),cex.names =1,ylim = c(0,60))

legend("topright",  c("darkblue","red","black","green","tan","red"), c("blackbird","chaffinch","great tit","house sparrow","robin","song"))


barplot(t(yo),beside = TRUE,legend=TRUE,cex.names = 0.8,col=c('black','pink','tan','red','brown'))
title(ylab = 'bird',xlab = 'species')


#horizontal bars
barplot(yo,beside=TRUE,horiz = TRUE)
barplot(yo,beside=TRUE,horiz = TRUE,legend=TRUE,col=rainbow(5))


length=c(20,21,22,NA,21,20)
speed=c(12,14,12,16,20,21)
algae=c(40,45,45,80,75,65)
no3=c(2.25,2.15,1.75,1.95,1.95,2.75)
bod=c(200,180,135,120,110,120)
mf=data.frame(length,speed,algae,no3,bod)
mf
barplot(colMeans(mf),ylab='measurement')
barplot(apply(mf,2,mean,na.rm=T),ylab = 'measurements')
barplot(apply(mf,2,mean,na.rm=T),ylab = 'measurements',col = rainbow(7))
box()
abline(h=seq(0,120,20),lty=8,lwd=2,col='red')

dev.copy(png,file='u2.jpg')
dev.off()