# Carregar pacotes
library(palmerpenguins)
library(caret)
library(nnet)

# Base
data(penguins)
dados <- na.omit(penguins)  # remove NA
dados <- dados[, c("species","bill_length_mm","bill_depth_mm","flipper_length_mm","body_mass_g")]

str(dados)

# Divisão treino/teste 70/30
set.seed(123)
indice <- createDataPartition(dados$species, p = 0.7, list = FALSE)
treino <- dados[indice, ]
teste  <- dados[-indice, ]

# Regressão logística multinomial
modelo <- multinom(species ~ bill_length_mm + bill_depth_mm + flipper_length_mm + body_mass_g, data = treino)

# Modelo
summary(modelo)

# Predição
predicoes <- predict(modelo, newdata = teste)

# Avaliação
confusionMatrix(predicoes, teste$species)

# Comparação real x previsto
resultado <- data.frame(Real = teste$species, Previsto = predicoes)
head(resultado)
