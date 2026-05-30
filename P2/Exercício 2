# Carregar pacotes
library(rpart)
library(rpart.plot)
library(caret)
library(mlbench)

# Base
data(Sonar)
str(Sonar)

# Divisão treino/teste 70/30
set.seed(123)
indice <- createDataPartition(Sonar$Class, p = 0.7, list = FALSE)
treino <- Sonar[indice, ]
teste  <- Sonar[-indice, ]

# Árvore de classificação
arvore_class <- rpart(
  formula = Class ~ .,
  data = treino,
  method = "class",
  parms = list(split = "gini"),
  control = rpart.control(cp = 0.001, minsplit = 2, minbucket = 1, maxdepth = 6, xval = 10)
)

# Modelo
arvore_class

# Gráfico
rpart.plot(arvore_class, type = 3, extra = 104, under = TRUE, faclen = 0,
           fallen.leaves = TRUE, main = "Árvore de Classificação - Sonar")

# Predição
predicoes <- predict(arvore_class, teste, type = "class")

# Avaliação
confusionMatrix(predicoes, teste$Class)

# Comparação real x previsto
resultado <- data.frame(Real = teste$Class, Previsto = predicoes)
head(resultado)
