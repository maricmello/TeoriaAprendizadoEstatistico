# 📊 Tarefa 002 — Regressão Linear Multivariada e Predição

## 📚 Descrição

Nesta atividade, foram construídos modelos de **Regressão Linear Multivariada** utilizando bases de dados do pacote `ISLR`, com o objetivo de **realizar predições** a partir dos modelos ajustados.

Além da modelagem, foram exploradas **duas formas de predição**, permitindo compreender como utilizar modelos lineares tanto para previsão individual quanto para análise geral dos dados.

---

## 🎯 Objetivos

- Construir modelos de regressão linear múltipla  
- Aplicar os modelos em diferentes datasets  
- Realizar predições a partir dos modelos ajustados  
- Comparar formas de obtenção de previsões  

---

## 🧠 Conceitos Aplicados

### 📈 Regressão Linear Multivariada

A regressão linear multivariada modela a relação entre uma variável resposta e múltiplas variáveis explicativas.

Esse tipo de abordagem permite:
- Capturar efeitos simultâneos de diferentes variáveis  
- Estimar o impacto individual de cada preditor  
- Gerar previsões baseadas nos dados de entrada  

---

### 🔮 Predição em Modelos Lineares

A predição consiste em utilizar o modelo ajustado para estimar valores da variável resposta.

Foram exploradas duas abordagens:

- **Predição direta:** estimativa dos valores para observações específicas  
- **Predição geral:** aplicação do modelo sobre um conjunto de dados completo  

---

### ⚖️ Interpretação dos Resultados

- Os valores preditos representam estimativas baseadas na relação linear aprendida  
- Diferenças entre valores reais e preditos indicam erro do modelo  
- A qualidade da predição depende da adequação do modelo aos dados  

---

## 📊 Datasets Utilizados

### a) `Carseats` (pacote `ISLR`)
- **Variável dependente:** `Sales`  
- **Descrição:** dados de vendas de cadeiras de carro em diferentes localidades  
- **Objetivo:** prever o volume de vendas com base em variáveis relacionadas a preço, marketing e características demográficas  

---

### b) `Credit` (pacote `ISLR`)
- **Variável dependente:** `Balance`  
- **Descrição:** informações sobre clientes e seus saldos de cartão de crédito  
- **Objetivo:** prever o saldo do cartão com base em características financeiras e demográficas  

---

## 🛠️ Metodologia

- Ajuste de modelos de regressão linear múltipla para cada dataset  
- Utilização das variáveis explicativas disponíveis  
- Geração de predições com base nos modelos ajustados  
- Comparação entre diferentes formas de predição  

---

## 📌 Resultados e Análise

- Os modelos permitiram estimar valores de `Sales` e `Balance`  
- As predições refletem o comportamento médio capturado pelo modelo  
- Diferenças entre valores reais e previstos indicam limitações do ajuste  

---

## ⚠️ Observações

- O modelo assume relação linear entre variáveis  
- Pode haver influência de variáveis irrelevantes ou correlacionadas  
- Possíveis melhorias incluem:
  - Avaliação com métricas (RMSE, R²)  
  - Análise de resíduos  
  - Seleção de variáveis  
  - Validação com dados separados  
