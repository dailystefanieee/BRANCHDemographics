library(ggplot2)
library(tidyr)
setwd("/Users/stefanieflores/Desktop/MGH Branch/Branch")

##dat<- read.csv("BranchDemo.csv")
install.packages("xlsx")
library(readxl)
BranchDemo <- read_excel("BranchDemo.xlsx")
##View(BranchDemo) 
## Remove ## from 9 to see Raw Data

#Simple Bar Plot
