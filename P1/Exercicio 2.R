# Exercicio 2 - Boston
rm(list=ls())

# Leitura dos dados
boston <- read.csv("D:/mary-/Downloads/Mariana Costa - boston_housing.csv")
str(boston)

# Modelo completo
mod2 <- lm(medv ~ crim + nox + rm + age + tax + lstat, data=boston)
summary(mod2)

# Tirando 'age' (p-valor alto: 0.987)
mod2 <- lm(medv ~ crim + nox + rm + tax + lstat, data=boston)
summary(mod2)

# Tirando 'crim' (p-valor alto: 0.541)
mod2 <- lm(medv ~ nox + rm + tax + lstat, data=boston)
summary(mod2)

# Validando função na mão
b <- mod2$coefficients
# Agora com 4 variáveis (x1 a x4) pois crim e age saíram
calc_boston <- function(x1, x2, x3, x4){
  y <- b[1] + b[2]*x1 + b[3]*x2 + b[4]*x3 + b[5]*x4
  return(y)
}

# Teste manual vs predict
predicao <- predict(mod2, newdata=boston)
# Passando nox, rm, tax e lstat (as que sobraram no mod2)
p_manual <- calc_boston(boston$nox, boston$rm, boston$tax, boston$lstat)

predicao[1]
p_manual[1]
