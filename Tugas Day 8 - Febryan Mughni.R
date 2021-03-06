### Tugas Day 8 ###

library (caret)

house_price <- read.csv('D:/Data Science/Bootcamp Data Science Dibimbing.id/Dataset/train.csv')
head(house_price)
View(house_price)

# 1.  Missing Value 
is.na(house_price$LotFrontage)
View(colSums(is.na(house_price)))
View(house_price)

# Saya akan menghilangkan missing value pada kolom LotFrontage sebanyak 259

logic_filter <- is.na(house_price$LotFrontage)
house_price <- house_price[!logic_filter,]
View(colSums(is.na(house_price)))


# Variable LotFrontage sudah hilang


# 2. Melakukan Normalization pada Variable 'LotFrontage'

house_price['LotFrontage']
boxplot(house_price['LotFrontage'])

# Normalization
norm_scaler <- preProcess(house_price['LotFrontage'], method = c('range'))
predict(norm_scaler, house_price['LotFrontage'])

house_price['LotFrontage_norm'] <- predict(norm_scaler, house_price['LotFrontage'])
boxplot(house_price['LotFrontage_norm'])

# Variable 'LotFrontage' sudah di Normalization

# 3. Data Transformation 

Sale_price <- house_price$SalePrice

hist(Sale_price)
hist(Sale_price[Sale_price<100000])
summary(Sale_price)

# Menggunakan Algoritma
log_Sale_price <- log(Sale_price)
house_price['log_Sale_price'] <- log_Sale_price
hist(log_Sale_price[(log_Sale_price > 11) & (log_Sale_price <= 13)])



summary(log_Sale_price)
sd(log_Sale_price)

# Boxcox 
lambda <- BoxCoxTrans(Sale_price)$lambda
boxcox_Sale_price <- (Sale_price ** -0.1 -1)/lambda
hist(boxcox_Sale_price)

summary(boxcox_Sale_price)
sd(boxcox_Sale_price)

# 4. Data Categorical Handling

# One-hot Encoding #

table(house_price$Neighborhood)

dummy <- dummyVars("~.", house_price['Neighborhood'])
dummy_var <- data.frame(predict(dummy, newdata = house_price['Neighborhood']))
View(dummy_var)

house_price <- cbind(house_price,dummy_var)
View(house_price)


# 5. Outlier Handling

Sale_price <- house_price$SalePrice
boxplot(Sale_price)

# IQR Method #

# get upper bound and lower bound 

q1 <- quantile(Sale_price,0.25)
q3 <- quantile(Sale_price,0.75)

iqr <- q3 - q1

upper_bound <- q3 + 1.5 * iqr
lower_bound <- q1 - 1.5 * iqr

filter_non_outlier <- (Sale_price > lower_bound & Sale_price < upper_bound)
filter_non_outlier

house_price[Sale_price>upper_bound,'SalePrice'] <- upper_bound
house_price[Sale_price<lower_bound,'SalePrice'] <- lower_bound
boxplot(house_price$SalePrice)

# Outlier telah hilang

View(house_price)

### Data Frame ###

df_house_price <- data.frame(house_price$LotFrontage, house_price$LotFrontage_norm,
                          house_price$SalePrice)
df_house_price
View(df_house_price)
 
### Comment ###

# Hasil logaritma pada data transformasi tidak bisa dimasukan ke dalam data frame
# Saya coba masukan ke data frame malah hasilnya tipe data boolean (?). 
# Sepertinya saya salah code Sehingga hasil Sale Price di data frame dan 
# code yang saya buat pada bagian 3 data transformation berbeda
# (Saya menggunakan data transformasi Algoritma). 

# one-hot encoding sudah saya buat pada bagian 4, namun saya bingung untuk memasukannya
# ke data frame. 



