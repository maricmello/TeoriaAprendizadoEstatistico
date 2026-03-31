# 📊 Tarefa 001 — Regressão Linear Multivariada (Carseats)

## 📚 Descrição

Nesta atividade, foi desenvolvido um modelo de **Regressão Linear Multivariada** utilizando o conjunto de dados `Carseats`, disponível no pacote `ISLR` no R.

O objetivo principal foi **prever a variável `Sales`** a partir de todas as variáveis numéricas do conjunto de dados, além de **avaliar a significância estatística** de cada variável explicativa por meio da análise dos **valores-p (p-values)**.

---

## 🎯 Objetivos

* Ajustar um modelo de regressão linear múltipla
* Identificar quais variáveis numéricas influenciam `Sales`
* Interpretar a relevância estatística das variáveis
* Compreender o papel dos p-values na seleção de variáveis

---

## 🧠 Conceitos Aplicados

### 📈 Regressão Linear Multivariada

A regressão linear multivariada permite modelar a relação entre uma variável dependente (`Sales`) e múltiplas variáveis independentes.

Esse tipo de modelo possibilita:

* Avaliar o impacto individual de cada variável explicativa
* Controlar o efeito das demais variáveis no modelo

---

### 🔍 Valor-p (p-value)

O valor-p é utilizado para testar a hipótese nula de que o coeficiente de uma variável é igual a zero (ou seja, sem efeito sobre a variável resposta).

* **p-value < 0.05**: forte evidência de que a variável é relevante
* **p-value ≥ 0.05**: pouca evidência de que a variável contribui significativamente

---

### ⚖️ Interpretação Estatística

A análise conjunta dos coeficientes e dos p-values permite identificar:

* Quais variáveis têm influência significativa nas vendas
* A direção do impacto (positivo ou negativo)
* Possíveis variáveis irrelevantes para o modelo

---

## 📊 Dataset

* **Nome:** `Carseats`
* **Origem:** pacote `ISLR`
* **Descrição:** conjunto de dados que contém informações sobre vendas de cadeiras de carro em diferentes localidades

### 🔢 Variáveis Numéricas Consideradas

* Preço da concorrência (`CompPrice`)
* Renda (`Income`)
* Investimento em publicidade (`Advertising`)
* População (`Population`)
* Preço do produto (`Price`)
* Idade média (`Age`)
* Nível de educação (`Education`)

---

## 🛠️ Metodologia

* Seleção das variáveis numéricas do dataset
* Ajuste de um modelo de regressão linear múltipla
* Análise dos coeficientes estimados
* Avaliação da significância estatística via p-values

---

## 📌 Resultados e Análise

A partir da análise dos valores-p:

* Variáveis com valores-p baixos foram consideradas estatisticamente significativas
* Variáveis com valores-p elevados indicam baixa evidência de influência sobre `Sales`
* A interpretação dos resultados deve considerar tanto a significância estatística quanto o contexto do problema

---

## ⚠️ Observações

* O modelo assume relação linear entre as variáveis
* Não foram consideradas variáveis categóricas nesta análise
* Resultados podem ser aprimorados com:

  * Inclusão de novas variáveis
  * Transformações nos dados
  * Técnicas de regularização
