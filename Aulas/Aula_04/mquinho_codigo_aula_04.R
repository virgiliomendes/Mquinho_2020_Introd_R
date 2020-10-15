# ---
#
# Aula 04 - Plotando Dados
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
# 22/10/2020
# ---
#
# Material de Apoio:
# Link das aulas: https://github.com/virgiliomendes/Mquinho_2020_Introd_R

# TOPICOS:

#         - Ambiente do RStudio
#              * Funções
#                  * Recursos do RStudio (ferramentas, etc)
# 
#         - Operações Básicas
#         - Objetos (classe e tipos de dados)
#         - Importando Data Sets
#         - Estatísticas e investigações do banco de dados

## PREAMBULO -----------------------------------------------------------

# Lendo o Pacote:
## Assim como na aula do Dplyr, temos duas formas de fazer isso:
### 1) ggplot2 está contido no pacote tidyverse, então podemos simplesmente carregar o pacote tidyverse:
library(tidyverse)

### 2) Ou podemos simplesmente chamar o pacote diretamente:
library(ggplot2)


# Próximo passo, definir o diretorio para executar e salvar os arquivos
setwd("C:/Users/Virgilio/Desktop/") # Lembre-se da barra invertida!

# Próximo passo, importar o banco de dados IRIS e nomeando ele de db
db = iris

names(db)
dim(db)
str(db)
View(db)


##--------------------------------------------------------------------------

# Ggplot2

?ggplot()


## Gráfico de Dispersão:

### No Ggplot2 você começa um plot com a função "ggplot()", e então vai adicionando camadas.
### Não há um "padrão", mas a ação de adicionar camadas lhe permite maior controle.
ggplot(data = db, aes(x = X, y = Y))


### São justamente essas camadas que vão definir qual tipo de gráfico estamos querendo plotar.
### Camadas são adicionadas usando "+"
#### Por exemplo, vamos plotar um gráfico de dispersão de duas variáveis do nosso banco de dados Iris:
 
ggplot(db, aes(x = Sepal.Length, y = Sepal.Width)) + # Função Base
  geom_point(size = 2, shape = 1) # 1a Camada: Definindo o tipo de gráfico

### Ótimo! Mas o gráfico assim não fica muito bom, certo?
### E se quisermos complementa-lo, colorindo de acordo com os tipos de planta?
#### Fazemos isso através de um parâmetro que adicionamos na função base, dentro do parâmetro aes():

ggplot(db, aes(x = Sepal.Length, y = Sepal.Width, col = Species)) +
  geom_point(size = 2, shape = 1)

#### Podemos definir o parâmetro aesthetic na 1a camada, onde especificamos o tipo de gráfico: 
ggplot(db) +
  geom_point(aes(x = Sepal.Length, y = Sepal.Width, col =  Species), shape = 1)

#### O Parâmetro "shape" serve para definir o formato dos marcadores.
ggplot(db) +
  geom_point(aes(x = Sepal.Length, y = Sepal.Width, col =  Species), size = 2, shape = 1)

#### Por fim, para customizarmos mais seu gráfico, podemos fazer com que não só a cor, mas o formato
#### e o tamanho dos marcadores seja de acordo com os tipos de planta:
ggplot(db) +
  geom_point(aes(x = Sepal.Length, y = Sepal.Width, col =  Species, shape = Species, size = Species),
             size = 2)

#### Só para mostrar: Não faz diferença se você prefere especificar o X e o Y na função raiz ou na
#### 1a camada:
ggplot(db, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(aes(col =  Species, shape = Species, size = Species), size = 3)

#### Para acrescentarmos um título adicionamos uma camada chamda "ggtitle()":
ggplot(db, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(aes(col =  Species, shape = Species, size = Species), size = 3) +
  ggtitle("Grafico de Dispersão")


### Se quisermos salvar o gráfico no diretorio selecionado:
ggsave("r plot1 iris.pdf")



## Boxplot:

ggplot(db, aes(x = Species, y = Sepal.Width)) +
  geom_boxplot()


ggplot(db) +
  geom_boxplot(aes(x = Species, y = Sepal.Width))


### Para preenchermos o gráfico, podemos usar o parâmetro fill(), que deverá ser especificado dentro
### do parâmetro aes():

ggplot(db, aes(x = Species, y = Sepal.Width, fill = Species)) +
  geom_boxplot() 

#### No entanto, usar um boxplot básico pode ser perigoso, devido a uma possível ilusão da distribuição
#### dos dados. Para resolvermos esse problema, a função geom_jiter(), que pode ser acrescentada através
#### de uma camada, nos ajuda a ver a distribuição individual EM CIMA do boxplot:

ggplot(db, aes(x = Species, y = Sepal.Width, fill = Species)) +
  geom_boxplot() +
  geom_jitter(size = 1) +
  ggtitle("Boxplot")




## Histograma
### Variável: Numérica

### O histograma segue a mesma lógica dos demais. No entanto, não definimos a variável Y, pois a utilizada
### é uma frequência simples da variável observada (x). Note que adicionamos a variável Sepal.Length como
### um fator juntamente do parâmetro "fill()", isso faz com que os diversos valores do comprimento da
### Sépala se transformerm em categorias, de forma com que preencham cada uma das barras do gráfico.
ggplot(db, aes(x = Sepal.Length,fill = factor(Sepal.Length))) + 
  geom_histogram(bins = 10, col = "white")

### Aqui temos o parâmetro "bins()" e "col()" dentro da camada "geom_histogram()":
#### bins -> o número de "barras", de intervalos que teremos em nosso gráfico;
#### col -> a cor do contorno de cada barra;
ggplot(db, aes(x = Sepal.Length,fill = factor(Sepal.Length))) + 
  geom_histogram(bins = 37, col = "black") +
  ggtitle("Histograma")


## Gráfico de Barras
### Variável: Categórica

### Temos aqui três parâmetros, presentes na primeira camada:
### "size", "colour" e "alpha", que representa a opacidade das bordas das barras.
#### Para isso usaremos o banco de dados mtcars, já presente no R.
#### mtcars é um banco de dados que diz respeito ao consumo de combustível e outras 10 características
#### de 32 carros.
names(mtcars)

### Vamos plotar um gráfico de barras de número de marchas por número de carbudares:
ggplot(mtcars, aes(x = gear, fill = factor(carb))) +
  geom_bar(size = 1.5, colour = "white", alpha = 0.6)

ggplot(mtcars, aes(x = gear, fill = factor(carb))) +
  geom_bar(size = .5, colour = "black", alpha = 1)


## Grafico de Densidade
### Agora voltaremos para o nosso banco de dados "db".
### O gráfico de Densidade plota a densidade e a distribuição dos casos observados no banco por uma variável
### específica, no caso, uma variável contínua.
### Por exemplo, vamos verificar a densidade de ocorrências do Comprimento da Sépala, colorindo o gráfico
### de acordo com o tipo de planta, para facilitar e melhorar nossa análise:

ggplot(db, aes(x = Sepal.Length, fill = Species)) +
  geom_density(alpha = 0.5) 


## Grafico de Linha
### Aqui usaremos o banco de dados "swiss", já presente no R.
### swiss é um banco de dados sobre fertilidade e indicadores socio-economicos para cada uma das 47 provincias
### da Suíça que falam francês.
#### Vamos plotar, então, um gráfico de linhas de Educação por "Examination" (% de selecionados que receberam
#### as maiores notas nos exames do exército):

ggplot(swiss, aes(x = Examination, y = Education)) +
  geom_line(size = 1)

#### Assim como os outros gráficos, podemos controlar o tamanho da linha, sua cor e o tipo de linha  
#### através de: size, col e linetype
ggplot(swiss, aes(x = Examination, y = Education)) +
  geom_line(size = 1, col = "blue", linetype = 2)





# Para finalizar a aula, podemos customizar ainda mais nossos gráficos adicionando mais camadas e usando
# outros parâmetros:

## Histograma:
### labs() - Camada para definir os labels, os rótulos do gráfico:
          ## title > Título do gráfico;
          ## subtitle > Subtítulo do Gráfico;
          ## x = Rótulo do Eixo X;
          ## y = Rótulo do Eixo Y;

ggplot(iris, aes(x = Sepal.Length, fill = Species)) + 
  geom_histogram(bins = 10, col = "white") +
  labs(title = "Histograma de Comprimento da Sépala",
       subtitle = "Gráfico", x = "Comprimento da Sépala",
       y = "Frequência")

## Gráfico de Barras:
### Na 1a camada, o parâmetro "width" nos permite controlar a largura das barras;
### A 2a camada, "scale_x_continuous" nos permite customizar a escala contínua de X: aqui,
#### o parâmetro "break" controla o intervalo do eixo X, enquanto o parâmetro "labels" controla o rótulo
#### dos valores do eixo X;
### A 3a camada, "labs", como demonstrada anteriormente, controla os rótulos do gráfico. Aqui temos uma
#### adição, o parâmetro "fill" que nos permite customizar o rótulo da variável usada para preencher o
#### gráfico (definida por "fill" na função base ou na 1a camada), em outras palavras, nos permite mudar
#### o nome da nossa legenda;
### A 4a camada nos permite controlar e mudar o tema do gráfico, alguns exemplos são:
#### + themes_gray()
#### + themes_dark()
#### + themes_bw()
#### + themes_classic()
### Por fim, a 5a camada e seu parâmetro: "theme(legend.position = )"; nos permitem controlar a POSIÇÃO
#### da legenda.

plot <- ggplot(mtcars, aes(x = gear, fill = factor(carb))) +
  geom_bar(size = .5, colour = "black", alpha = 1, width = .5) +
  scale_x_continuous(breaks = mtcars$gear,
                     labels = mtcars$gear) +
  labs(title = "Grafico de Barras de Número de Marchas por Número de Carburadores",
       subtitle = "Melhor Curso de R do Brasil",
       x = "Número de Marchas",
       y = "Contagem",
       fill = "Número de Carburadores") +
  theme_minimal() + 
  theme(legend.position = "top") +  scale_fill_brewer(palette = "YlOrBr") 

plot
print(plot)



### Se quisermos mudar as cores que são usadas para preencher o gráfico, apesar de estarmos preenchendo ele
### com a variável "carb", podemos usar uma camada com a função scale_fill_brewer().
#### Para isso, primeiramente temos que instalar o pacote RColorBrewer:

#install.packages("RColorBrewer")
library(RColorBrewer)

### Após feita a instalação, escolhemos a paleta de cor:
display.brewer.all()
### E depois acrescentamos a camada:

ggplot(mtcars, aes(x = gear, fill = factor(carb))) +
  geom_bar(size = .5, colour = "black", alpha = 1, width = .5) +
  scale_x_continuous(breaks = mtcars$gear,
                     labels = mtcars$gear) +
  labs(title = "Grafico de Barras de Número de Marchas por Número de Carburadores",
       subtitle = "Melhor Curso de R do Brasil",
       x = "Número de Marchas",
       y = "Contagem",
       fill = "Número de Carburadores") +
  theme_minimal() + 
  theme(legend.position = "top") +  
  scale_fill_brewer(palette = "YlOrBr") 


## Boxplot:
### Uma alternativa é especificar os rótulos da legenda usando a função "scale_fill_brewer"; a lógica
### é a mesma de quando utilizamos "scale_x_continuous" ou "scale_x_discrete".
### Dessa vez temos o acréscimo dos parâmetros "plot.title" e "plot.subtitle", na ultima camada:
#### Esses parâmetros não fazem nada mais do que controlar a posição do título e do subtítulo;

ggplot(db, aes(x = Species, y = Sepal.Width, fill = Species)) +
  geom_boxplot() +
  geom_jitter(size = 1) +
  ggtitle("Boxplot") + 
  scale_fill_brewer(palette = "Set2", 
                    labels = c("Setosa", "Versicolor", "Virginica")) + 
  scale_x_discrete(lab = NULL) + 
  labs(title = "Boxplot Largura da Pétala por Tipo de Planta", 
       subtitle = "Melhor curso de R do Brasil",
       x = "", 
       y = "Largura da Pétala", 
       fill = "Tipo de Planta") + 
  theme_minimal() + 
  theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) 




#################

# Por fim, para salvar um gráfico podemos adicionar uma camada com 
# a seguinte função: 
ggsave(filename = "grafico.png",
       width = 6, height = 2.8)







### SE DER TEMPO ###
##########################################################################
## Extra

#Geom_ Smooth - grafico de tendencia
ggplot(db, aes(x = Sepal.Length, y = Petal.Length)) +
  geom_point() +
  geom_smooth()

ggsave("grafico de tendencia1.pdf")

# grafico de tendencia por especie
ggplot(db, aes(x = Sepal.Length, y = Petal.Length, col = Species)) +
  geom_point() +
  geom_smooth(method = "lm")

ggsave("grafico de tendencia por especie.pdf")
##########################################################################

