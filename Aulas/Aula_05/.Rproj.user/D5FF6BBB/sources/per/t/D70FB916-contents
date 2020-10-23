# ---
#
# Aula 05 - Aplicando nossos Conhecimentos
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


# Importando Bancos ----------------------------------------------------

# Apresentar como carregar pacotes

# carregando os pacotes
library(readxl) #  Read Excel Files
library(questionr) # Functions to Make Surveys Processing Easier
library(dplyr) # A Grammar of Data Manipulation
library(foreign) # Leitura de arquivos (ex: SPSS, dta - Stata)
library(writexl) # Exporta em Excel
library(readr) # Write Data frame in different formats

bd = read.csv("dados_eleicao.csv") 

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

## class
# Formato "table" não exporta para csvs ou xlsx!!!!!
class(t2)

# por defaul t2 é formato "table"
# para exportar temos que converter em dataframe
t2 = as.data.frame(t2)

class(t2)

# Salvando a tabela em Excel
write_xlsx(t2 , "tabela1.xlsx")
write_csv(t2 , "tabela1.csv")
write_csv(t2 , "tabela1.csv")

# Fim ##################################################################


## Exercício

# Questão 1) Utilizar o banco de dados do BD_CIS0166.RDS para tirar 
# as principais estatísticas descritivas de interesse, lembre-se de
# tratar as variaveis antes:

# Resposta:
# -----------------------
# Abrindo o R pelo Projeto! O codigo.R e o banco de dados devem estar 
# na mesma pasta que o projeto.R


library(readr) 
library(readxl)
library(writexl)

# Importa arquivo em rds
bd = readRDS("BD_CIS0166.rds")

# para tratar as variaveis segundo o codebook usa-se:

# Passo 1: transforma a variavel de interesse me factor (para trabalhar com categorias)
# CUIDADO COM ACENTOS!
bd$Q28 = as.factor(bd$Q28)

# Passo 2: Conferir se a classe da variavel mudou
class(bd$Q28)


# Passo 3: Aplica ao valor numérico (a categoria) o significado:
# Tratamento
# Repare que tem que ser na ordem, o primeiro termo "1" vira "Feminino" e o "2" vira "Masculino"
bd$Q28 = factor(bd$Q28, levels = c(1, 2, 3, 4, 5, 9),
                labels = c("Ótimo", "Bom", "Regular", "Ruim","Péssimo", "NS/NR"))

# Agora, sua variavel Q28 está com as Categorias escalares de 1 a 5 e 9 com Labels!
# Agora basta tirar as astatísticas descritivas que aprendemos:
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

# -----------------------

# Questão 2) Criar tabelas de frequência absoluta e cruzamentos:

# Resposta:
# -----------------------

# comando para tirar tabelas de frequencia e proporção
table(bd$Species)

# funções do Questionr
freq(bd$Species)
describe(bd$Species)

# Cruzamentos de variaveis
t1 = table(bd$Sepal.Width, bd$Species) # tabela de numeros absolutos

# -----------------------
# Questão 3) Criar tabelas de frequência relativa e cruzamentos:

# Resposta:
# -----------------------
# para calcular percentual
prop.table(t1)*100 
# ou 
prop.table(table(bd$Sepal.Width, bd$Species))*100

# -----------------------
# Questão 4) Exportar as tabelas em formato excel:

# Resposta:
# -----------------------

# para calcular 100% fechando na linha, 
# usamos o parâmetro margin = 1
t2 = round(prop.table(t1, margin = 1)*100, 2) # o numero 2 

## class
# Formato "table" não exporta para csvs ou xlsx!!!!!
class(t2)

# por defaul t2 é formato "table"
# para exportar temos que converter em dataframe
t2 = as.data.frame(t2)

class(t2)

# Salvando a tabela em Excel
write_xlsx(t2 , "tabela1.xlsx")

# -----------------------


rm(list = ls())





