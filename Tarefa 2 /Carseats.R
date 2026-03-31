#limpeza
rm(list=ls())

#biblioteca
library(ISLR)
library(ISLR2)

#carregar dataframe e entender os dados
dados001<-ISLR::Carseats
dados001
names(dados001)
str(dados001)

#criando um modelo de regressão linear
modelodados001<-lm(Sales ~ + CompPrice + Income + Advertising + Population + Price + Age+ Education,
                   data = dados001)
summary(modelodados001)

#Tirando Population
modelodados001<-lm(Sales ~ + CompPrice + Income + Advertising  + Price + Age+ Education,
                   data = dados001)
summary(modelodados001)

#Tirando Education
modelodados001<-lm(Sales ~ + CompPrice + Income + Advertising  + Price + Age,
                   data = dados001)
summary(modelodados001)

#predição dos modelos
Sales_predicao<-predict(modelodados001,
                        newdata = dados001,
                        type = "response" )

resposta<-data.frame(predicao = Sales_predicao,
                     Sales = dados001$Sales,
                     erro_quadrado = (dados001$Sales-Sales_predicao)^2)
resposta


#criando a função


b0<-modelodados001$coefficients[1]
b1<-modelodados001$coefficients[2]
b2<-modelodados001$coefficients[3]
b3<-modelodados001$coefficients[4]
b4<-modelodados001$coefficients[5]
b5<-modelodados001$coefficients[6]

calculopredicao <-function(x1,x2,x3,x4,x5){
  y<-b0++b1*x1+b2*x2+b3*x3+b4*x4+b5*x5
  return(y)
}

#predição do modelo
predicao2<-calculopredicao(dados001$CompPrice ,
                           dados001$Income,
                           dados001$Advertising,
                           dados001$Price,
                           dados001$Age)

predicao2++Sales_predicao

predicao2[1]
Sales_predicao[1]
