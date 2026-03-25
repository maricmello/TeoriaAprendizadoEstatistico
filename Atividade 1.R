rm(list=ls())

library(ISLR)
library(ISLR2)

dados002<-Carseats

modelo002 <- lm(Sales~Comprice+Income+Advertising+Population+Price+Age+Education,data=dados002)

summary(modelo002)

modelo002 <- lm(Sales~Comprice+Income+Advertising+Price+Age+Education,data=dados002)

summary(modelo002)

modelo002 <- lm(Sales~Comprice+Income+Advertising+Price+Age,data=dados002)

summary(modelo002)

