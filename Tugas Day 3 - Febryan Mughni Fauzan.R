## Homework ##

#1. Tim data scientist diminta pertolongan oleh CEO ingin meminta beberapa data terkait user.
#Sehingga tim data scientist diminta membuat data frame dari profil user tersebut. Silahkan buat
#data frame yang terdiri dari kolom berikut:
  #a. Nama
  #b. Tempat lahir
  #c. Tanggal lahir
  #d. Tanggal terakhir berbelanja
  #e. Rata-rata amount belanja per bulan (Rp)
  #f. Total transaksi per bulan
 
#Pertama, Input terlebih dahulu data-data berikut:

Nama <- c('Luffy', 'Itadori', 'Eren', 'Mikasa', 'Nami', 'Robin')
Tempat_Lahir <- c('Tenjo', 'Jasinga', 'Soreang', 'Kopo', 'Jayanti', 'Balaraja')
Tanggal_Lahir <- c('5 Mei', '10 Oktober', '28 April', '29 April', '3 Juli', '6 Februari')
Tanggal_terakhir_berbelanja <- c('29 Oktober', '24 Juli', '5 Januari', '25 Maret', '11 November', '30 Juni')
Rata.rata_amount_belanja.per.bulan <- c(60000, 50000, 100000, 100000, 150000, 125000)
Total_transaksi_per.bulan <- c(3, 2, 5, 6, 9, 8)

#Kedua, buat data frame berdasarkan klasifikasi dicara pertama
user <- data.frame(Nama, Tempat_Lahir, 
                   Tanggal_Lahir, Tanggal_terakhir_berbelanja, 
                   Rata.rata_amount_belanja.per.bulan, 
                   Total_transaksi_per.bulan)
user
View(user)

#2. Dari data frame tersebut pilihlah user yang paling loyal berbelanja. 
#Dimana user loyal adalah user yang memiliki rata-rata amount belanja per bulan di atas 100 ribu rupiah 
#DAN total transaksi per bulan di atas 5.

## NOTE ##
#User loyal adalah jika rata-rata amount belanja per bulan di atas 100rb rupiah 
#DAN Total transaksi per bulan di atas 5

#Ketiga, masukan logika DAN (&) pada user_loyal
user_loyal <- (Rata.rata_amount_belanja.per.bulan > 100000 & Total_transaksi_per.bulan > 5)
user_loyal

#Keempat, Setelah mengetahui siapa saja yang loyal. Masukan data tersebut 
#ke dalam table 

user$user_loyal <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE)
View(user)

#Dari tabel di atas, kita dapat mengetahui siapa user yang loyal.Yaitu: Nami dan Robin

user[5, c('Nama', 'user_loyal')]
user[6, c('Nama', 'user_loyal')]


## TAMBAHAN ##

#Saya akan menambahkan visualisasi pada Tugas ini

library(ggplot2)
user <- data.frame(Nama, Tempat_Lahir, 
                   Tanggal_Lahir, Tanggal_terakhir_berbelanja, 
                   Rata.rata_amount_belanja.per.bulan, 
                   Total_transaksi_per.bulan)
user

grafik <- ggplot(user, aes(x = Nama, y = Rata.rata_amount_belanja.per.bulan)) +
  geom_bar(aes(fill = Nama), stat = "identity", color = "white") + 
  ylab("Rata-rata Amount Belanja/Bulan") + 
  xlab("Nama") 
grafik

## Dari grafik ini dapat dilihat bahwa rata-rata belanja / bulan 
# paling banyak adalah Nami dengan 150000 dan transaksi 9
