# Buat tabel / dataframe
tanggal <- c ("10 Juli" , "11 Juli", "12 Juli", "13 Juli", "14 Juli", "15 Juli", "16 Juli", "17 Juli", "18 Juli", "19 Juli", "20 Juli", "21 Juli")
kasus <- c (10397, 10481, 11743, 9648, 10206, 10264, 9952, 8127, 7251, 3997, 4939, 4766)
sembuh <- c (13468, 16452, 16413, 3648, 2427, 2409, 6766, 9355, 9453, 10157, 9777, 8366)
meninggal <- c (74, 33, 117, 55, 47, 120, 105, 54, 125, 204, 197, 80)
df <- data.frame(tanggal,kasus,sembuh,meninggal)

# dataframe disimpan menjadi file variabel global
save(df, file="#pathfile#/latihan1.Rdata")

# membuat file csv dari dataframe
write.csv(df,"#pathfile#/lkp1pcd.csv",row.names = FALSE)

# membaca dataframe csv
data = read.csv("#pathfile#/lkp1pcd.csv",header= TRUE,sep = ",")
       
  
# Line Chart          
g_range <- range(0,data$kasus,data$sembuh,data$meninggal)
plot(data$kasus,type = "o",col="blue",ylim=g_range,axes= FALSE,ann = FALSE)
axis(1, at=1:12,lab=data$tanggal)
axis(2, las=1, at=1000*0:g_range[2])
lines(data$sembuh,type="o",pch=22,lyt=2,col="red")
lines(data$meninggal,type="o",pch=22,lyt=2,col="orange")

title(main="COVID-19 Di DKI Jakarta Pada 10 - 21 Juli 2021", col.main="black",font.main=2)
title(xlab="Tanggal",col.lab=rgb(0,0.5,0))
title(ylab="Jumlah",col.lab=rgb(0,0.5,0))

legend(9,g_range[2]-1,c("Kasus","Sembuh","Meninggal"),cex=0.8,col=c("blue","red","orange"),pch=21:22,lty=1:1)


# Histogram
angka <- data.frame(data$kasus,data$sembuh,data$meninggal)
angka_t <- t(angka)

barplot(as.matrix(angka_t),main = "COVID-19 Di DKI Jakarta Pada 10 - 21 Juli 2021",names.arg = data$tanggal,xlab="Tanggal",ylab ="Jumlah",beside = TRUE,col = rainbow(3))
legend("topright", c("Kasus","Sembuh","Meninnggal"),cex = 0.6, bty ="n",fill=rainbow(3))