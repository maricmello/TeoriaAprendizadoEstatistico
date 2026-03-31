# 📊 Tarefa 005 — Regressão Logística com Treino/Teste

## 📚 Descrição

Nesta atividade, foram construídos modelos de **Regressão Logística** utilizando diferentes bases de dados dos pacotes `ISLR` e `ISLR2`, com a aplicação de **particionamento em conjuntos de treino e teste**.

O objetivo foi avaliar a capacidade de generalização dos modelos em problemas de **classificação binária**, utilizando dados não vistos durante o treinamento.

---

## 🎯 Objetivos

- Construir modelos de regressão logística para classificação  
- Aplicar divisão dos dados em treino e teste  
- Avaliar o desempenho dos modelos em dados novos  
- Comparar resultados entre diferentes datasets  

---

## 🧠 Conceitos Aplicados

### 🔢 Regressão Logística

A regressão logística é utilizada para modelar a probabilidade de ocorrência de um evento binário.

O modelo estima valores entre 0 e 1, representando probabilidades, que são convertidas em classes a partir de um limiar.

---

### 🔀 Divisão Treino/Teste

Os dados foram divididos em dois subconjuntos:

- **Treino:** utilizado para ajustar o modelo  
- **Teste:** utilizado para avaliar o desempenho  

Essa abordagem permite verificar a capacidade do modelo de generalizar para novos dados.

---

### 📊 Avaliação de Modelos

O desempenho dos modelos pode ser analisado por meio de métricas como:

- Acurácia  
- Matriz de confusão  
- Taxa de erro  

Essa avaliação é feita com base no conjunto de teste.

---

### ⚖️ Overfitting e Generalização

- **Overfitting:** modelo se ajusta muito bem aos dados de treino, mas falha em dados novos  
- **Generalização:** capacidade do modelo de manter bom desempenho em dados não vistos  

O uso de treino/teste ajuda a identificar esses comportamentos.

---

## 📊 Datasets Utilizados

### a) `Default` (pacote `ISLR`)
- **Variável dependente:** `student`  
- **Objetivo:** classificar indivíduos como estudantes ou não  

---

### b) `Smarket` (pacote `ISLR2`)
- **Variável dependente:** `Direction`  
- **Objetivo:** prever a direção do mercado financeiro (alta ou baixa)  

---

### c) `Weekly` (pacote `ISLR2`)
- **Variável dependente:** `Direction`  
- **Objetivo:** prever a direção semanal do mercado  

---

### d) `Caravan` (pacote `ISLR2`)
- **Variável dependente:** `Purchase`  
- **Objetivo:** prever a compra de seguro de caravana  

---

## 🛠️ Metodologia

- Divisão dos dados em conjuntos de treino e teste  
- Ajuste dos modelos de regressão logística no conjunto de treino  
- Geração de previsões para o conjunto de teste  
- Comparação entre valores reais e preditos  
- Avaliação do desempenho dos modelos  

---

## 📌 Resultados e Análise

- Os modelos foram avaliados com base em sua performance no conjunto de teste  
- Foi possível observar diferenças entre desempenho em treino e teste  
- A abordagem permitiu uma análise mais realista da capacidade preditiva  

---

## ⚠️ Observações

- A escolha da proporção treino/teste pode impactar os resultados  
- Alguns datasets podem apresentar desbalanceamento de classes  
- Possíveis melhorias incluem:
  - Validação cruzada  
  - Ajuste de limiar de decisão  
  - Balanceamento de dados  
  - Seleção de variáveis  
