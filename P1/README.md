# Resolução: Prova de Modelagem Estatística

Este repositório contém a resolução detalhada das questões da prova de Teoria do Aprendizado Estatístico. 

## 📈 Exercício 1: Predição de Consumo (MPG) - Dataset *Auto*

O objetivo deste primeiro exercício foi desenvolver um modelo de regressão linear múltipla para prever a eficiência de combustível (`mpg`) de veículos, utilizando a técnica de **Backward Elimination** para simplificação do modelo.

### Metodologia de Seleção
Partindo de um modelo completo, foram removidas sucessivamente as variáveis que não apresentaram significância estatística (p-valor > 0,05). O processo seguiu a ordem de remoção:

Observação: `displacement` foi excluído previamente por redundância (alta correlação com outras variáveis) e `name` por ser um identificador textual.

1. `cylinders`
2. `origin`
3. `acceleration`
4. `model_year`

### Modelo Final
A configuração que apresentou o melhor equilíbrio entre simplicidade e poder explicativo foi:
```R
mod_auto <- lm(mpg ~ horsepower + weight, data=auto)
```

**Principais Métricas do Exercício 1:**
* **R² Ajustado:** 0.9071 (O modelo explica 90,7% da variabilidade dos dados).
* **Variáveis Significativas:** `horsepower` (Potência) e `weight` (Peso).
* **Análise:** Ambos os coeficientes são negativos, indicando que quanto maior o peso ou a potência do veículo, menor é a sua eficiência de combustível (mpg).

---

## 🕒 Exercício 2: 


---

## 🕒 Exercício 3: 


---

## 🛠️ Tecnologias e Ferramentas
* **Linguagem:** R
* **Principais Funções:** `lm()`, `summary()`, `as.factor()`
* **Dataset:** `autos.csv`

---
