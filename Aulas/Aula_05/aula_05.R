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

# limpar enviroment
rm(list = ls())


library(writexl)
library(dplyr)
library(foreign)
library(haven)

# Importar RDds
bd = read.spss("BD_CIS0166.sav") # importa como lista
bd = read_sav("BD_CIS0166.sav") # haven
bd = readRDS("BD_CIS0166.rds")

# Investigar o bd


names(bd)
bd %>% names()

View(bd)

# Variavel Q28: Avaliação do Programa Bolsa Família

# 1 Ótimo
# 2 Bom
# 3 Regular
# 4 Ruim
# 5 Péssimo
# 9 Não sabe / Não respondeu


# peço a classe
class(bd$Q28)

# 
summary(bd$Q28)

# transformar em factor
bd$Q28 = as.factor(bd$Q28)

# soma os NA's de uma variavel
sum(is.na(bd$Q28))

# tabela
table(bd$Q28)

# criar as labels corretas para a variavel Q28
bd$Q28 = factor(bd$Q28, levels = c(1, 2, 3, 4, 5, 9),
                labels = c("Ótimo", "Bom", "Regular", "Ruim", "Péssimo", "NS/NR"))

# criar Regiao do pais

# 1 Norte
# 2 Nordeste
# 3 Sudeste
# 4 Sul
# 5 Centro-Oeste

# tabela
table(bd$Q2)

# classe
class(bd$Q2)

# criar as labels corretas para a variavel Q2
bd$Q2 = factor(bd$Q2, levels = c(1, 2, 3, 4, 5),
                labels = c("Norte", "Nordeste", "Sudeste", "Sul", "Centro-Oeste"))

# tabela
table(bd$Q2)

# tabela cruzada
t1 = table(bd$Q28, bd$Q2)

# tabela relativa
prop.table(t1)*100
prop.table(table(bd$Q2, bd$Q28))*100

# arredondar as casas decimais
#round()
round(prop.table(t1)*100, 2)
t2 = round(prop.table(table(bd$Q2, bd$Q28))*100, 2)

# FORMATOS TABLE NÃO EXPORTAM!!!
# transformando a tabela em data frame para exportar
t2 = as.data.frame(t2)

# classe da tabela que foi convertida
class(t2)

# Exportar a tabela t2
library(writexl) # para exportar tabelas em excel


write_xlsx(t2, "tabela_reg_por_aval_bf.xlsx")











