
# PRAKTIKUM PROBSTAT MODUL 2 KELAS A

Nama : Katarina Inezita Prambudi

NRP : 5025211148

Kelas : Probstat A


# PENJELASAN

### 1. Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat kembali kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas 𝐴 

![ScreenShot](https://raw.github.com/katarinainezita/Modul2_Probstat_5025211148/main/Screenshoot/Tabel1.jpg)


### Berdasarkan data pada tabel diatas, diketahui kadar saturasi oksigen  dari responden ke-3 ketika belum melakukan aktivitas 𝐴 sebanyak 67, dan setelah melakukan aktivitas 𝐴 sebanyak 70.

#### a. Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel diatas

Untuk mencari standar deviasi dari data selisih pasangan pengamatan 
```
selisih = sesudah - sebelum
sdev <- sd(selisih)
sdev
```

didapatkan hasil 6.359595

![ScreenShot](https://raw.github.com/katarinainezita/Modul2_Probstat_5025211148/main/Screenshoot/1A.jpg)

#### b. carilah nilai t (p-value)

Untuk mencari nilai t (p- value) menggunakan :
```
t.test(sebelum, sesudah, paired=TRUE)
```

didapatkan hasil seperti pada gambar dibawah ini 

![ScreenShot](https://raw.github.com/katarinainezita/Modul2_Probstat_5025211148/main/Screenshoot/1B.jpg)

#### c. tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴”

Apabila dilihat dari hasil p-value diatas yang menunjukkan hasil 0.00006003, angka ini menunjukkan hasil bahwa nilai p-value < nilai 𝛼. Hal ini berarti tolak H0 dan terima H1.
Dapat diambil kesimpulan bahwa terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas A.


### 2. (Hipotesa 1 sampel)
### Diketahui bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun. Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk mencatat jarak yang mereka tempuh. Jika sampel acak menunjukkan rata-rata 23.500 kilometer dan standar deviasi 3900 kilometer. (Kerjakan menggunakan library seperti referensi pada modul).

#### a. Apakah Anda setuju dengan klaim tersebut?

Apabila dilihat dari data distribusi normal, hasil menunjukkan daerah yang lebih pekat berada di daerah lebih dari 20.000 kilometer. Oleh karena itu, klaim yang menyatakan
bahwa rata-rata 23.500 kilometer dari sampel acak dengan standar deviasi 3900 kilometer, mungkin valid

#### b. Jelaskan maksud dari output yang dihasilkan!

Diketahui bahwa x (rata - rata sampel acak) adalah 23.500 kilometer, s(standar deviasi sampel acak) adalah 3900 kilometer, n(jumlah sampel acak) adalah 100, dan mu(rata rata) adalah 20.000 kilometer

untuk mengerjakan soal tersebut digunakan sebuah fungsi parameter yaitu tsum.test() sebagai berikut :

```
tsum.test(
  mean.x = 23500,
  s.x = 3900,
  n.x = 100,
  mu = 20000,
  alternative = "greater",
  var.equal = TRUE
)

```
didapatkan hasil seperti di bawah ini 

![ScreenShot](https://raw.github.com/katarinainezita/Modul2_Probstat_5025211148/main/Screenshoot/2B.jpg)

#### c. Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!

Karena nilai p-value yang didapatkan adalah p-value = 9.437e-15 atau kurang dari 𝛼, maka tolak H0 dan terima H1.
Kesimpulan yang dapat diambil adalah mobil dikemudikan rata - rata lebih dari 20.000 kilometer / tahun.


### 3. (Hipotesa 2 sampel)
### Diketahui perusahaan memiliki seorang data analyst ingin memecahkan permasalahan pengambilan keputusan dalam perusahaan tersebut. Selanjutnya didapatkanlah data berikut dari perusahaan saham tersebut.

![ScreenShot](https://raw.github.com/katarinainezita/Modul2_Probstat_5025211148/main/Screenshoot/Tabel3.jpg)

Dari data diatas berilah keputusan serta kesimpulan yang didapatkan dari hasil diatas. Asumsikan nilai variancenya sama, apakah ada perbedaan pada rata-ratanya (α= 0.05)? Buatlah :

#### a. H0 dan H1(3)

H0 : μ1 = μ2 (rata rata saham di Bandung sama dengan di Bali)
H1 : μ1 ≠ μ2 (rata rata saham di Bandung tidak sama dengan di Bali)



#### b. Hitung Sampel Statistik(3)

Untuk menghitung sampel statistik digunakan 
```
tsum.test(
  n.x = bandung$saham,
  n.y = bali$saham,
  mean.x = bandung$mean,
  mean.y = bali$mean,
  s.x = bandung$sd,
  s.y = bali$sd,
  var.equal = TRUE,
  alternative = "two.sided"
)
```

didapatkan hasil sebagai berikut 

![ScreenShot](https://raw.github.com/katarinainezita/Modul2_Probstat_5025211148/main/Screenshoot/3B.jpg)

#### c. Lakukan Uji Statistik (df =2)

Uji statistik dilakukan dengan menggunakan
```
install.packages("mosaic")
library(mosaic)

plotDist(dist = 't', df = 2, col = "blue")

```
didapatkan hasil seperti pada gambar dibawah

![ScreenShot](https://raw.github.com/katarinainezita/Modul2_Probstat_5025211148/main/Screenshoot/Rplot.png)

#### d. Nilai Kritikal

Nilai kritikal didapatkan dengan menggunakan

```
qchisq(p = 0.05, df = 2, lower.tail = FALSE)
```

didapatkan hasil 5.991465

#### e. Keputusan
Rata rata saham di bandung dan dibali tidak ada perbedaan

#### f. Kesimpulan
Rata rata saham di bandung dan dibali tidak ada perbedaan

### 4. (Anova satu arah)

### Seorang Peneliti sedang meneliti spesies dari kucing di ITS . Dalam penelitiannya ia mengumpulkan data  tiga spesies kucing yaitu kucing oren, kucing hitam dan kucing putih dengan panjangnya masing-masing.
### Jika : 

### diketahui dataset  https://intip.in/datasetprobstat1 
### H0 : Tidak ada perbedaan panjang antara ketiga spesies atau rata-rata panjangnya sama
### Maka Kerjakan atau Carilah:

#### a. Buatlah masing masing jenis spesies menjadi  3 subjek "Grup" (grup 1,grup 2,grup 3). Lalu Gambarkan plot kuantil normal untuk setiap kelompok dan lihat apakah ada outlier utama dalam homogenitas varians.

Untuk membaca data pada table digunakan :
```
datatable <- read.table(url("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt"),header = TRUE, check.names = TRUE)
```

Untuk membuat jenis spesies menjadi 3 subjek, digunakan :

```
byGroup <- split(datatable, datatable$Group)
group1 <- byGroup$`1`
group2 <- byGroup$`2`
group3 <- byGroup$`3`
```

Untuk menggambahkan histogram digunakan :
```
hist(group1$Length, xlim = c(16, 20))
hist(group2$Length, xlim = c(16, 20))
hist(group3$Length, xlim = c(16, 20))
```

didapatkan hasil

![ScreenShot](https://raw.github.com/katarinainezita/Modul2_Probstat_5025211148/main/Screenshoot/4a1.png)

![ScreenShot](https://raw.github.com/katarinainezita/Modul2_Probstat_5025211148/main/Screenshoot/4a2.png)

![ScreenShot](https://raw.github.com/katarinainezita/Modul2_Probstat_5025211148/main/Screenshoot/4a3.png)


#### b. carilah atau periksalah Homogeneity of variances nya , Berapa nilai p yang didapatkan? , Apa hipotesis dan kesimpulan yang dapat diambil ?

Untuk mencari Homogeneity of variancesnya digunakan

```
bartlett.test(datatable$Length, datatable$Group)
```

didapatkan hasil seperti di bawah ini 

![ScreenShot](https://raw.github.com/katarinainezita/Modul2_Probstat_5025211148/main/Screenshoot/4B.jpg)

#### c. Untuk uji ANOVA, buatlah model linier dengan Panjang versus Grup dan beri nama model tersebut model 1.

Untuk uji ANOVA digunakan  
```
model1 <- lm(datatable$Length~datatable$Group)
summary(model1)
```
didapatkan hasil seperti gambar dibawah ini 

![ScreenShot](https://raw.github.com/katarinainezita/Modul2_Probstat_5025211148/main/Screenshoot/4C1.jpg)

### d. Dari Hasil Poin C , Berapakah nilai-p ? ,  Apa yang dapat Anda simpulkan dari H0?

nilai p yang didapatkan adalah 0.6401 dan yang dapat disimpulkan adalah gagal terima H0 atau terima H0.

### e. Verifikasilah jawaban model 1 dengan Post-hooc test TukeyHSD ,  dari nilai p yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain? Jelaskan.

digunakan 

```
av <- aov(Length ~ factor(Group), data = datatable)
TukeyHSD(av)
```

dan didapatkan hasil seperti gambar dibawah

![ScreenShot](https://raw.github.com/katarinainezita/Modul2_Probstat_5025211148/main/Screenshoot/4E.jpg)


### f. Visualisasikan data dengan ggplot2

digunakan 

```
ggplot(datatable, mapping = aes(x = Group, y = Length, group = 1)) +  geom_boxplot()
```

dan didapatkan hasil seperti gambar dibawah

![ScreenShot](https://raw.github.com/katarinainezita/Modul2_Probstat_5025211148/main/Screenshoot/4f.png)

### 5. (Anova dua arah)
### Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk mengetahui pengaruh suhu operasi (100˚C, 125˚C dan 150˚C) dan tiga jenis kaca pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop. Percobaan dilakukan sebanyak 27 kali dan didapat data sebagai berikut: Data Hasil Eksperimen. Dengan data tersebut: 


#### a. Buatlah plot sederhana untuk visualisasi data

Untuk membuat plot sederhana untuk visualisasi data digunakan

```
install.packages("multcompView")
library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)

GTL <- read_csv("GTL.csv")
head(GTL)

str(GTL)

qplot(x = Temp, y = Light, geom = "point", data = GTL) + facet_grid(.~Glass, labeller = label_both)

```
didapatkan hasil seperti pada gambar dibawah

![ScreenShot](https://raw.github.com/katarinainezita/Modul2_Probstat_5025211148/main/Screenshoot/5a.png)


#### b. Lakukan uji ANOVA dua arah untuk 2 faktor

Untuk melakukan uji ANOVA dua arah digunakan 

```
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)

anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)
```

didapatkan hasil seperti dibawah ini

![ScreenShot](https://raw.github.com/katarinainezita/Modul2_Probstat_5025211148/main/Screenshoot/5B.jpg)


#### c. Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)

Untuk menampilkan table dengan mean dan standar deviasi digunakan

```
summary <- group_by(GTL, Glass, Temp) %>%
  summarise(mean = mean(Light), sd = sd(Light)) %>%
  arrange(desc(mean))
print(summary)
```

didapatkan hasil seperti gambar berikut

![ScreenShot](https://raw.github.com/katarinainezita/Modul2_Probstat_5025211148/main/Screenshoot/5C.jpg)


#### d. Lakukan uji Tukey

Untuk melakukan uji Tukey
```
tukey <- TukeyHSD(anova)
print(tukey)
```

didapatkan hasil seperti berikut

![ScreenShot](https://raw.github.com/katarinainezita/Modul2_Probstat_5025211148/main/Screenshoot/5D.jpg)
![ScreenShot](https://raw.github.com/katarinainezita/Modul2_Probstat_5025211148/main/Screenshoot/5D2.jpg)
![ScreenShot](https://raw.github.com/katarinainezita/Modul2_Probstat_5025211148/main/Screenshoot/5D3.jpg)

#### e. Gunakan compact letter display untuk menunjukkan perbedaan signifikan antara uji Anova dan uji Tukey

digunakan

```
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)

cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
summary$Tukey <- cld$Letters
print(summary)

write.csv("GTLSummary.csv")
```

didapatkan hasil

![ScreenShot](https://raw.github.com/katarinainezita/Modul2_Probstat_5025211148/main/Screenshoot/5E.jpg)







