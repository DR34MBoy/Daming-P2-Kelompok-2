## Library ##
install.packages("ggplot2")
install.packages("ggpubr")
install.packages("factoextra")
install.packages("tidyverse")
install.packages("cluster")
install.packages("ggmice")

library(ggplot2)
library(ggpubr)
library(factoextra)
library(tidyverse)
library(cluster)
library(ggmice)

set.seed(123)


## Read dataset ##
gdp <- read.csv('countries.csv')
gdp_fix <- gdp[c(3:5, 7:8)]


## Split dataset by continent ##
gdp_Asia <- filter(gdp_fix, Continent == "Asia")
gdp_Africa <- filter(gdp_fix, Continent == "Africa")
gdp_NA <- filter(gdp_fix, Continent == "North America")
gdp_SA <- filter(gdp_fix, Continent == "South America")
gdp_Europe <- filter(gdp_fix, Continent == "Europe")
gdp_Oceania <- filter(gdp_fix, Continent == "Oceania")


## Scatter plot ##
# Asia #
ggplot(gdp_Asia, aes(x=Population, y=GDP_per_capita, fill = "blue")) + 
  geom_point(aes(size=UN_GDP))+geom_smooth()+ labs(title="Asia GDP per capita on population")

# Africa #
ggplot(gdp_Africa, aes(x=Population, y=GDP_per_capita, fill = "blue")) + 
  geom_point(aes(size=UN_GDP))+geom_smooth()+ labs(title="Africa GDP per capita on population")

# North America #
ggplot(gdp_NA, aes(x=Population, y=GDP_per_capita, fill = "blue")) + 
  geom_point(aes(size=UN_GDP))+geom_smooth()+ labs(title="North America GDP per capita on population")

# South America #
ggplot(gdp_SA, aes(x=Population, y=GDP_per_capita, fill = "blue")) + 
  geom_point(aes(size=UN_GDP))+geom_smooth()+ labs(title="South America GDP per capita on population")

# Europe #
ggplot(gdp_Europe, aes(x=Population, y=GDP_per_capita, fill = "blue")) + 
  geom_point(aes(size=UN_GDP))+geom_smooth()+ labs(title="Europe GDP per capita on population")

# Oceania #
ggplot(gdp_Oceania, aes(x=Population, y=GDP_per_capita, fill = "blue")) + 
  geom_point(aes(size=UN_GDP))+geom_smooth()+ labs(title="Oceania GDP per capita on population")


## Extra setup ##
# Asia #
gdp_Asia_v2 <- gdp_Asia[,c(1, 3, 5)]
gdp_Asia_v3 <- gdp_Asia_v2[,-1]
rownames(gdp_Asia_v3) <- gdp_Asia_v2[,1]

# Determine optimal cluster
gap_stat_Asia <- clusGap(gdp_Asia_v3, FUN = kmeans, nstart = 25,
                         K.max = 10, B = 50)
fviz_gap_stat(gap_stat_Asia)

# Africa #
gdp_Africa_v2 <- gdp_Africa[,c(1, 3, 5)]
gdp_Africa_v3 <- gdp_Africa_v2[,-1]
rownames(gdp_Africa_v3) <- gdp_Africa_v2[,1]

# Determine optimal cluster
gap_stat_Africa <- clusGap(gdp_Africa_v3, FUN = kmeans, nstart = 25,
                           K.max = 10, B = 50)
fviz_gap_stat(gap_stat_Africa)

# North America #
gdp_NA_v2 <- gdp_NA[,c(1, 3, 5)]
gdp_NA_v3 <- gdp_NA_v2[,-1]
rownames(gdp_NA_v3) <- gdp_NA_v2[,1]

# Determine optimal cluster
gap_stat_NA <- clusGap(gdp_NA_v3, FUN = kmeans, nstart = 25,
                       K.max = 10, B = 50)
fviz_gap_stat(gap_stat_NA)

# South America
gdp_SA_v2 <- gdp_SA[,c(1, 3, 5)]
gdp_SA_v3 <- gdp_SA_v2[,-1]
rownames(gdp_SA_v3) <- gdp_SA_v2[,1]

# Determine optimal cluster 
gap_stat_SA <- clusGap(gdp_SA_v3, FUN = kmeans, nstart = 25,
                       K.max = 10, B = 50)
fviz_gap_stat(gap_stat_SA)

# Europe #
gdp_Europe_v2 <- gdp_Europe[,c(1, 3, 5)]
gdp_Europe_v3 <- gdp_Europe_v2[,-1]
rownames(gdp_Europe_v3) <- gdp_Europe_v2[,1]

# Determine optimal cluster
gap_stat_Europe <- clusGap(gdp_Europe_v3, FUN = kmeans, nstart = 25,
                           K.max = 10, B = 50)
fviz_gap_stat(gap_stat_Europe)

# Oceania #
gdp_Oceania_v2 <- gdp_Oceania[,c(1, 3, 5)]
gdp_Oceania_v3 <- gdp_Oceania_v2[,-1]
rownames(gdp_Oceania_v3) <- gdp_Oceania_v2[,1]

# Determine optimal cluster
gap_stat_Oceania <- clusGap(gdp_Oceania_v3, FUN = kmeans, nstart = 25,
                            K.max = 10, B = 50)
fviz_gap_stat(gap_stat_Oceania)


## K-Means Clustering
# Asia
Asia_km <- kmeans(gdp_Asia_v3, 2, nstart = 25)
print(Asia_km)

fviz_cluster(Asia_km, data = gdp_Asia_v3,
             palette = rainbow(6), 
             geom = "point",
             ellipse.type = "convex", 
             ggtheme = theme_bw()
)

# Africa
Africa_km <- kmeans(gdp_Africa_v3, 1, nstart = 25)
print(Africa_km)

fviz_cluster(Africa_km, data = gdp_Africa_v3,
             palette = rainbow(6), 
             geom = "point",
             ellipse.type = "convex", 
             ggtheme = theme_bw()
)

# North America
NA_km <- kmeans(gdp_NA_v3, 1, nstart = 25)
print(NA_km)

fviz_cluster(NA_km, data = gdp_NA_v3,
             palette = rainbow(6), 
             geom = "point",
             ellipse.type = "convex", 
             ggtheme = theme_bw()
)

# South America
SA_km <- kmeans(gdp_SA_v3, 1, nstart = 25)
print(SA_km)

fviz_cluster(SA_km, data = gdp_SA_v3,
             palette = rainbow(6), 
             geom = "point",
             ellipse.type = "convex", 
             ggtheme = theme_bw()
)

# Europe
Europe_km <- kmeans(gdp_Europe_v3, 1, nstart = 25)
print(Europe_km)

fviz_cluster(Europe_km, data = gdp_Europe_v3,
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