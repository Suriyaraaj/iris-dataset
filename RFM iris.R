install.packages("randomForest")
install.packages("stats")
install.packages("dplr")
#libraries
library("stats")
library("randomForest")
library("dplyr")

mydata  = iris
View(mydata)
     
# variable selection
str(mydata)

# spliting data in traning and testing 
index = sample(2,nrow(mydata),replace = TRUE,prob = c(0.7,0.3))

# traning data
traning = mydata[index==1,]

#testing data
testing = mydata[index==2,]

#random forest model
RFM = randomForest(Species~.,data = traning)

# model accuracy
Species_Pred = predict(RFM,testing)
testing$Species_Pred = Species_Pred
View(testing)
#building confusion matrix
CFM = table(testing$Species,testing$Species_Pred)
CFM

classification_Accuracy = sum(diag(CFM)/sum(CFM))
classification_Accuracy

