## Library ##
install.packages("ggplot2")
install.packages("ggpubr")
install.packages("factoextra")
install.packages("tidyverse")
install.packages("cluster")

library(ggplot2)
library(ggpubr)
library(factoextra)
library(tidyverse)
library(cluster)

set.seed(123)


## Read dataset ##
gdp <- read.csv('countries.csv')
gdp <- drop_na(gdp)


## Split dataset by continent ##
gdp_Asia <- filter(gdp, Continent == "Asia")
gdp_Africa <- filter(gdp, Continent == "Africa")
gdp_NA <- filter(gdp, Continent == "North America")
gdp_SA <- filter(gdp, Continent == "South America")
gdp_Europe <- filter(gdp, Continent == "Europe")
gdp_Oceania <- filter(gdp, Continent == "Oceania")


## Scatter plot ##
# Asia #
ggplot(gdp_Asia, aes(x=UN_GDP, y=GDP_per_capita, fill = "blue")) + 
  geom_point(aes(size=Population))+geom_smooth()+ labs(title="Asia GDP per capita on population")

# Africa #
ggplot(gdp_Africa, aes(x=UN_GDP, y=GDP_per_capita, fill = "blue")) + 
  geom_point(aes(size=Population))+geom_smooth()+ labs(title="Africa GDP per capita on population")

# North America #
ggplot(gdp_NA, aes(x=UN_GDP, y=GDP_per_capita, fill = "blue")) + 
  geom_point(aes(size=Population))+geom_smooth()+ labs(title="North America GDP per capita on population")

# South America #
ggplot(gdp_SA, aes(x=UN_GDP, y=GDP_per_capita, fill = "blue")) + 
  geom_point(aes(size=Population))+geom_smooth()+ labs(title="South America GDP per capita on population")

# Europe #
ggplot(gdp_Europe, aes(x=UN_GDP, y=GDP_per_capita, fill = "blue")) + 
  geom_point(aes(size=Population))+geom_smooth()+ labs(title="Europe GDP per capita on population")

# Oceania #
ggplot(gdp_Oceania, aes(x=UN_GDP, y=GDP_per_capita, fill = "blue")) + 
  geom_point(aes(size=Population))+geom_smooth()+ labs(title="Oceania GDP per capita on population")


## Extra setup ##
# Asia #
gdp_Asia_v2 <- gdp_Asia[,c(3, 5, 8)]
gdp_Asia_v3 <- gdp_Asia_v2[,-1]
rownames(gdp_Asia_v3) <- gdp_Asia_v2[,1]

# Determine optimal cluster
gap_stat_Asia <- clusGap(gdp_Asia_v3, FUN = kmeans, nstart = 25,
                    K.max = 10, B = 50)
fviz_gap_stat(gap_stat_Asia)

# Africa #
gdp_Africa_v2 <- gdp_Africa[,c(3, 5, 8)]
gdp_Africa_v3 <- gdp_Africa_v2[,-1]
rownames(gdp_Africa_v3) <- gdp_Africa_v2[,1]

# Determine optimal cluster
gap_stat_Africa <- clusGap(gdp_Africa_v3, FUN = kmeans, nstart = 25,
                    K.max = 10, B = 50)
fviz_gap_stat(gap_stat_Africa)

# North America #
gdp_NA_v2 <- gdp_NA[,c(3, 5, 8)]
gdp_NA_v3 <- gdp_NA_v2[,-1]
rownames(gdp_NA_v3) <- gdp_NA_v2[,1]

# Determine optimal cluster
gap_stat_NA <- clusGap(gdp_NA_v3, FUN = kmeans, nstart = 25,
                    K.max = 10, B = 50)
fviz_gap_stat(gap_stat_NA)

# South America
gdp_SA_v2 <- gdp_SA[,c(3, 5, 8)]
gdp_SA_v3 <- gdp_SA_v2[,-1]
rownames(gdp_SA_v3) <- gdp_SA_v2[,1]

# Determine optimal cluster 
gap_stat_SA <- clusGap(gdp_SA_v3, FUN = kmeans, nstart = 25,
                    K.max = 10, B = 50)
fviz_gap_stat(gap_stat_SA)

# Europe #
gdp_Europe_v2 <- gdp_Europe[,c(3, 5, 8)]
gdp_Europe_v3 <- gdp_Europe_v2[,-1]
rownames(gdp_Europe_v3) <- gdp_Europe_v2[,1]

# Determine optimal cluster
gap_stat_Europe <- clusGap(gdp_Europe_v3, FUN = kmeans, nstart = 25,
                    K.max = 10, B = 50)
fviz_gap_stat(gap_stat_Europe)

# Oceania #
gdp_Oceania_v2 <- gdp_Oceania[,c(3, 5, 8)]
gdp_Oceania_v3 <- gdp_Oceania_v2[,-1]
rownames(gdp_Oceania_v3) <- gdp_Oceania_v2[,1]

# Determine optimal cluster
gap_stat_Oceania <- clusGap(gdp_Oceania_v3, FUN = kmeans, nstart = 25,
                    K.max = 10, B = 50)
fviz_gap_stat(gap_stat_Oceania)


## K-Means Clustering
# North America
NA_km <- kmeans(gdp_NA_v3, 1, nstart = 25)
print(NA_km)

fviz_cluster(NA_km, data = gdp_NA_v3,
             palette = rainbow(6), 
             geom = "point",
             ellipse.type = "convex", 
             ggtheme = theme_bw()
)

# Oceania
Oceania_km <- kmeans(gdp_Oceania_v3, 3, nstart = 25)
print(Oceania_km)

fviz_cluster(Oceania_km, data = gdp_Oceania_v3,
             palette = rainbow(6), 
             geom = "point",
             ellipse.type = "convex", 
             ggtheme = theme_bw()
)
