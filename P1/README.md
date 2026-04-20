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

## 📈 Exercício 2: Valor Imobiliário - Dataset *Boston*

Neste exercício, o objetivo foi prever o valor mediano das casas (`medv`) em Boston. O modelo passou por um processo de simplificação para manter apenas variáveis com real significância estatística.

### Refinamento do Modelo (Backward Elimination)
As variáveis foram removidas seguindo o critério de maior p-valor ($p > 0,05$):
1.  **Remoção de `age`:** Apresentou p-valor de **0.987**, indicando que a idade da construção não influenciava o preço significativamente neste contexto.
2.  **Remoção de `crim`:** Apresentou p-valor de **0.541**. Embora seja um fator social comum, não apresentou força estatística comparado aos outros preditores.

### Modelo Final
O modelo final foi consolidado com 4 preditores altamente significativos:
```R
mod2 <- lm(medv ~ nox + rm + tax + lstat, data=boston)
```
* **Variáveis Significativas:** Poluição (`nox`), Número de Quartos (`rm`), Imposto (`tax`) e Status Socioeconômico (`lstat`).
* **R² Ajustado:** 0.653

### Validação por Cálculo Manual
Para validar a equação matemática gerada pelo R, foi implementada uma função manual para replicar a predição:
* **Equação:** $y = \beta_0 + (\beta_1 \cdot nox) + (\beta_2 \cdot rm) + (\beta_3 \cdot tax) + (\beta_4 \cdot lstat)$
* **Resultado Predict (R):** $38.08821$
* **Resultado Manual:** $38.08821$

---

## 📈 Exercício 3: Classificação de Doença Cardíaca - Dataset *Heart*

Neste exercício, o objetivo foi classificar a presença de doença cardíaca (`target`) com base em indicadores clínicos, utilizando um modelo de **Regressão Logística Binomial**.

### Metodologia de Treinamento
Para garantir a validade do modelo, os dados foram divididos em duas frentes:
* **Treino (70%):** Utilizado para ajustar os coeficientes do modelo.
* **Teste (30%):** Utilizado para verificar o poder de predição em dados que o modelo nunca viu.

### Variáveis Significativas
Dentre os indicadores, os que mais influenciaram a probabilidade de doença cardíaca (p-valor < 0,05) foram:
* **Idade (`age`)** e **Colesterol (`chol`)**.
* **Angina induzida por exercício (`exang`)**.
* **Frequência cardíaca máxima (`thalach`)**.
* **Número de vasos principais coloridos por fluoroscopia (`ca`)**.

### Performance e Matriz de Confusão
Utilizando a curva **ROC** para definir o melhor ponto de corte (threshold), o modelo apresentou os seguintes resultados na base de teste:

| Métrica | Resultado |
| :--- | :--- |
| **Acurácia (Accuracy)** | 70,33% |
| **Sensibilidade (Recall)** | **90,62%** |
| **Especificidade** | 59,32% |
| **Precisão (Pos Pred Value)** | 54,72% |

**Análise Clínica:** O modelo priorizou a **Sensibilidade (90,62%)**, o que é vital em diagnósticos médicos. Isso significa que o modelo é excelente em identificar quem realmente tem a doença, minimizando os "Falsos Negativos" (deixar uma pessoa doente sem diagnóstico).

---

## 🛠️ Tecnologias e Ferramentas Consolidadas

Para a realização desta prova, utilizou-se o ambiente estatístico **R**, explorando desde regressões lineares clássicas até modelos de classificação probabilística.

* **Linguagem principal:** R (v4.x)
* **Modelagem Estatística:**
    * `lm()`: Regressão Linear Múltipla (Exercícios 1 e 2).
    * `glm(family=binomial)`: Regressão Logística para classificação (Exercício 3).
* **Bibliotecas (Packages):**
    * `caret`: Utilizada para partição de dados (`createDataPartition` / `sample`) e geração da Matriz de Confusão detalhada.
    * `pROC`: Essencial para a criação da curva ROC e cálculo do melhor limiar (*threshold*) de decisão via coordenadas.
* **Manipulação e Validação:**
    * `predict()`: Geração de predições para dados de teste.
    * Funções Customizadas: Criação de funções matemáticas manuais para validação dos coeficientes dos modelos.
* **Datasets Processados:**
    * `autos.csv`: Análise de eficiência de combustível.
    * `boston_housing.csv`: Precificação imobiliária.
    * `heart_disease_uci.csv`: Diagnóstico de saúde cardiovascular.
---
