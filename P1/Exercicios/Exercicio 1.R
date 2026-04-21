# Exercício 1 - Auto
rm(list=ls())

# Leitura dos dados
auto <- read.csv("D:/mary-/Downloads/Teoria do Aprendizado Estatístico/Mariana Costa - autos.csv")
str(auto)

# Ajuste de tipos
auto$origin <- as.factor(auto$origin)

# Modelo Linear: sem displacement por redundância e name por ser texto
mod_auto <- lm(mpg ~ cylinders + horsepower + weight + acceleration + model_year + origin, data=auto)
summary(mod_auto)

#Retirando cylinders (p-valor alto: 0,804)
mod_auto <- lm(mpg ~ horsepower + weight + acceleration + model_year + origin, data=auto)
summary(mod_auto)

#Retirando origin (p-valor alto: 0,817)
mod_auto <- lm(mpg ~ horsepower + weight + acceleration + model_year, data=auto)
summary(mod_auto)

#Retirando acceleration (p-valor alto: 0,434)
mod_auto <- lm(mpg ~ horsepower + weight+ model_year, data=auto)
summary(mod_auto)

#Retirando model_year (p-valor alto: 0,465)
mod_auto <- lm(mpg ~ horsepower + weight, data=auto)
summary(mod_auto)
