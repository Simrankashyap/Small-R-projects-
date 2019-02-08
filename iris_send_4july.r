#IRIS TRAINING DATA
View(iris)
row_index=sample(1:nrow(iris),0.8*nrow(iris))
d=function(x){((x-min(x))/(max(x)-min(x)))}
#install.packages("class")
library("class")
norm_data=lapply(iris[,-5],d)
class(norm_data)
norm_data=as.data.frame(norm_data)
train_data_i=norm_data[row_index,]
test_data_i=norm_data[-row_index,]
pred_model=knn(train_data_i,test_data_i,iris[row_index,5],k=2)
predicted_table=table(pred_model,iris[-row_index,5])
a=0.2*nrow(iris)
diag_element=diag(predicted_table)
accuracy_iris=(sum(diag_element)/a)*100
accuracy_iris

