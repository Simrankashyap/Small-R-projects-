#to analyse spambase data
library("class")
data_s=read.csv("spambase.data.txt")
data_s
names(data_s)
View(data_s)
fn=function(x){((x-min(x))/(max(x)-min(x)))}
rowIndex=sample(1:nrow(data_s),0.8*nrow(data_s))
fn=function(x){((x-min(x))/(max(x)-min(x)))}
norm_data=as.data.frame(lapply(data_s[,-58],fn))
train_data=norm_data[rowIndex,]
test_data=norm_data[-rowIndex,]
pred_data=knn(train_data,test_data,data_s[rowIndex,58],k=2)
tb=table(pred_data,data_s[-rowIndex,58])
tb
a=0.2*nrow(data_s)
accuracy=(sum(diag(tb))/a)*100
accuracy
