# Exercicio 2 - Boston
rm(list=ls())

# Leitura dos dados
boston <- read.csv("D:/mary-/Downloads/Teoria do Aprendizado Estatístico/Mariana Costa - boston_housing.csv")
str(boston)

# Modelo completo
mod2 <- lm(medv ~ crim + nox + rm + age + tax + lstat, data=boston)
summary(mod2)

# Tirando age (p-valor alto: 0,987)
mod2 <- lm(medv ~ crim + nox + rm + tax + lstat, data=boston)
summary(mod2)

# Tirando crim (p-valor alto: 0,541)
mod2 <- lm(medv ~ nox + rm + tax + lstat, data=boston)
summary(mod2)

# Predição
predicao <- predict(mod2,
                    newdata = boston,
                    type = "response")

# Criando tabela de resposta
resposta <- data.frame(predicao = predicao,
                       medv = boston$medv,
                       erro_quadrado = (boston$medv - predicao)^2)

resposta

# Coeficientes 
b0 <- mod2$coefficients[1]
b1 <- mod2$coefficients[2]  
b2 <- mod2$coefficients[3]
b3 <- mod2$coefficients[4]
b4 <- mod2$coefficients[5]  

# Função manual
calculopredicao <- function(x1, x2, x3, x4){
  y <- b0 + b1*x1 + b2*x2 + b3*x3 + b4*x4
  return(y)
}

# Predição manual
predicao2 <- calculopredicao(boston$nox,
                             boston$rm,
                             boston$tax,
                             boston$lstat)

# Comparação
predicao2 - predicao


predicao2[1]
predicao[1]

#Resultado: predicao2 = 38.08821 // predicao = 38.08821
