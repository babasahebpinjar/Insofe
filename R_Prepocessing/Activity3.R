rm(list=ls(all=TRUE))

#setwd(choose.dir())
getwd()


df1 = read.csv(file= "German-Credit_1.csv",header = T,blank.lines.skip = 1)#exclude the header 
class(df1)


df1 = read.table(file = "German-Credit_1.csv",header = T,sep = ",")
class(df1)
colnames(df1)

#Reading lines from a connection

readLines(con = "German-Credit_1.csv",n = 5)


#Mergin two tables

df2 = read.csv(file = "German-Credit_2.csv",header = T)
names(df2)
names(df1)


df3 = merge(x = df1,y = df2,by.x = "OBS",all = TRUE)
names(df3)

write.csv(x = df3, file = "MergeData.csv",row.names = F)

rm(df1,df2)

ncol(df3)
nrow(df3)


#Data exploration



head(df3)
head(df3,3)


tail(df3,1)

str(df3)
colnames(df3)
num_Attr <- c("DURATION","AMOUNT","INSTALL_RATE","AGE","NUM_CREDITS","NUM_DEPENDENTS")


cat_Attr <- setdiff(x = names(df3),y = num_Attr)

df3[c(6,4),c(1,2)] #extract

df3[,c("OBS","DURATION")]

df3$OBS

df3[c(1,3),]


df3[,"OBS"]

df3[,]

df3[1,2]
rm(df1,df2)

df3$DURATION <- as.numeric()
df3$OBS <- as.character((df3$OBS))
df3$RESPONSE <- as.factor(as.character((df3$RESPONSE)))




#Apply function

df4 = data.frame(apply(df3,MARGIN = 2,FUN = mean)) #row wise MARGIn = 1 


df3[,cat_Attr] <- data.frame(apply(df3[,cat_Attr],2,function(x) as.factor(as.character(x))))

#for user defined inline function use function(x) as above
#why as.character?
#Level problem
fac = c("a","b","c")
fac = as.factor(fac)
fac

d = as.character(fac[c(1,3)])
as.factor(d)


str(df3)
summary(df3)


#fac1 = as.factor(c(1,3))
#levels(fac1)

#df3[,num_Attr] <- data.frame(apply(df3[,num_Attr],2,function(x) as.factor(as.numeric(x))))
#str(df3)

#df3
#head(df3)

#subsetting data

df3[1:3,1:2]

temp <- subset(x = df3,select = c(1,2))
temp <- subset( x = df3,select = -c(OBS,DURATION))
temp


#dropping

df3$OBS <- NULL
df3




sum(is.na(x=df3))
is.na(x=df3)


colSums(is.na(x = df3))


df4 <-na.omit(df3)
summary(df4)
dim(df4)
sum(is.na(df4))

rm(df4)
install.packages("DMwR")
library(DMwR)


df3[manyNAs(df3,0.2),]

df4 <- df3[- manyNAs(df3,0.2),]



df3_imputed <- centralImputation(data = df3)
sum(is.na(df3_imputed))


df3_imputed1 <- knnImputation(data = df3,k = 5)
sum(is.na(df3_imputed1))
sum(is.na(df3))




#When an algorithm takes only categorrical , change numeric to categorical and then calculate