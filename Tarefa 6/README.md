# Tarefa 006 — Regressão Logística com Ajuste de Threshold

## Objetivo

Aplicar modelos de regressão logística e melhorar a classificação utilizando o melhor ponto de corte (threshold) obtido pela curva ROC.

---

## Metodologia

Para cada conjunto de dados foi realizado:

- Separação em treino (70%) e teste (30%)
- Ajuste do modelo com `glm` (família binomial)
- Geração das probabilidades de predição
- Construção da curva ROC (`pROC`)
- Seleção do melhor threshold (método de Youden)
- Classificação com base no threshold ótimo
- Avaliação com:
  - Matriz de confusão
  - Acurácia
  - Sensibilidade
  - Especificidade
  - Função `confusionMatrix` (pacote `caret`)

---

## Bases utilizadas

- Smarket  
- Weekly  
- Caravan  
- Default  

---

## Resultados

### Smarket
- Acurácia ~56%
- Pouco melhor que o acaso
- Baixa capacidade preditiva

---

### Weekly
- Acurácia próxima da classe majoritária
- Baixa sensibilidade
- Modelo fraco

---

### Caravan
- Base desbalanceada
- Acurácia inferior ao baseline
- Alta precisão para classe positiva
- Baixa capacidade de prever corretamente a classe negativa

---

### Default
- Acurácia ~94%
- Alta sensibilidade e especificidade
- Modelo com bom desempenho

---

## Conclusão

A escolha do threshold via curva ROC permite melhorar a classificação em relação ao uso fixo de 0.5.

O desempenho dos modelos depende das características dos dados:
- Bases mais estruturadas apresentam melhores resultados (Default)
- Bases com comportamento mais aleatório ou desbalanceado apresentam desempenho limitado (Smarket, Weekly e Caravan)
