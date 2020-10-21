
# Aula 02 - Explorando dados
# Introdução ao R - MQuinho 2020
#
# ---
#
# Professores:
# Eduardo Ryô Tamaki
# e-mail: eduardo.rtamaki@gmail.com
# Virgílio Mendes
# e-mail: virgilioebm@gmail.com
#
# Monitores:
# Laura Beghini
# e-mail: laurabeghinic@gmail.com 
# Rômulo Damasceno
# e-mail: romulo.damasceno@hotmail.com 
# ---



# objeto
x = 5
x
# vetor
vetor = c(5, 5, 6, 2, 6)
vetor
# matriz
matr = matrix(data = 1:16, nrow = 4, ncol = 4)
matr

# Identificando posição dos elementos
# nomedamatrix[linhas,colunas]
matr[4,2]
matr[,3]
matr[2,]

# limpar enviroment
rm(list = ls())

# ----

# Data frames 

?data.frame


# vetores
nome = c("Virgilio", "Eduardo", "Caio", "Raquel")
idade = c(18, 30, 23, 19)
altura = c(1.71, 1.90, 1.80, 1.60)


# data frame

df <- data.frame(nome, idade, altura)




# Ver o banco de dados
View(df)


# Aula 02 - Explorando dados
# Introdução ao R - MQuinho 2020
# (Continuação)
# ---


# limpar enviroment
rm(list = ls())

# ---

# install.packages("questionr")

library(questionr) # Para processamento de surveys
library(readxl) # Lê arquivos em excel
library(foreign) # Lê arquivos do Stata e SPSS
library(readr) # Lê arquivos .txt / .csv
library(writexl) # Salvar em .xslx

# Banco de dados nativo do R

bd <- iris

# Mostra o diretorio que esta salvo
getwd()

# Salvando novo diretorio
setwd("C:/Users/Virgilio/Desktop/Mquinho_2020_Introd_R/Aulas/Aula_02")


# Lê o banco de extensão csv separado por ","
bd = read.csv("dados_eleicao.csv")
# Lê o banco de extensão csv separado por ";"
bd = read.csv2("dados_eleicao.csv")
# Lê arquivo em excel (xlsx)
bd1 = read_excel("banco_excel.xlsx")
# Lê arquivo em excel (xlsx) com abas do excel diferentes
bd1 = read_excel("banco_excel.xlsx", sheet = 2)
# Lê em RDS
ob2 = readRDS("teste.rds")
ob3 = read_rds("teste1.rds")


# salvar em excel
write_xlsx(bd, "banco_excel.xlsx")
# Salva em RDS
write_rds(bd1, "teste.rds")
saveRDS(bd1, "teste1.rds")
# Salvar em csv separado por ","
write.csv(bd, "teste.csv")

# Salvar em csv separado por ";"
write.csv2(bd, "teste1.csv")
# Mesma funcionalidade  do write.csv2, mas com maior eficiencia
write_csv2(bd, "teste1.csv")




# Limpar enviroment
rm(list = ls())

# Estatísticas descritivas

# Nomes das variaveis
names(bd)

# Dimensões 
dim(bd)

# mostra os 6 primeiros casos
head(bd)

# mostra os 6 ultimos casos
tail(bd)

# classe da variavel
class(bd$NOME_MUNICIPIO)



# classe da variavel
class(bd$ANO_ELEICAO)


# classe do banco de dados
class(bd)

# Mostra os casos (das linhas) nas posições 1 a 10
bd[1:10,]
bd[10:20,]

# tail e head para mais de 6 casos
head(bd, 10)
tail(bd, 10)

# estrutura do bd
str(bd)

# resumo
summary(bd$TOTAL_VOTOS)

# mudando a classe para caracter
bd$NOME_MUNICIPIO = as.character(bd$NOME_MUNICIPIO)

# mudando a classe para factor
as.factor()

# mudando a classe para numerica
as.numeric()

# mudando a classe para inteiros
as.integer()

# mudando a classe para data frame
as.data.frame()





