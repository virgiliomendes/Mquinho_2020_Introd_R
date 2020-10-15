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

##----------------------------------------------------------------------


# Importando Bancos ----------------------------------------------------

# link: https://CRAN.R-project.org/package=dplyr
# link: https://CRAN.R-project.org/package=questionr 

#install.packages("dplyr")
#install.packages("questionr")
#install.packages("ggplot2")

# carregando os pacotes
library(readxl) #  Read Excel Files
library(questionr) # Functions to Make Surveys Processing Easier
library(dplyr) # A Grammar of Data Manipulation

# carregar banco de bados iris (inato do r)
bd = iris

# ver o diretorio de trabalho
getwd()
# setar diretório de trabalho
setwd("C:/Users/Virgilio/Desktop/")


# carrega banco em formato CSV com separador ";"
read.csv2("Base de dados - CACS LINGUAS.xlsx")
# carrega banco em formato CSV com separador ","
read.csv("Base de dados - CACS LINGUAS.xlsx")

# carrega banco em formato excel
bd = read_excel("Base de dados - CACS LINGUAS.xlsx")
# quando há mais de uma sheet ou aba no arquivo excel, 
# usar o comando ", sheet = <nome.da.aba>"

# Mostrar varias formas de importar e salvar dados


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
table(bd$`Pólo do Cliente`)
freq(bd$`Pólo do Cliente`, )


# Cruzamentos de variaveis
t1 = table(bd$polo_do_cliente, bd$prognostico) # tabela de numeros absolutos

# para calcular percentual
prop.table(t1)*100 
# ou 
prop.table(bd$polo_do_cliente, bd$prognostico)*100

# para calcular 100% fechando na linha, 
# usamos o parâmetro margin = 1
round(prop.table(t1, margin = 1)*100, 2) # o numero 2 


# Fim ##################################################################
