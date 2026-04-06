# Regressão Logística - Caravan
rm(list=ls())

library(ISLR2)
library(caret)
library(pROC)

# Carregar dados
dados <- ISLR2::Caravan

# Separação treino/teste
set.seed(123)
particao <- sample(seq_len(nrow(dados)), size=0.7*nrow(dados))
treino <- dados[particao, ]
teste  <- dados[-particao, ]

# Modelo
modelo <- glm(Purchase ~ ., data=treino, family=binomial)
summary(modelo)

# Predição
probabilidade <- predict(modelo, newdata=teste, type="response")

# ROC e melhor threshold
roc_obj <- roc(response=teste$Purchase, predictor=probabilidade, levels=c("No","Yes"), direction="<")
melhor_coordenada <- coords(roc_obj, "best", ret=c("threshold","sensitivity","specificity"))
melhor_coordenada1 <- roc_obj$thresholds[188]

# Classificação
resposta <- ifelse(probabilidade < as.numeric(melhor_coordenada[1]), "No", "Yes")
resposta <- as.factor(resposta)

# Matriz de confusão
thr <- melhor_coordenada[1]
classe_predita <- ifelse(probabilidade > as.numeric(thr), "Yes", "No")
tabela <- table(Predito=classe_predita, Real=teste$Purchase)
tabela

# Métricas
acuracia <- mean(classe_predita == teste$Purchase)
sensibilidade <- mean(classe_predita[teste$Purchase=="Yes"]=="Yes")
especificidade <- mean(classe_predita[teste$Purchase=="No"]=="No")
c(acuracia=acuracia, sensibilidade=sensibilidade, especificidade=especificidade)

# ConfusionMatrix caret
resumo <- confusionMatrix(resposta, teste$Purchase, positive="Yes")
resumo
resumo$table
resumo$overall
resumo$byClass
