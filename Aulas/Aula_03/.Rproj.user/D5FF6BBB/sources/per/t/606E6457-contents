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
## Podemos instalar e carregar o pacote "dplyr" de duas formas:
### 1) Através do Tidyverse: Dplyr é um dos pacotes que fazem parte do Tidyverse
install.packages("tidyverse")
library(tidyverse)

### 2) Podemos instalar e carregar APENAS o Dplyr:
install.packages("dplyr")
library(dplyr)


# Limpando nosso ambiente:
rm(list = ls())

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
db <- iris

# Antes de entrarmos no Dplyr, um passo interessante, e que é essencial em qualquer processo de 
# tratamento de dados, é resolver os NA's:
## Para isso, acrescentaremos ao nosso banco de dados "db", uma linha contendo APENAS valores NA's:
db_na <- rbind(db, c(NA, NA, NA, NA, NA))

dim(db)
dim(db_na)

str(db)
str(db_na)

summary(db)
summary(db_na)

is.na(db_na)
sum(is.na(db_na))

apply(is.na(db_na), 2, which)
## apply(x, MARGIN, FUN):
##    Margin: 1 - Linhas; 2 - Colunas

mean(db_na$Sepal.Length)
mean(db_na$Sepal.Length, na.rm = TRUE)

db_sem_na <- na.exclude(db_na)
db_sub <- na.omit(db_na)

summary(db_sub)
summary(db_sem_na)

## na.omit faz uma "listwise deletion", ou seja, deleta uma observação INTEIRA (a linha inteira),
## caso haja algum NA em algum de seus valores.
## No nosso caso não tem problema, já que apenas a ultima linha possui valores NA's. No entanto,
## Se fosse diferente:
o1 <- c(5, NA, 5.2, 1.9, "virginica")
o2 <- c(NA, 3.2, 1.7, 1.7, "virginica")
o3 <- c(5, 3.2, NA, 1.9, "virginica")

db_na <- rbind(db, o1, o2, o3)
nrow(na.omit(db_na))
length(na.omit(db_na$Sepal.Length))

## 
db_na$Sepal.Length <- as.numeric(db_na$Sepal.Length)
db_na$Sepal.Width <- as.numeric(db_na$Sepal.Width)
db_na$Petal.Length <- as.numeric(db_na$Petal.Length)
db_na$Petal.Width <- as.numeric(db_na$Petal.Width)


rm(list = ls())
##------------------------------------------------------------------------------

# Dplyr:
db <- iris

## Glimpse e Arrange:

### Glimpse nos oferece um resumo, bem direto, do banco de dado:
glimpse(db)

### dbl: números reais;
### int: inteiros;
### fct: factor 

### Arrange: serve para reordenar as linhas de acordo com os valores de uma coluna:
arrange(db, Sepal.Width)
arrange(db, desc(Sepal.Width))


## Select e Filter
### Selecionando as variáveis desejadas:
db_n <- select(db, Sepal.Length, Sepal.Width, Species)

dim(db_n)
names(db_n)

### Se, ao invés de selecionar todas, o objetivo for apenas deletar uma, ou duas:
db_n <- select(db, - c(Petal.Length, Petal.Width))

dim(db_n)
names(db_n)

## Podemos também combinar essas duas funções:
### Por exemplo: Imagine que estamos estudando as pétalas da íris de tipo versicolor;
### Vamos filtrar o banco para obtermos APENAS as plantas do tipo "Versicolor" e
### aquelas que possuem Petalas de comprimento MAIOR que 4.35; além disso precisamos apenas das
### variáveis Species, Petal.Length e Petal.Width

db_n <- filter(db, Species == "versicolor" & Petal.Length > 4.3)
db_n <- select(db_n, Species, Petal.Length, Petal.Width)
db_n <- select(db_n, Petal.Length, Petal.Width,  Species)

db_n
View(db_n)

### A função "select", no entanto, pode ser completada com alguns outros parâmetros interessantes
### Através de help(dplyr::select), ou apenas ?select, conseguimos identificar alguns deles:
?select

select(db, contains("."))
select(db, ends_with("Width"))
select(db, starts_with("Sepal"))
select(db, num_range("x", 1:5))
select(db, Sepal.Length:Petal.Width)


## Mutate e Rename:

### Rename: Usamos para renomear determinadas colunas de um Data Frame:
rename(db, Largura_Sepala = Sepal.Width)

### Usando Rename para Renomear as Variáveis, mundando de Inglês para Português
db_pt <- rename(db, Largura_Sepala = Sepal.Width, Comprimento_Sepala = Sepal.Length,
                Largura_Petala = Petal.Width, Comprimento_Petala = Petal.Length,
                Tipo = Species)

names(db_pt)

### Transformando os nomes em letras minusculas:
names(db_pt) <- tolower(names(db_pt))

db_pt

### Mutate: Usamos para criar novas variáveis
mutate(db_pt, sepala = largura_sepala + comprimento_sepala)
mutate(db_pt, sepala = mean(largura_sepala))
mutate(db_pt, sepala = mean(largura_sepala))

db_pt <- mutate(db_pt, x1 = sqrt(largura_sepala), x2 = sqrt(comprimento_sepala))
db_pt <- rename(db_pt, raiz_quadrada_larg_sepala = x1,
                raiz_quadrada_comp_sepala = x2)

View(db_pt)


## Pipe : %>%
### Pipe (%>%) faz com que o objeto da esquerda seja o primeiro argumento, ou o objeto ao que
### o que está na direita será aplicado sobre:
#### Ex.:
####  f(x, y) é a mesma coisa que x %>% f(y)

### Logo, o código: 
db_n <- filter(db_pt, tipo == "versicolor" & comprimento_petala > 4.3)
### Pode ser escrito dessa forma:
db_n <- db_pt %>%
  filter(tipo == "versicolor" & comprimento_petala > 4.3)

### A função principal do operador %>%, além de facilitar a escrita do código, é torna-lo mais
### fácil de ler, por exemplo:
#### Nosso código antigo:
db_n <- filter(db_pt, tipo == "versicolor" & comprimento_petala > 4.3)
db_n <- select(db_n, comprimento_petala, largura_petala, tipo)

#### Pode ser escrito, usando %>%, da seguinte maneira:
db_n <- db_pt %>%
  filter(tipo == "versicolor" & comprimento_petala > 4.3) %>%
  select(comprimento_petala, largura_petala, tipo)

db_n


rm(list = ls())







##------------------------------------------------------------------------------
# Exercício:

db <- iris
o1 <- c(5, NA, 5.2, 1.9, "virginica")
o2 <- c(NA, 3.2, 1.7, 1.7, "virginica")
o3 <- c(5, 3.2, NA, 1.9, "virginica")

db <- rbind(db, o1, o2, o3)

db$Sepal.Length <- as.numeric(db$Sepal.Length)
db$Sepal.Width <- as.numeric(db$Sepal.Width)
db$Petal.Length <- as.numeric(db$Petal.Length)
db$Petal.Width <- as.numeric(db$Petal.Width)

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

db <- iris %>%
  rename(largura_sepala = Sepal.Width, comprimento_sepala = Sepal.Length,
         largura_petala = Petal.Width, comprimento_petala = Petal.Length,
         tipo = Species)


### Split, Apply e Combine é um dos processos mais comuns de análise de dados. 
### Em tradução livre: dividir, aplicar e combinar.
### No Dplyr, esse processo é representado pelas funções "group_by()" e "summarise()".
### No entanto, antes vamos aprender o que essas funções fazem:

### Group_by(): Agrupa os dados por variáveis fornecidas. Sozinho, o group_by não muda como os dados são
### mostrados. A mudança vem apenas quando combinado com outros verbos do Dplyr:
View(group_by(db, tipo))
View(db)
  # Já o ungroup(): desfaz o agrupamento
ungroup(db)

### Summarise(): resume os dados em uma unica linha de valores
summarise(iris, avg = mean(Sepal.Length))
mean(iris$Sepal.Length)

  ## Summarise_each(): Aplica a função em cada coluna:
summarise_each(iris, funs(mean))
    ## Summarise_each está ultrapassada e não recebe mais atualizações, com isso em mente, existe a função
      # Across; no entanto, across() só pode ser utilizada com outros verbos do dplyr:
iris %>%
  group_by(Species) %>%
  summarise(across(starts_with("Sepal"), mean))

### Contagem: n()
db %>% 
  group_by(tipo, largura_petala) %>%
  summarise(cont = n()) %>%
  ungroup()



rm(list = ls())




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

# Para abrir o banco de dados temos duas opções:
# 1) Definindo o nosso ambiente de trabalho
setwd("C:/Users/eduta/Desktop")
  # E em seguida abrindo o arquivo:
ele <- read_csv("dados_eleicao.csv")

# 2) Abrindo o banco de dados com o parametro "file.choose()"
ele <- read_csv(file.choose())


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
# 1) Transforme todos os nomes de variáveis em letras minusculas

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
##----- 1
names(ele) <- tolower(names(ele))


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

