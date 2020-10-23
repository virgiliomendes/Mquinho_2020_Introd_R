

library(ggplot2)

iris = iris

## Boxplot
## geom_

ggplot(iris, aes(x = Species, y = Sepal.Width)) +
  geom_boxplot()

## preenchendo nosso boxplot de acordo com a coluna "species":
ggplot(iris, aes(x = Species, y = Sepal.Width, fill = Species)) +
  geom_boxplot()


## Colocar um título ao nosso boxplot:
ggplot(iris, aes(x = Species, y = Sepal.Width, fill = Species)) +
  geom_boxplot() +
  ggtitle("Boxplot Bonitão") + 
  ggsave("boxplot iris.png", height = 6, width = 5, dpi = 300)


### Histograma
## Histograma com "bins" para delimitar a quantidade de barras no eixo X
ggplot(iris, aes(x = Sepal.Width)) +
  geom_histogram(bins = 10, col = "black")


## Histograma com fill para identificar especies por Largura da Sépala
ggplot(iris, aes(x = Sepal.Width, fill = Species)) +
  geom_histogram(bins = 10, col = "black")

## Histograma com os títulos com o parametro hjust
ggplot(iris, aes(x = Sepal.Width)) +
  geom_histogram(bins = 10, col = "black") +
  labs(title = "Histograma", subtitle = "Introdução ao R - Mquinho 2020",
       x = "Largura da Sepala", y = "Frequência", caption = "Virgilio M.") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = .5), 
        plot.subtitle = element_text(hjust = .5))
  

ggsave("virgilio_plot1.png", height = 8, width = 8, dpi = 300)



### Gráfico de Densidade
## Serve para variáveis númericas contínuas
## scale_x_continuous é parametro de escala do eixo x
## alpha é opacidade
ggplot(iris, aes(x = Sepal.Length, fill = Species)) +
  geom_density(alpha = 0.5) +
  scale_x_continuous(limits = c(4, 9), breaks = c(4, 6, 8)) +
  theme_minimal() +
  labs(title = "Gráfico de Densidade", 
       subtitle = "Introdução ao R - Mquinho 2020",
       x = "Largura da Sepala") +
  theme(plot.title = element_text(hjust = .5), 
        plot.subtitle = element_text(hjust = .5))

ggsave("virgilio_plot2.png",height = 8, width = 8, dpi = 300)


#### Banco de dados: Swiss
swiss = swiss

# Investigação 
names(swiss)

### Gráfico de linha
## 
ggplot(swiss, aes( x = Examination, y = Education)) +
  geom_line(size = .5, col = "blue", linetype = 2) +
  theme_minimal() +
  labs(title = "Gráfico de Linha", 
       subtitle = "Introdução ao R - Mquinho 2020", 
       caption = "Virgilio M.") +
  theme(plot.title = element_text(hjust = .5), 
        plot.subtitle = element_text(hjust = .5))


### Geom Point


ggplot(iris, aes(x = Sepal.Length, y = Petal.Width, 
                 col = Species)) +
  geom_point() +
  geom_smooth(method = "lm")

















