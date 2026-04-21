# Exercicio 3 - Heart
rm(list=ls())
library(caret)
library(pROC)

# Leitura dos dados
heart <- read.csv("D:/mary-/Downloads/Teoria do Aprendizado Estatístico/Mariana Costa - heart_disease_uci.csv")
str(heart)

# Ajuste de tipos
heart$target <- factor(heart$target, levels=c(0, 1), labels=c("No", "Yes"))

# Partição 70/30
set.seed(123)
idx <- sample(seq_len(nrow(heart)), size=0.7*nrow(heart))
treino <- heart[idx, ]
teste  <- heart[-idx, ]

# Modelo binomial
mod_log <- glm(target ~ ., data=treino, family=binomial)
summary(mod_log)

# Probabilidades e ROC
prob <- predict(mod_log, newdata=teste, type="response")
roc_obj <- roc(teste$target, prob, levels=c("No", "Yes"), direction="<")

# Melhor threshold
corte <- coords(roc_obj, "best", ret="threshold")

# Classificação e Matriz
pred_final <- factor(ifelse(prob > as.numeric(corte), "Yes", "No"), levels=c("No", "Yes"))
tabela <- table(Predito=pred_final, Real=teste$target)
tabela

# Métricas caret
confusionMatrix(pred_final, teste$target, positive="Yes")

#Acurácia: 70,33%
#Sensibilidade: 90,62%
#Especificidade 59,32%
#Mostrando que o modelo tem apenas baixo desempenho na identificação de indíviduos saudáveis.
#Houve apenas 3 falsos negativos
#Considerando contexto médico isso é um bom sinal.

#
