# Carregar pacotes
library(rpart)
library(rpart.plot)
library(caret)
library(ggplot2)

# Carregar dados
data(diamonds)
str(diamonds)

# Divisão treino/teste 70/30
set.seed(123)
indice <- createDataPartition(diamonds$price, p = 0.7, list = FALSE)
treino <- diamonds[indice, ]
teste  <- diamonds[-indice, ]

# Árvore de regressão
arvore_reg <- rpart(
  formula = price ~ .,
  data = treino,
  method = "anova",
  control = rpart.control(cp = 0.001, minsplit = 20, minbucket = 7, maxdepth = 8, xval = 10)
)

# Modelo
arvore_reg

# Gráfico
rpart.plot(arvore_reg, type = 2, fallen.leaves = TRUE, main = "Árvore de Regressão - Diamonds")

# Predições
predicoes <- predict(arvore_reg, newdata = teste)

# Avaliação
RMSE <- sqrt(mean((teste$price - predicoes)^2))
MAE  <- mean(abs(teste$price - predicoes))

cat("RMSE =", RMSE, "\n")
cat("MAE =", MAE, "\n")

# Comparação real x previsto
resultado <- data.frame(Real = teste$price, Previsto = predicoes)
head(resultado)
