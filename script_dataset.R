# FIX THE DATASET

library(readr)
amazon <- read_csv("amazon.csv")
#View(amazon)

#levels(factor(amazon$state))

for (i in 1:dim(amazon)[1]) {
  if(amazon$month[i]=="Janeiro")
    amazon$month[i]="January"
}

for (i in 1:dim(amazon)[1]) {
  if(amazon$month[i]=="Fevereiro")
    amazon$month[i]="February"
}

for (i in 1:dim(amazon)[1]) {
  if(startWith(amazon$month[i],"Mar"))
    amazon$month[i]="March"
}


for (i in 1:dim(amazon)[1]) {
  if(amazon$month[i]=="Abril")
    amazon$month[i]="April"
}

for (i in 1:dim(amazon)[1]) {
  if(amazon$month[i]=="Maio")
    amazon$month[i]="May"
}

for (i in 1:dim(amazon)[1]) {
  if(amazon$month[i]=="Junho")
    amazon$month[i]="June"
}

for (i in 1:dim(amazon)[1]) {
  if(amazon$month[i]=="Julho")
    amazon$month[i]="July"
}

for (i in 1:dim(amazon)[1]) {
  if(amazon$month[i]=="Agosto")
    amazon$month[i]="August"
}

for (i in 1:dim(amazon)[1]) {
  if(amazon$month[i]=="Setembro")
    amazon$month[i]="September"
}

for (i in 1:dim(amazon)[1]) {
  if(amazon$month[i]=="Outubro")
    amazon$month[i]="October"
}

for (i in 1:dim(amazon)[1]) {
  if(amazon$month[i]=="Novembro")
    amazon$month[i]="November"
}

for (i in 1:dim(amazon)[1]) {
  if(amazon$month[i]=="Dezembro")
    amazon$month[i]="Dicember"
}

#save(amazon)


########################################################################################


#choose 1 year, 1 state

#choose 1998
data_1998=amazon[which(amazon$year == "1998"),]

#choose Acre
data_1998_Acre=data_1998[which(data_1998$state == "Acre"),]

# Remove dots:
for (i in 1:length(amazon$number)) {
  if (amazon$number[i] %% 1 != 0) {
    amazon$number[i] = amazon$number[i]*1000
  }
}

