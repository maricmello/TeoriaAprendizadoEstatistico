rm(list=ls())

library(ISLR)
library(ISLR2)

dados001 <- ISLR::Hitters
str(dados001)

modelo_vazio <- lm(Salary ~ 1, data=dados001)

modelo_completo <- lm(Salary ~ . - League - Division - NewLeague,
                      data=dados001)

summary(modelo_completo)

step_forward <- step(modelo_vazio,
                     scope=formula(modelo_completo),
                     direction="forward",
                     trace=0)

step_backward <- step(modelo_completo,
                      direction="backward",
                      trace=0)

step_both <- step(modelo_completo,
                  direction="both",
                  trace=0)

formula(step_forward)
formula(step_backward)
formula(step_both)

summary(step_forward)
summary(step_backward)
summary(step_both)

#step escolhido: backward
salary_predicao <- predict(step_backward,
                           newdata=dados001,
                           type="response")

resposta <- data.frame(
  predicao = salary_predicao,
  Salary = dados001$Salary,
  erro_quadrado = (dados001$Salary - salary_predicao)^2
)

resposta

coef(step_backward)

b0 <- step_backward$coefficients[1]
b1 <- step_backward$coefficients[2]
b2 <- step_backward$coefficients[3]
b3 <- step_backward$coefficients[4]
b4 <- step_backward$coefficients[5]
b5 <- step_backward$coefficients[6]
b6 <- step_backward$coefficients[7]
b7 <- step_backward$coefficients[8]
b8 <- step_backward$coefficients[9]
b9 <- step_backward$coefficients[10]

calculopredicao <- function(x1,x2,x3,x4,x5,x6,x7,x8,x9){
  
  y <- b0 +
    b1*x1 +
    b2*x2 +
    b3*x3 +
    b4*x4 +
    b5*x5 +
    b6*x6 +
    b7*x7 +
    b8*x8 +
    b9*x9
  
  return(y)
}

predicao2 <- calculopredicao(
  dados001$AtBat,
  dados001$Hits,
  dados001$Walks,
  dados001$CAtBat,
  dados001$CRuns,
  dados001$CRBI,
  dados001$CWalks,
  dados001$PutOuts,
  dados001$Assists
)

predicao2[1]
salary_predicao[1]
