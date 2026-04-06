rm(list=ls())

library(ISLR)
library(caret)
library(pROC)

dados2 <- ISLR::Default

set.seed(123)
particao <- sample(seq_len(nrow(dados2)), size = 0.7*nrow(dados2))
dados2treino <- dados2[particao, ]
dados2teste  <- dados2[-particao, ]

modelologistico01 <- glm(student ~ . - default,
                         data = dados2treino,
                         family = binomial)

summary(modelologistico01)

prob_modelologistico01 <- predict(modelologistico01,
                                  newdata = dados2teste,
                                  type = "response")

# ROC
roc_obj <- roc(response = dados2teste$student,
               predictor = prob_modelologistico01,
               levels = c("No","Yes"),
               direction = "<")

plot(roc_obj, main = sprintf("ROC - Default (AUC = %.3f)", auc(roc_obj)))

# Melhor threshold
melhor_coordenada <- coords(roc_obj, "best",
                            ret = c("threshold","sensitivity","specificity"))

# Classificação
thr <- melhor_coordenada["threshold"]

pred_class <- ifelse(prob_modelologistico01 > as.numeric(thr),
                     "Yes",
                     "No")

pred_class <- as.factor(pred_class)

# Matriz
tabela_predicao <- table(Predito = pred_class,
                         Real = dados2teste$student)

tabela_predicao

# Métricas
accuracy <- mean(pred_class == dados2teste$student)
sensitivity <- mean(pred_class[dados2teste$student=="Yes"] == "Yes")
specificity <- mean(pred_class[dados2teste$student=="No"] == "No")

c(accuracy = accuracy,
  sensitivity = sensitivity,
  specificity = specificity)

# Caret
confusionMatrix(pred_class,
                dados2teste$student,
                positive = "Yes")
