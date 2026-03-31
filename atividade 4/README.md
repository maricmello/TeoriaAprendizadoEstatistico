# 📊 Tarefa 004 — Regressão Logística

## 📚 Descrição

Nesta atividade, foram desenvolvidos modelos de **Regressão Logística** utilizando diferentes conjuntos de dados dos pacotes `ISLR` e `ISLR2`.

O objetivo foi aplicar a regressão logística em problemas de **classificação binária**, definindo diferentes variáveis dependentes em cada dataset. Importante destacar que os modelos foram ajustados **sem particionamento em conjuntos de treino e teste**, com foco na compreensão da modelagem e interpretação dos resultados.

---

## 🎯 Objetivos

- Construir modelos de regressão logística para classificação  
- Aplicar o modelo em diferentes contextos e datasets  
- Interpretar probabilidades e decisões de classificação  
- Compreender o comportamento do modelo sem validação externa  

---

## 🧠 Conceitos Aplicados

### 🔢 Regressão Logística

A regressão logística é utilizada quando a variável resposta é **categórica**, geralmente binária.

Ela modela a probabilidade de ocorrência de um evento, transformando a saída por meio da função logística, garantindo valores entre 0 e 1.

---

### 📊 Classificação Binária

Cada modelo construído busca prever uma variável com dois possíveis resultados, como:
- Sim / Não  
- Up / Down  
- Compra / Não compra  

A decisão final geralmente é baseada em um **limiar (threshold)**, como 0.5.

---

### 🔍 Interpretação dos Coeficientes

- Os coeficientes indicam o efeito das variáveis explicativas na **log-odds**  
- Sinais positivos aumentam a probabilidade do evento  
- Sinais negativos reduzem a probabilidade  

---

### ⚠️ Limitações da Abordagem

- Não há separação entre treino e teste  
- Pode haver **overfitting**  
- A avaliação do modelo fica limitada ao próprio conjunto de dados  

---

## 📊 Datasets Utilizados

### a) `Default` (pacote `ISLR`)
- **Variável dependente:** `student`  
- **Objetivo:** prever se um indivíduo é estudante com base em variáveis financeiras  

---

### b) `Smarket` (pacote `ISLR2`)
- **Variável dependente:** `Direction`  
- **Objetivo:** prever a direção do mercado (alta ou baixa) com base em dados históricos  

---

### c) `Weekly` (pacote `ISLR2`)
- **Variável dependente:** `Direction`  
- **Objetivo:** prever a direção semanal do mercado financeiro  

---

### d) `Caravan` (pacote `ISLR2`)
- **Variável dependente:** `Purchase`  
- **Objetivo:** prever se um cliente irá adquirir um seguro de caravana  

---

## 🛠️ Metodologia

- Ajuste de modelos de regressão logística para cada dataset  
- Utilização de todas as variáveis disponíveis como preditoras  
- Estimativa das probabilidades de cada classe  
- Interpretação dos coeficientes e comportamento do modelo  

---

## 📌 Resultados e Análise

- Os modelos produziram probabilidades associadas a cada classe  
- A interpretação dos resultados permitiu identificar variáveis com maior influência  
- A ausência de validação externa limita conclusões sobre generalização  

---

## ⚠️ Observações

- A regressão logística assume relação linear entre variáveis explicativas e log-odds  
- Pode apresentar dificuldades com dados desbalanceados  
- Melhorias possíveis incluem:
  - Separação em treino e teste  
  - Validação cruzada  
  - Ajuste de limiar de classificação  
  - Balanceamento de classes  
