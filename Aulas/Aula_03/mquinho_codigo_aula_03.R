# ---
#
# Aula 03 - Dplyr
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
# Dplyr Website: https://dplyr.tidyverse.org/
# Dplyr Cheat Sheet: https://rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf
#

## PREAMBULO -------------------------------------------------------------------

# Instalando o Dplyr:
#install.packages("dplyr")

library(dplyr)


# Limpando nosso ambiente:
rm(list = ls())

# Setar Diretório (se não estiver usando um projetinho)
setwd(choose.dir())
getwd()

##------------------------------------------------------------------------------

# Banco de Dados:
## Para essa aula usaremos o banco de dados IRIS, já presente no R:
## O banco de dados IRIS contem a classificação de diferentes tipos da planta Íris, 
## baseado em quatro atributos.

names(iris)
dim(iris)
str(iris)
summary(iris)

## Para facilitar a manipulação dos dados, armazenaremos o banco de dados em um vetor com nome "db":
## Isso faz com que possamos chamar o banco de dados através de "db", ao invés de usarmos o nome
## original. Não é necessário, mas para banco de dados com nomes extensos ou complicados, sempre é
## bom simplificar.


# Abrir Banco de Dados de 3 formas:


iris2 <- read.csv("iris2.csv")
# iris2 <- read.csv(file.choose())
# Maneira interativa

iris2$Species <- as.factor(iris2$Species)

summary(iris2)

# Antes de entrarmos no Dplyr, um passo interessante, e que é essencial em qualquer processo de 
# tratamento de dados, é resolver os NA's:
## Para isso, acrescentaremos ao nosso banco de dados "db", uma linha contendo APENAS valores NA's:

## EXPORTAR O BANCO DE DADOS 

View(iris2)

# Identificar NA com:
## summary(x)
summary(iris)
summary(iris2)

## sum() + is.na()
is.na(iris2)
sum(is.na(iris2))


#### 

mean(iris$Sepal.Length)

mean(iris2$Sepal.Length)
mean(iris2$Sepal.Length, na.rm = TRUE)

# Realizar a função, sem atribuir ela a nenhum objeto, ou ao próprio banco,
# não altera o objeto original;
summary(iris2)

## na.exclude()
na.exclude(iris2)


iris3 <- na.exclude(iris2)


# Mostrar que o na.exclude deleta a LINHA toda que conter pelo menos 1 observação NA:
View(iris2)
View(iris3)



rm(list = ls())
##------------------------------------------------------------------------------

# Dplyr:

# Banco de Dados: iris

## Glimpse e Arrange:


### Glimpse nos oferece um resumo, bem direto, do banco de dado:
## "Olhada Rápida":
glimpse(iris)

### dbl: números reais;
### int: inteiros;
### fct: factor 

### Arrange: serve para reordenar as linhas de acordo com os valores de uma coluna:
arrange(iris, Sepal.Width)
arrange(iris, desc(Sepal.Width))


## Select e Filter
### Selecionando as variáveis desejadas:
select()
select(iris, c(Sepal.Length, Sepal.Width, Species))

db <- select(iris, Sepal.Length, Sepal.Width, Species)

class(db)
dim(db)
names(db)

### Se, ao invés de selecionar todas, o objetivo for apenas deletar uma, ou duas:
db_n <- select(iris, -Sepal.Length, Species)
db_n <- select(db, - c(Petal.Length, Petal.Width))

dim(db_n)
names(db_n)

## Filter:
db_n <- filter(iris, Species == "versicolor" & Petal.Length > 4.3)


## Podemos também combinar essas duas funções:
### Por exemplo: Imagine que estamos estudando as pétalas da íris de tipo versicolor;
### Vamos filtrar o banco para obtermos APENAS as plantas do tipo "Versicolor" e
### aquelas que possuem Petalas de comprimento MAIOR que 4.35; além disso precisamos apenas das
### variáveis Species, Petal.Length e Petal.Width

db_n <- filter(iris, Species == "versicolor" & Petal.Length > 4.3)
db_n <- select(db_n, Species, Petal.Length, Petal.Width)
db_n <- select(db_n, Petal.Length, Petal.Width,  Species)

db_n
View(db_n)


## Mutate e Rename:

### Rename: Usamos para renomear determinadas colunas de um Data Frame:
rename(iris, Largura_Sepala = Sepal.Width)
rename(iris, largura.sepala = Sepal.Width,
       teste = Species)

### Usando Rename para Renomear as Variáveis, mundando de Inglês para Português
db_pt <- rename(iris, c(Largura_Sepala = Sepal.Width, Comprimento_Sepala = Sepal.Length,
                Largura_Petala = Petal.Width, Comprimento_Petala = Petal.Length,
                Tipo = Species))

names(db_pt)


db_pt

### Mutate: Usamos para criar novas variáveis
mutate(iris, sepala = Sepal.Width + comprimento_sepala)
mutate(iris, sepala = mean(Sepal.Width))
mutate(iris, sepala = mean(Sepal.Width))

db_pt <- mutate(iris, x1 = sqrt(Sepal.Width), x2 = sqrt(comprimento_sepala))
db_pt <- rename(iris, raiz_quadrada_larg_sepala = x1,
                raiz_quadrada_comp_sepala = x2)

View(db_pt)

## Mutate: rowMeans:
#?rowMeans : (x) 
mutate(iris, sepala = rowMeans(select(iris, Sepal.Width, Sepal.Length)))


## Pipe : %>%
### Pipe (%>%) faz com que o objeto da esquerda seja o primeiro argumento, ou o objeto ao que
### o que está na direita será aplicado sobre:

x %>% sum()
1:10 %>% sum() 
# sum(1:10)

### Logo, o código: 
db_n <- filter(iris, Species == "versicolor" & Petal.Length > 4.3)
### Pode ser escrito dessa forma:
db_n <- iris %>%
  filter(Species == "versicolor" & Petal.Length > 4.3)

### A função principal do operador %>%, além de facilitar a escrita do código, é torna-lo mais
### fácil de ler, por exemplo:
#### Nosso código antigo:
db_n <- filter(iris, Species == "versicolor" & Petal.Length > 4.3)
db_n <- select(db_n, Petal.Length, Petal.Width, Species)

#### Pode ser escrito, usando %>%, da seguinte maneira:
db_n <- iris %>%
  filter(Species == "versicolor" & Petal.Length > 4.3) %>%
  select(Petal.Length, Petal.Width, Species)

db_n


rm(list = ls())





##------------------------------------------------------------------------------
# Exercício:


###-------

## Utilizando o operador pipe %>%, faça as seguinte estapas apresentadas durante a aula:
### Partindo do banco "db":
### 1) Traduza os nomes das variáveis
### 2) Filtre o banco de dados apenas pelas plantas de tipo "virginica" e que possuam uma
###     sépala de largura maior do que 3
### 3) Selecione apenas as variáveis referentes a Sépala;
### 4) Armazene todo o resultado em um vetor chamado: "sepala"

sepala <- db %>%
  rename(largura_sepala = Sepal.Width, comprimento_sepala = Sepal.Length,
         largura_petala = Petal.Width, comprimento_petala = Petal.Length,
         tipo = Species) %>%
  filter(tipo == "virginica" & largura_sepala > 3) %>%
  select(largura_sepala, comprimento_sepala)


## Agora, trabalhando no vetor "sepala":
### 1) Crie uma variável chamada "sepala_geral", que conterá a soma da largura e comprimento das
###     sépalas;
### 2) Crie uma última variável chamada "sepala_media", que conterá a média da "sepala_geral"
###     LEMBRE-SE DE QUE TEMOS NA'S!

sepala <- sepala %>%
  mutate(sepala_geral = largura_sepala + comprimento_sepala,
         sepala_media = mean(sepala_geral, na.rm = T))

sepala



rm(list = ls())




##------------------------------------------------------------------------------

## Split, Apply e Combine:


### Split, Apply e Combine é um dos processos mais comuns de análise de dados. 
### Em tradução livre: dividir, aplicar e combinar.
### No Dplyr, esse processo é representado pelas funções "group_by()" e "summarise()".
### No entanto, antes vamos aprender o que essas funções fazem:

### Group_by(): Agrupa os dados por variáveis fornecidas. Sozinho, o group_by não muda como os dados são
### mostrados. A mudança vem apenas quando combinado com outros verbos do Dplyr:
View(group_by(iris, Species))
View(iris)

  # Já o ungroup(): desfaz o agrupamento
# ungroup(db)

### Summarise(): resume os dados em uma unica linha de valores
summarise(iris, avg = mean(Sepal.Length))
mean(iris$Sepal.Length)

summarise(iris, cont = n())

### Contagem: n()
db %>% 
  group_by(Species, Petal.Width) %>%
  summarise(cont = n()) 



rm(list = ls())



## Frequencia

bd %>%
  group_by(x) %>%
  summarise(n = n()) %>%
  mutate(freq = n / sum(n))

iris %>%
  group_by(Sepal.Length) %>%
  summarise(n = n()) %>%
  mutate(perc = round(prop.table(n)*100, 0))


##------------------------------------------------------------------------------

# Exercícios:

# Carregue o banco de dados que enviamos por email.
# O banco de dados é uma base contendo a votação de cada candidato/a a deputado/a federal
# apenas na cidade de BH em 2014. As variáveis são auto-explicativas, não deve ter nenhum problema.
# No entanto, casa haja alguma dúvida, só enviar um email para os monitores.
# Para carregalo, primeiro instale o pacote para exportarmos arquivos .csv:
install.packages("readr")
  # Após feita a instalação, só carrega-lo:
library(readr)


# 1o: Abra o banco de dados

# Antes de irmos para os exercícios, verifique se há NA's na base.
# Caso tenhamos algum valor NA, delete-o do banco!

# Agora vamos por as mãos na massa!
# Lembre-se: Não há uma forma correta de fazer os exercícios, R é uma linguagem bem livre, logo, 
# existem diversas formas de chegar ao mesmo resultado! No entanto, o ideal seria utilizarmos o que foi
# ensinado na aula. Caso você vá por um caminho diferente não tem problema nenhum! Tudo faz parte do
# processo de aprendizado!

# No final do documento temos as respostas para os exercícios, casa haja alguma dúvida você pode enviar
# um email para um dos monitores e elxs irão te auxiliar!


## Exercícios:
# 1) Carregue o Banco de Dados

# 2) Qual foi o deputado com o maior número de votos? Filtre o banco de dados pelo deputado que recebeu
  # O maior número de votos


# 3) Qual foi o deputado com o menor número de votos? Filtre o banco de dados pelo deputado que recebeu
  # o menor número de votos;


# 4) Usando a lógica do Split, Apply e Combine, agrupe o banco por partidos, ordene de maneira crescente 
  # e responda: qual partido teve mais candidatos nas eleições de 2014?


# 5) Selecione o partido e o número de votos total, qual a média de votos do PT?


# 6) E quanto ao PSDB, qual foi sua média de votos?

# 7) Ou melhor, usando a lógica do Split, Apply, Combine, porque não pegar a média de voto de todos os 
  # partidos? Quais foram os 2 mais votados? E os 4 menos votados?















# RESPOSTAS


##----- 2
max(ele$TOTAL_VOTOS)

ele %>% filter(TOTAL_VOTOS == max(TOTAL_VOTOS))


##----- 3
ele %>% filter(TOTAL_VOTOS == min(TOTAL_VOTOS))



##----- 4
ele %>%
  group_by(SIGLA_PARTIDO) %>%
  summarise(cont = n()) %>%
  arrange(cont) 

##----- 5
ele %>%
  select(SIGLA_PARTIDO, TOTAL_VOTOS) %>%
  filter(SIGLA_PARTIDO == "PT") %>%
  summarise(media = mean(TOTAL_VOTOS))


##----- 6
ele %>%
  select(SIGLA_PARTIDO, TOTAL_VOTOS) %>%
  filter(SIGLA_PARTIDO == "PSDB") %>%
  summarise(media = mean(TOTAL_VOTOS))



##----- 7
ele %>%
  group_by(SIGLA_PARTIDO) %>%
  summarise(media = mean(TOTAL_VOTOS)) %>%
  arrange(media)

