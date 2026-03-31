rm(list=ls())

library(ISLR)
library(ISLR2)

dados002 <- ISLR::Credit
names(dados002)
str(dados002)

modelo <- lm(Balance ~ Income + Limit + Rating + Cards + Age + Education,
             data = dados002)
summary(modelo)

#Tirando Education
modelo <- lm(Balance ~ Income + Limit + Rating + Cards + Age,
             data = dados002)
summary(modelo)

#Tirando Cards
modelo <- lm(Balance ~ Income + Limit + Rating  + Age,
             data = dados002)
summary(modelo)

#Tirando Age
modelo <- lm(Balance ~ Income + Limit + Rating ,
             data = dados002)
summary(modelo)

#Tirando Limit
modelo <- lm(Balance ~ Income + Rating ,
             data = dados002)
summary(modelo)

#predição
Balance_predicao <- predict(modelo,
                            newdata = dados002,
                            type = "response")

resposta <- data.frame(predicao = Balance_predicao,
                       Balance = dados002$Balance,
                       erro_quadrado = (dados002$Balance - Balance_predicao)^2)

resposta

b0 <- modelo$coefficients[1]
b1 <- modelo$coefficients[2]
b2 <- modelo$coefficients[3]

calculopredicao <- function(x1,x2){
  y <- b0 + b1*x1 + b2*x2
  return(y)
}

predicao2 <- calculopredicao(dados002$Income,
                             dados002$Rating)

predicao2 - Balance_predicao

predicao2[1]
Balance_predicao[1]
