# Instal Package Terlebih dahulu

install.packages("ggplot2")
installed.packages("BSDA")
library(ggplot2)
library(BSDA)

# Soal No 1

# 1 a

# Data Responden Sebelum Melakukan Aktivitas
sebelum <- c(78, 75, 67, 77, 70, 72, 78, 74, 77)

# Data Responden Sesudah Melakukan Aktivitas
sesudah <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)

# Standar Deviasi Data selisih pengamatan
selisih = sesudah - sebelum
sdev <- sd(selisih)
sdev

# 1 b

# Mencari nilai t (p-value)
t.test(sebelum, sesudah, paired=TRUE)


# Soal No 2

# 2 b
tsum.test(
  mean.x = 23500,
  s.x = 3900,
  n.x = 100,
  mu = 20000,
  alternative = "greater",
  var.equal = TRUE
)


# Soal No 3
bandung <- list("saham" = 19, "mean" = 3.64, "sd" = 1.67)
bali <- list("saham" = 27, "mean" = 2.79, "sd" = 1.32)

# 3 b
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

# 3 c
install.packages("mosaic")
library(mosaic)

plotDist(dist = 't', df = 2, col = "blue")

# 3 d
qchisq(p = 0.05, df = 2, lower.tail = FALSE)


# Soal No 4
datatable <- read.table(url("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt"),header = TRUE, check.names = TRUE)
byGroup <- split(datatable, datatable$Group)
group1 <- byGroup$`1`
group2 <- byGroup$`2`
group3 <- byGroup$`3`

#4a
hist(group1$Length, xlim = c(16, 20))
hist(group2$Length, xlim = c(16, 20))
hist(group3$Length, xlim = c(16, 20))

#4b
bartlett.test(datatable$Length, datatable$Group)

#4c
model1 <- lm(datatable$Length~datatable$Group)
summary(model1)

#4e
av <- aov(Length ~ factor(Group), data = datatable)
TukeyHSD(av)

#4f
ggplot(datatable, mapping = aes(x = Group, y = Length, group = 1)) +  geom_boxplot()

# Soal No 5

# 5 a 
install.packages("multcompView")
library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)

GTL <- read_csv("GTL.csv")
head(GTL)

str(GTL)

qplot(x = Temp, y = Light, geom = "point", data = GTL) + facet_grid(.~Glass, labeller = label_both)

# 5 b
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)

anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)

# 5 c
summary <- group_by(GTL, Glass, Temp) %>%
  summarise(mean = mean(Light), sd = sd(Light)) %>%
  arrange(desc(mean))
print(summary)

# 5 d
tukey <- TukeyHSD(anova)
print(tukey)

# 5 e

tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)

cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
summary$Tukey <- cld$Letters
print(summary)

write.csv("GTLSummary.csv")

