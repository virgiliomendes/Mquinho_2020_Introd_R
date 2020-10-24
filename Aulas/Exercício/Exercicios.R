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
library(readr)

# Limpando nosso ambiente:
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
setwd()
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
# Se precisar, volte nos scripts das aulas anteriores e assista as aulas novamente =)
# Lembrando:
## Os exercícios não são obrigatórios, então divirta-se e tenha uma boa experiência :)

## Exercícios:
# 1) Abra o Banco de Dados


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


##----- 2
max(ele$TOTAL_VOTOS)

ele %>% filter(TOTAL_VOTOS == max(TOTAL_VOTOS))


##----- 3
ele %>% filter(TOTAL_VOTOS != min(TOTAL_VOTOS))



##----- 4
ele %>%
  group_by(SIGLA_PARTIDO) %>%
  summarise(cont = n()) %>%
  arrange(cont) 

##----- 5
bd = ele %>%
  select(SIGLA_PARTIDO, TOTAL_VOTOS) %>%
  filter(SIGLA_PARTIDO == "PT") %>%
  summarise(media = mean(TOTAL_VOTOS))


bd1 = ele %>%
  filter(TOTAL_VOTOS & SIGLA_PARTIDO == "PT") %>%
  summarise(media_pt = mean(TOTAL_VOTOS))


PT = filter(eleicao, SIGLA_PARTIDO == "PT")
votosPT = PT %>%
  summarise(total = mean(TOTAL_VOTOS))
View(votosPT)

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




