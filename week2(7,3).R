#Apply family
mtcars
View(mtcars)
average<-rep(0,11)
average<-numeric(11)
for(i in 1:11){
  average[i]<-mean(mtcars[,i])
  print(average[i])
}
apply(mtcars,2,mean)
 

###DATA MANIPULATION USING dplyr###
install.packages("dplyr")
library(dplyr)
install.packages("datasets")
library(datasets)
head(airquality)
#select command
#sql equivalent:select wid,day,temp from airquality
selectComm <- select(airquality,Wind,Temp,Day)
head(selectComm)

#filter command
filtercomm<-filter(airquality,temp>60)
head(filtercomm)

#mutate command
#sql equivalent: alter table airquality add TempCelcius integer
mutate(airquality,TempCelsius=(temp-32)/5*9)
mutatecomm<-mutate(airquality,TempCelcius=as.integer((Temp-32)*5/9))
head(mutatecomm)

#arrange command
#sql equivalent:select*from airquality order by month .temp desc;
arrangecomm<-arrange(airquality,Month,-Temp)
head(arrangecomm)

#summarise command
#sql equivalent:select avg(temp) from airquality
summanrise(airquality,Month,mean(Temp))
groupycomm<-summarise(group_by(airquality,Month,mean(Temp)))

#group by column names 
#sql equivalent: select month,mean(temp) from airquality group by month

#piping%>%%
##sql equivalent: select month,mean(temp),from airquality where month>6 group 
filterData<-filter(airquality,Month>6)
groupData<-group_by(filterData,Month)
summarise(groupData,mean(Temp))
pipingData<-filter(airquality,Month>6)%>% group_by(Month)%>%summarise(mean(Temp))

  


head(mutatecomm)
