# ---
#
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
# 21/10/2020
# ---
#
# Material de Apoio:
# Link das aulas: https://github.com/virgiliomendes/Mquinho_2020_Introd_R


## PREAMBULO -----------------------------------------------------------

# Limpando nosso ambiente:
rm(list = ls())


# Data Frames (Continuação) --------------------------------------------

# Data frames

nome = c("Virgilio", "Eduardo", "Laura", "Romulo")
idade = c(18, 24, 20, 21)
altura = c(1.71, 1.76, 1.60, 1.75)

banco = data.frame(nome, idade, altura)

# Entendendo a função data.frame
?data.frame

class(banco$nome) # Tira classe da variavel

View(banco) # Visualiza df
banco

names(banco)

names(banco) <- c("Alunos", "Idade", "Altura")

names(banco)

# Indexing:
banco[1] # Forma correta
banco(1) # Forma errada

banco[1,1]

# Extraindo TODAS as linhas (ou observações) de uma determinada coluna:
banco[, 1]
banco[, "Alunos"]

# Extraindo um número X de linhas e TODAS as colunas:
banco[c(1, 2, 3), ]
banco[1:2, ]
banco[c(1,4), ]

# Extraindo um número X de linhas de UMA coluna específica:
banco[c(1:3), "Idade"]


# Quando queremos extrair informações de uma coluna (ou variável) específica:

seq(from = 1, to = 5, by = 2)
seq(1, 5, 2)

seq(to = 5,  by = 2, from = 0)
seq(5, 2, 0) # Desse jeito os parâmetros da função estão errados
seq(0, 2, 5) # jeito correto omitindo os parametros

# Entendendo a função seq
?seq

seq(5, length.out = 10)


banco$Alunos

banco$Idade[seq(from = 1, to = 4, by = 2)]
banco$Idade[1:3]


# Importando Bancos ----------------------------------------------------

# link: https://CRAN.R-project.org/package=dplyr
# link: https://CRAN.R-project.org/package=questionr 

# Apresentar como instalar pacotes

#install.packages("dplyr")
#install.packages("questionr")
#install.packages("ggplot2")


# Apresentar como carregar pacotes

# carregando os pacotes
library(readxl) #  Read Excel Files
library(questionr) # Functions to Make Surveys Processing Easier
library(dplyr) # A Grammar of Data Manipulation
library(foreign) # Leitura de arquivos (ex: SPSS, dta - Stata)
library(writexl) # Exporta em Excel
library(readr) # Write Data frame in different formats

# Explicar as várias formas de importar e exportar dados

# carregar banco de bados iris (inato do r)
bd = iris

# ver o diretorio de trabalho
getwd()
# setar diretório de trabalho
setwd("C:/Users/Virgilio/Desktop/")


# carrega banco em formato CSV com separador ";"
bd = read.csv2("dados_eleicao.csv")
# carrega banco em formato CSV com separador ","
bd = read.csv("dados_eleicao.csv")

# salva em formato CSV com separador ";"
write_csv2(bd, "teste.csv")
# salva em formato CSV com separador ","
write_csv(bd, "teste.csv")


# carrega banco em formato excel
bd = read_excel("banco.xlsx")
# quando há mais de uma sheet ou aba no arquivo excel, 
# usar o comando ", sheet = <nome.da.aba>"
write_xlsx(bd , "teste.xlsx")

# carrega banco em formato RDS
bd = readRDS("teste.RDS")
# Salva em formato RDS
write_rds(bd, "teste.RDS") # da funçao readr - mais eficiente
saveRDS(bd, "teste.RDS") # R Base

# Estatísticas Descritivas ---------------------------------------------


# Mostra os nomes das variaveis
names(bd)

# Dimensões do bd
dim(bd)

# mostra os 6 primeiros casos
head(bd)

# mostra os 6 ultimos casos
tail(bd)

# tira a classe da variavel
class(bd$Petal.Length)
# tirar a classe do banco
class(bd)

# estrutura do bd
str(bd)

# tira media 
mean(bd$Petal.Length, na.rm = T)

# tirar mediana
median(bd$Sepal.Width, na.rm = T)

# desvio padrão
sd(bd$Petal.Width, na.rm = T)

# max
max(bd$Sepal.Width)

# min
min(bd$Sepal.Length)

# resume as informações da varaivel
summary(bd$Sepal.Length)

# Visualização do banco
View(bd)

# Tabelas --------------------------------------------------------------


# comando para tirar tabelas de frequencia e proporção
table(bd$Species)

# funções do Questionr
freq(bd$Species)
describe(bd$Species)

# Cruzamentos de variaveis
t1 = table(bd$Sepal.Width, bd$Species) # tabela de numeros absolutos

# para calcular percentual
prop.table(t1)*100 
# ou 
prop.table(table(bd$Sepal.Width, bd$Species))*100

# para calcular 100% fechando na linha, 
# usamos o parâmetro margin = 1
t2 = round(prop.table(t1, margin = 1)*100, 2) # o numero 2 

# por defaul t2 é formato "table"
# para exportar temos que converter em dataframe
t2 = as.data.frame(t2)

class(t2)

# Salvando a tabela em Excel
write_xlsx(t2 , "tabela1.xlsx")
write_csv(t2 , "tabela1.csv")
write_csv(t2 , "tabela1.csv")

# Fim ##################################################################
