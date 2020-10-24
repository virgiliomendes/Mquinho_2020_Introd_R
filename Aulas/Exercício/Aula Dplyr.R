# Aula 21/10 NA's e Dplyr

## Carregando os Pacotes:
library(dplyr)
library(readr)

## Limpando o environment:
rm(list = ls())

## Setando o Diretório:
setwd()

## Abrindo o Banco de dados:
### read.csv() > Função inata do R
iris2 <- read.csv("iris2.csv")
### read_csv > função do pacote "readr"
iris2 <- read_csv("iris2.csv")
### Abrindo o banco SEM precisar setar o diretório:
iris2 <- read_csv(file.choose())

### Verificando as difereçnas entre um banco de dados com NA's (iris2)
### e banco de dados sem NA's (iris)
summary(iris2)
summary(iris)

as.factor()

# Transformando a variável Species em fator: para o R entender ela da maneira correta
## Isso porque:
### O padrão do R é importar csvs e transformar qualquer coluna com variável
### character (ou seja, com palavras) ou factor, em uma coluna do tipo character:
iris2$Species <- as.factor(iris2$Species) 

## Verificando a classe:
class(iris2$Species)

summary(iris2)

View(iris)

# Mostrando que funções como "Média" não funcionam se tivermos NA's na variável:
mean(iris$Sepal.Length)
mean(iris2$Sepal.Length)
## A menos que coloquemos o parametro "na.rm = TRUE" ao fim da função:
### na.rm = T: faz com que, na hora de calcular a média, o R remova os NA's:
mean(iris2$Sepal.Length, na.rm = TRUE)

#### Excluindo NA's do banco:
na.exclude(iris2)

#### Criando um objeto para armazenar nosso banco de dados excluindo NA's
iris3 <- na.exclude(iris2)
summary(iris3)


# Dplyr

# Banco de dados: iris

# Limpar o Environment:
rm(list = ls())

## Glimpse()
### Pequeno e breve resumo do Banco de Dados
glimpse(iris)

## Arrange()
### Reordenar as linhas de acordo com os valores de uma coluna:
arrange(iris, Petal.Length)
arrange(iris, Sepal.Length)
### Reordenando utilizando "$"
arrange(iris, iris$Sepal.Length)

### Decrescente
#### desc() -> Decrescente
arrange(iris, desc(Sepal.Width))
### Reordenando usando "$"
arrange(iris, desc(iris$Sepal.Length))



## Select()
### Selecionar as variáveis desejadas:
select(iris, c(Sepal.Length, Sepal.Width, Species))

### Armazenando em um objeto:
select_iris <- select(iris, c(Sepal.Length, Sepal.Width, Species))
View(select_iris)

### Selecionando (excluindo) as variáveis desejadas:
select(iris, - c(Petal.Length, Petal.Width))

### Armazenando em um objeto:
plantinha <- select(iris, -c(Petal.Length, Petal.Width))



## Filter()
### Filtrando o banco de dados:
### == é diferente desse = 
filter(iris, Species == "versicolor")
### Filtrar por MAIS de uma variável:
filter(iris, Species == "versicolor" & Petal.Length > 4.3)
#### & - "e" ou "and";
#### | - "ou" ou "or"
filter(iris, Species == "versicolor" | Petal.Length > 4.3)
#### > - Maior que
#### >= Maior ou igual
#### <= Menor ou igual

### Selecionando e Filtrando:
churros <- select(iris, c(Sepal.Length, Sepal.Width, Species))
churros <- filter(churros, Species == "versicolor" & Sepal.Length > 4.3)

View(churros)


## Pipe !!!!
### %>%

# iris %>% select()
## Código Original (chato, longo, paia)
churros <- select(iris, c(Sepal.Length, Sepal.Width, Species))
churros <- filter(churros, Species == "versicolor" & Sepal.Length > 4.3)

## Código com o %>% (do caralho, fantástico, sensacional)
churros2 <- iris %>%
  select(c(Sepal.Length, Sepal.Width, Species)) %>% 
  filter(Species == c("versicolor") & Sepal.Length > 4.3) %>%
  arrange(desc(Sepal.Length))

## Para selecionar MAIS de uma espécie: usamos o operador "|":
churros_doce_de_leite <- iris %>%
  select(c(Sepal.Length, Sepal.Width, Species)) %>% 
  filter(Species == "versicolor" | Species == "virginica" & Sepal.Length > 4.3) %>%
  arrange(desc(Sepal.Length))

## mutate() : criar novas variáveis, ou modificar variáveis que já existem
### sqrt() : Raiz quadrada
mutate()

goiabada <- iris %>%
  mutate(sepala = Sepal.Width + Sepal.Length) %>%
  mutate(x1 = sqrt(Sepal.Width))


View(goiabada)



## Split, Apply, Combine
### Dividir, aplicar e combinar
### Representado Principalmente Pelas funções: group_by(), summarise()

#### group_by()
##### Sozinho, Group_by não MUDA NADA EM COMO OS DADOS SÃO MOSTRADOS
group_by(iris, Species)
View(group_by(iris, Species))

#### summarise()
##### summarise() NÃO É A MESMA COISA DE summary()
##### summarise() resumo dos dados, em uma linha 
##### summarise PRECISA de outra função;
summarise(iris, avg = mean(Sepal.Length))

#### summarise(n()): n() - Contagem
summarise(iris, cont = n())


### Usando "group_by" + "summarise":

### Contando por Tipo de Planta e Largura da Sépala:
pao_de_queijo <- iris %>%
  group_by(Species, Sepal.Width) %>%
  summarise(cont = n())

### Pegando a Média da Largura da Sépala porTipo de Planta:
doce_de_leite <- iris %>%
  group_by(Species) %>%
  summarise(avg = mean(Sepal.Length))

View(pao_de_queijo)
  


##FIM-------------------------
  
  
