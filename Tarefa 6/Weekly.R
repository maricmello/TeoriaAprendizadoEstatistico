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

# ROC
roc_obj <- roc(response = dados2teste$Direction,
               predictor = prob_modelologistico01,
               levels = c("Down","Up"),
               direction = "<")

plot(roc_obj, main = sprintf("ROC - Weekly (AUC = %.3f)", auc(roc_obj)))

# Melhor threshold
melhor_coordenada <- coords(roc_obj, "best",
                            ret = c("threshold","sensitivity","specificity"))

# Classificação
thr <- melhor_coordenada["threshold"]

pred_class <- ifelse(prob_modelologistico01 > as.numeric(thr),
                     "Up",
                     "Down")

pred_class <- as.factor(pred_class)

# Matriz
tabela_predicao <- table(Predito = pred_class,
                         Real = dados2teste$Direction)

tabela_predicao

# Métricas
accuracy <- mean(pred_class == dados2teste$Direction)
sensitivity <- mean(pred_class[dados2teste$Direction=="Up"] == "Up")
specificity <- mean(pred_class[dados2teste$Direction=="Down"] == "Down")

c(accuracy = accuracy,
  sensitivity = sensitivity,
  specificity = specificity)

# Caret
confusionMatrix(pred_class,
                dados2teste$Direction,
                positive = "Up")
