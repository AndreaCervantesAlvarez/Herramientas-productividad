#Crear un gráfico de barras que muestre la eficiencia de combustible (mpg)
#para diferentes categorías de número de cilindros en el conjunto de datos 
#mtcars, utilizando la librería ggplot2.
library(dslabs)
library(extrafont)
data("mtcars")

font_import()
loadfonts(device = "win")
windowsFonts(comic = "comic sans")

#filtrarlosdatos
mtcars_filter <- mtcars[complete.cases(mtcars$mpg), ]

#creando gráfico
graph_with_start_10 <- ggplot(mtcars_filter, aes(x = rownames(mtcars_filter), y = mpg, fill = factor(cyl)))+
  geom_bar(stat = "identity", position = "dodge", color = "black") +
  geom_hline(yintercept = 10, linetype = "dashed", color = "black") +
  geom_text(aes(label = mpg), vjust = -0.5, color = "black", size = 3) +
  labs(title = "Millas por galón por modelo",
       x = "Modelo de automóvil",
       y = "Millas por galón",
       fill = "Cilindros") + 
  theme_minimal() +
  theme(axis.title = element_text(size = 14)) +
  theme(plot.title = element_text(hjust = 0.5))+
  theme(text = element_text(family = "comic sans"))+
  theme(axis.text.x = element_text(size = 9, angle = 90, hjust = 1))+
  scale_fill_manual(values = c("skyblue", "pink", "yellow"))

print(graph_with_start_10)
