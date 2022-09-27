#Branch Demographics Updated 9-26-22
# I split the age groups into 1, 2, 3; 1= ages 18-24, 2=ages 25-55, 3=56+

library(ggplot2)
library(tidyr)
#setwd("/Users/stefanieflores/Desktop/MGH Branch/Branch")

##dat<- read.csv("BranchDemo.csv")
install.packages("xlsx")
library(readxl)
##BranchDemo <- read_excel("BranchDemo.xlsx")
## I also included the ability to like read the excel... but It's the exact same data as the csv
##View(BranchDemo) 
## Remove ## from 13 to see Raw Data if wanted

dat <- read.csv("BranchDemo.csv")

## dim(dat) tells you how many data points/ people are in this so far
dim(dat)

## class(dat$x) just tells you the type of data markings I used to store these; feel free to delete # to check
#class(dat$Gender)
#class(dat$Race)
#class(dat$Age)

dat$Race <- as.factor(dat$Race)
Race <- levels(dat$Race)
Race

# W=White, B=Black, L=Latino, EA= East Asian, A= Asian, N= North African/ Middle Eastern
A<-length(dat$Race[dat$Race==Race[1]])
B<-length(dat$Race[dat$Race==Race[2]])
EA<-length(dat$Race[dat$Race==Race[3]])
L<-length(dat$Race[dat$Race==Race[4]])
N<-length(dat$Race[dat$Race==Race[5]])
W<-length(dat$Race[dat$Race==Race[6]])

#How Many Members of Each Race?
Race.obs <- data.frame(Race=Race,n=c(A,B,EA,L,N,W))
Race.obs

library(tidyverse)
dat %>%
  group_by(Race) %>%summarise(n = n())
dat %>%
  group_by(Age) %>%summarise(n = n())
dat %>%
  group_by(Gender) %>%summarise(n = n())

# Categories We Actually Want to See (R,G,A)
dat %>% 
  count(Race,Gender,Age) %>%
  print() %>%
  count(Race,name = "n.Gender")

# Race and Age Data
dat %>% 
  count(Race,Age) %>%
  print() %>%
  count(Race,name = "n.Age")

# Stacked Bar Plot with Colors and Legend For Gender and Age
counts <- table(dat$Gender, dat$Age)
barplot(counts, main="Gender and Age",
        xlab="Age Group", col=c("Pink","LightBlue"),
        legend = rownames(counts))

# Stacked Bar Plot with Colors and Legend For Gender and Race
counts <- table(dat$Gender, dat$Race)
barplot(counts, main="Gender and Race",
        xlab="Race", col=c("Pink","LightBlue"),
        legend = rownames(counts))

# Stacked Bar Plot with Colors and Legend For Race and Age
counts <- table(dat$Race, dat$Age)
barplot(counts, main="Race and Age",
        xlab="Age", col=c("LightPink","Black","LightGreen","LightBlue", "Orange","White"),
        legend = rownames(counts))

