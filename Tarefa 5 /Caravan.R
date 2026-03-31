rm(list=ls())

library(ISLR2)
library(caret)
library(pROC)

dados2 <- ISLR2::Caravan

set.seed(123)
particao <- sample(seq_len(nrow(dados2)), size = 0.7*nrow(dados2))
dados2treino <- dados2[particao, ]
dados2teste  <- dados2[-particao, ]

modelologistico01 <- glm(Purchase ~ APLEZIER + PBRAND + PPERSAUT,
                         data = dados2treino,
                         family = binomial)

summary(modelologistico01)

prob_modelologistico01 <- predict(modelologistico01,
                                  newdata = dados2teste,
                                  type = "response")

resposta_modelologistico01 <- ifelse(prob_modelologistico01 < 0.5,
                                     "No",
                                     "Yes")

resposta_modelologistico01 <- as.factor(resposta_modelologistico01)

tabelamatrizconfusao <- data.frame(real=dados2teste$Purchase,
                                   predicao=resposta_modelologistico01)

acuracia <- mean(tabelamatrizconfusao$real == tabelamatrizconfusao$predicao)

sensibilidade <- mean(tabelamatrizconfusao[tabelamatrizconfusao$real=="Yes",1] ==
                        tabelamatrizconfusao[tabelamatrizconfusao$real=="Yes",2])

especificidade <- mean(tabelamatrizconfusao[tabelamatrizconfusao$real=="No",1] ==
                         tabelamatrizconfusao[tabelamatrizconfusao$real=="No",2])

tabela_predicao <- table(Predito = resposta_modelologistico01,
                         Real = dados2teste$Purchase)

tabela_predicao

confusionMatrix(as.factor(resposta_modelologistico01),
                dados2teste$Purchase,
                positive= "Yes")
