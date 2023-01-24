
# Buat tabel / dataframe
tanggal <- c ("10 Juli" , "11 Juli", "12 Juli", "13 Juli", "14 Juli", "15 Juli", "16 Juli", "17 Juli", "18 Juli", "19 Juli", "20 Juli", "21 Juli")
kasus <- c (10397, 10481, 11743, 9648, 10206, 10264, 9952, 8127, 7251, 3997, 4939, 4766)
sembuh <- c (13468, 16452, 16413, 3648, 2427, 2409, 6766, 9355, 9453, 10157, 9777, 8366)
meninggal <- c (74, 33, 117, 55, 47, 120, 105, 54, 125, 204, 197, 80)
df <- data.frame(tanggal,kasus,sembuh,meninggal)

# dataframe disimpan menjadi file variabel global
save(df, file="D:/Fakhri/Kuliah/Jadwal dan Materi Kuliah/Tahun Ketiga/Semester 6/PCD/P1/Praktikum/latihan1.Rdata")

# membuat file csv dari dataframe
write.csv(df,"D:/Fakhri/Kuliah/Jadwal dan Materi Kuliah/Tahun Ketiga/Semester 6/PCD/P1/Praktikum/lkp1pcd.csv", row.names = FALSE)

# membaca dataframe csv
data = read.csv("D:/Fakhri/Kuliah/Jadwal dan Materi Kuliah/Tahun Ketiga/Semester 6/PCD/P1/Praktikum/lkp1pcd.csv", header= TRUE, sep = ",")

# mengambil / mengekstrak nilai dari kolom tertentu pada dataframe
tanggal <- data.frame(data$tanggal)
kasus <- data.frame(data$kasus)
sembuh <- data.frame(data$sembuh)
meninggal <- data.frame(data$meninggal)

         
               
g_range <- range(0,data$kasus,data$sembuh,data$meninggal)
plot(data$meninggal,type = "o",col="blue",ylim=g_range,axes= FALSE,ann = FALSE)
axis(1, at=1:12,lab=data$tanggal)
axis(2, las=1, at=1000*0:g_range[2])
