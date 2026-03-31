# 📊 Tarefa 003 — Regressão Linear Multivariada (Hitters)

## 📚 Descrição

Nesta atividade, foi desenvolvido um modelo de **Regressão Linear Multivariada** utilizando o conjunto de dados `Hitters`, disponível no pacote `ISLR`.

O objetivo principal foi **modelar e analisar os fatores que influenciam o salário (`Salary`) de jogadores de beisebol**, considerando múltiplas variáveis explicativas relacionadas ao desempenho e características dos atletas.

---

## 🎯 Objetivos

- Construir um modelo de regressão linear múltipla  
- Identificar variáveis que impactam o salário dos jogadores  
- Interpretar os coeficientes do modelo  
- Compreender relações entre desempenho esportivo e remuneração  

---

## 🧠 Conceitos Aplicados

### 📈 Regressão Linear Multivariada

A regressão linear multivariada permite analisar a relação entre uma variável dependente (`Salary`) e diversas variáveis independentes.

Essa abordagem possibilita:
- Avaliar o impacto conjunto de múltiplos fatores  
- Isolar o efeito individual de cada variável  
- Explicar variações na variável resposta  

---

### ⚾ Modelagem com Dados Reais

O dataset `Hitters` contém informações reais de jogadores de beisebol, incluindo:
- Estatísticas de desempenho  
- Tempo de carreira  
- Indicadores históricos  

A modelagem permite entender como esses fatores se relacionam com o salário.

---

### 🔍 Interpretação dos Coeficientes

- Coeficientes positivos indicam aumento esperado no salário  
- Coeficientes negativos indicam redução esperada  
- A magnitude do coeficiente reflete a intensidade do impacto  

---

## 📊 Dataset

- **Nome:** `Hitters`  
- **Origem:** pacote `ISLR`  
- **Descrição:** dados de jogadores da Major League Baseball com estatísticas de desempenho e salários  

### 🎯 Variável Dependente

- `Salary` — salário dos jogadores  

---

## 🛠️ Metodologia

- Seleção da variável resposta (`Salary`)  
- Utilização das variáveis explicativas disponíveis no dataset  
- Ajuste de um modelo de regressão linear múltipla  
- Análise dos coeficientes estimados  

---

## 📌 Resultados e Análise

- O modelo permite identificar quais características dos jogadores estão associadas ao salário  
- Variáveis relacionadas ao desempenho tendem a ter maior influência  
- A análise evidencia como fatores históricos e atuais impactam a remuneração  

---

## ⚠️ Observações

- O dataset possui valores ausentes na variável `Salary`, que devem ser tratados  
- O modelo assume relação linear entre as variáveis  
- Possíveis melhorias incluem:
  - Tratamento mais robusto de dados faltantes  
  - Seleção de variáveis relevantes  
  - Avaliação com métricas de desempenho  
  - Verificação de multicolinearidade  
