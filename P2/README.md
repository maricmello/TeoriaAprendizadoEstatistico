# Lista de Exercícios de Aprendizado de Máquina em R

## Objetivo

Esta atividade teve como objetivo aplicar técnicas de Aprendizado de Máquina utilizando a linguagem R, contemplando:

- Árvore de Regressão
- Árvore de Classificação
- Regressão Logística Multiclasse

Em todos os exercícios foi realizada a divisão dos dados em:

- 70% para treinamento
- 30% para teste

Os modelos foram treinados utilizando os dados de treinamento e avaliados utilizando os dados de teste.

---

# Bibliotecas Utilizadas

```r
library(rpart)
library(rpart.plot)
library(caret)
library(ggplot2)
library(mlbench)
library(palmerpenguins)
library(nnet)
```

---

# Exercício 1 – Árvore de Regressão com a Base Diamonds

## Objetivo

Construir uma árvore de regressão para prever a variável `price` utilizando todas as demais variáveis da base como preditoras.

## Base de Dados

A base `diamonds`, disponível no pacote `ggplot2`, contém informações sobre mais de 53 mil diamantes comercializados.

### Variável Resposta

```r
price
```

### Variáveis Explicativas

```r
carat
cut
color
clarity
depth
table
x
y
z
```

## Divisão dos Dados

Foi utilizada a função:

```r
createDataPartition()
```

para separar os dados em:

- Treinamento: 70%
- Teste: 30%

## Modelo Utilizado

Foi construída uma árvore de regressão utilizando:

```r
rpart()
```

com:

```r
method = "anova"
```

## Resultado do Modelo

O modelo identificou principalmente as variáveis:

- carat
- y
- clarity
- color

como fatores importantes para a previsão do preço dos diamantes.

## Avaliação

Resultados obtidos:

```text
RMSE = 944.1921
MAE = 572.8055
```

### Interpretação

O RMSE (Root Mean Squared Error) mede o erro quadrático médio das previsões.

O MAE (Mean Absolute Error) mede o erro absoluto médio das previsões.

O modelo apresentou um erro médio aproximado de 573 dólares por diamante. Considerando a ampla faixa de preços existente na base Diamonds, o desempenho pode ser considerado satisfatório.

---

# Exercício 2 – Árvore de Classificação com a Base Sonar

## Objetivo

Construir uma árvore de classificação para prever a variável `Class`, distinguindo:

- R = Rock (Rocha)
- M = Mine (Mina)

utilizando todas as demais variáveis da base como preditoras.

## Base de Dados

Foi utilizada a base `Sonar`, disponível no pacote `mlbench`.

### Variável Resposta

```r
Class
```

### Variáveis Explicativas

```r
V1 até V60
```

## Divisão dos Dados

Os dados foram divididos em:

- Treinamento: 70%
- Teste: 30%

## Modelo Utilizado

Foi construída uma árvore de classificação utilizando:

```r
rpart()
```

com:

```r
method = "class"
```

e critério de divisão:

```r
split = "gini"
```

## Matriz de Confusão

```text
          Reference
Prediction  M  R
         M 19  3
         R 14 26
```

## Avaliação

Resultados obtidos:

```text
Accuracy = 0.7258
Kappa = 0.4617 (concordância moderada entre as previsões e os valores reais)
Sensitivity = 0.5758 (modelo teve maior dificuldade em identificar corretamente todos os exemplos da classe positiva)
Specificity = 0.8966 (boa capacidade de identificar corretamente a classe negativa)
Balanced Accuracy = 0.7362
```

### Interpretação

- O modelo classificou corretamente 45 das 62 observações do conjunto de teste.

## Conclusão

A árvore de classificação apresentou desempenho satisfatório para o problema de identificação de minas e rochas, obtendo uma acurácia de 72,58% no conjunto de teste. O modelo conseguiu capturar padrões relevantes da base Sonar e produzir classificações úteis para o problema proposto.

# Exercício 3 – Regressão Logística Multiclasse com a Base Penguins

## Objetivo

Construir um modelo de regressão logística multinomial para prever a variável `species`.

## Base de Dados

Foi utilizada a base:

```r
penguins
```

do pacote:

```r
palmerpenguins
```

Antes da modelagem foram removidos os valores ausentes utilizando:

```r
na.omit()
```

## Variável Resposta

```r
species
```

### Classes

- Adelie
- Chinstrap
- Gentoo

## Variáveis Explicativas

```r
bill_length_mm
bill_depth_mm
flipper_length_mm
body_mass_g
```

## Modelo Utilizado

Foi utilizada regressão logística multinomial através da função:

```r
multinom()
```

do pacote:

```r
nnet
```

## Resultado do Modelo

O modelo convergiu corretamente após 100 iterações.

Principais métricas:

```text
Residual Deviance = 0.003716051
AIC = 20.00372
```

## Matriz de Confusão

```text
           Reference
Prediction  Adelie Chinstrap Gentoo
Adelie         42         0       0
Chinstrap       1        20       0
Gentoo          0         0      35
```

## Avaliação

Resultados obtidos:

```text
Accuracy = 0.9898
```

ou

```text
98,98%
```

### Interpretação

O modelo apresentou desempenho excelente, classificando corretamente praticamente todos os pinguins do conjunto de teste.

Houve apenas uma classificação incorreta entre as 98 observações avaliadas.

---

# Conclusão Geral

Os três modelos foram construídos e avaliados com sucesso utilizando a linguagem R.

Principais resultados:

| Exercício | Modelo | Resultado |
|------------|---------|------------|
| Diamonds | Árvore de Regressão | RMSE = 944.19 / MAE = 572.81 |
| Sonar | Árvore de Classificação | Matriz de Confusão e Acurácia |
| Penguins | Regressão Logística Multinomial | Accuracy = 98.98% |

Os resultados demonstram que os algoritmos utilizados foram capazes de aprender padrões relevantes dos dados e produzir previsões consistentes nos conjuntos de teste.
