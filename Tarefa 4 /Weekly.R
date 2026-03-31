rm(list=ls())

library(ISLR2)
library(caret)
library(pROC)

dados2 <- ISLR2::Weekly

set.seed(123)
particao <- sample(seq_len(nrow(dados2)), size = 0.7*nrow(dados2))
dados2treino <- dados2[particao, ]
dados2teste  <- dados2[-particao, ]

modelologistico01 <- glm(Direction ~ Lag2,
                         data = dados2treino,
                         family = binomial)

summary(modelologistico01)

prob_modelologistico01 <- predict(modelologistico01,
                                  newdata = dados2teste,
                                  type = "response")

resposta_modelologistico01 <- ifelse(prob_modelologistico01 < 0.5,
                                     "Down",
                                     "Up")

resposta_modelologistico01 <- as.factor(resposta_modelologistico01)

tabelamatrizconfusao <- data.frame(real=dados2teste$Direction,
                                   predicao=resposta_modelologistico01)

acuracia <- mean(tabelamatrizconfusao$real == tabelamatrizconfusao$predicao)

sensibilidade <- mean(tabelamatrizconfusao[tabelamatrizconfusao$real=="Up",1] ==
                        tabelamatrizconfusao[tabelamatrizconfusao$real=="Up",2])

especificidade <- mean(tabelamatrizconfusao[tabelamatrizconfusao$real=="Down",1] ==
                         tabelamatrizconfusao[tabelamatrizconfusao$real=="Down",2])

tabela_predicao <- table(Predito = resposta_modelologistico01,
                         Real = dados2teste$Direction)

tabela_predicao

confusionMatrix(as.factor(resposta_modelologistico01),
                dados2teste$Direction,
                positive= "Down")
