library(ggplot2)
library(ggpubr)
library(factoextra)
set.seed(123)


gdp <- read.csv('countries.csv')

gdp_NA <- subset(gdp, Continent == "North America")
gdp_NA_v2 <- gdp_NA[,c(3, 6:7)]
gdp_NA_v3 <- gdp_NA_v2[,-1]
rownames(gdp_NA_v3) <- gdp_NA_v2[,1]

samp2 <- samp[,-1]
rownames(samp2) <- samp[,1]


gdp_Asia <- subset(gdp, Continent == "Asia")
gdp_Europe <- subset(gdp, Continent == "Europe")


ggplot(gdp_NA, aes(x=IMF_GDP, y=GDP_per_capita, color=Country),) + 
  geom_point(aes(size=Population), shape = 19)

ggplot(gdp_Asia, aes(x=IMF_GDP, y=GDP_per_capita, color=Country)) + 
  geom_point(aes(size=Population))

ggplot(gdp_Europe, aes(x=IMF_GDP, y=GDP_per_capita, color=Country)) + 
  geom_point(aes(size=Population))



km.res <- kmeans(gdp_NA_v3, 4, nstart = 25)
print(km.res)

fviz_cluster(km.res, data = gdp_NA_v3,
             palette = c("#2E9FDF", "#00AFBB", "#E7B800", "#D4C685"), 
             geom = "point",
             ellipse.type = "convex", 
             ggtheme = theme_bw(),
             xlim(,2)
)
