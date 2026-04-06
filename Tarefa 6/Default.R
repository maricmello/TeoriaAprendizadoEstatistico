#regressão Logistica
library(caret)
library(pROC)

ISLR::Default
dados2<-ISLR::Default
names(dados2)

set.seed(123)
particao <- sample(seq_len(nrow(dados2)), size = 0.7*nrow(dados2))
dados2treino <- dados2[particao, ]
dados2teste  <- dados2[-particao, ]

prop.table(table(dados2treino$student)); 
prop.table(table(dados2teste$student))

modelologistio01<-glm(student~.-default,
                      data = dados2treino, 
                      family = binomial)

summary(modelologistio01)

prob_modelologistico01<-predict(modelologistio01,
                                newdata = dados2teste, 
                                type = "response")

roc_obj <- roc(response = dados2teste$student , 
               predictor = prob_modelologistico01, 
               levels = c("No","Yes"), 
               direction = "<")

melhor_coordenada<- coords(roc_obj, "best", ret = c("threshold","sensitivity","specificity"))

roc_obj$sensitivities+roc_obj$specificities
which.max(roc_obj$sensitivities+roc_obj$specificities)

melhor_coordenada1<-roc_obj$thresholds[which.max(roc_obj$sensitivities+roc_obj$specificities)]

thr <- melhor_coordenada["threshold"]

pred_class <- ifelse(prob_modelologistico01 > as.numeric(thr), "Yes", "No")

tabela_predicao <- table(Predito = pred_class, Real = dados2teste$student)
tabela_predicao

accuracy <- mean(pred_class == dados2teste$student)
sensitivity <- mean(pred_class[dados2teste$student=="No"] == "No")
specificity <- mean(pred_class[dados2teste$student=="Yes"]  == "Yes")

c(accuracy = accuracy, sensitivity = sensitivity, specificity = specificity)

accuracy1 <-(tabela_predicao[1,1]+tabela_predicao[2,2])/(sum(tabela_predicao)) 
sensitivity1 <-(tabela_predicao[1,1]/sum(tabela_predicao[,1]))
specificity1 <- (tabela_predicao[2,2]/sum(tabela_predicao[,2]))

c(accuracy1 = accuracy1, sensitivity1 = sensitivity1, specificity1 = specificity1)

thr <- melhor_coordenada1

pred_class <- ifelse(prob_modelologistico01 > as.numeric(thr), "Yes", "No")

tabela_predicao <- table(Predito = pred_class, Real = dados2teste$student)
tabela_predicao

accuracy <- mean(pred_class == dados2teste$student)
sensitivity <- mean(pred_class[dados2teste$student=="No"] == "No")
specificity <- mean(pred_class[dados2teste$student=="Yes"]  == "Yes")

c(accuracy = accuracy, sensitivity = sensitivity, specificity = specificity)

accuracy1 <-(tabela_predicao[1,1]+tabela_predicao[2,2])/(sum(tabela_predicao)) 
sensitivity1 <-(tabela_predicao[1,1]/sum(tabela_predicao[,1]))
specificity1 <- (tabela_predicao[2,2]/sum(tabela_predicao[,2]))

c(accuracy1 = accuracy1, sensitivity1 = sensitivity1, specificity1 = specificity1)

resumo<-confusionMatrix(as.factor(pred_class), dados2teste$student)

resumo
resumo$table
resumo$overall
resumo$byClass
