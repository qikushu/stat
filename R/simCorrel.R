d = read.table("https://raw.githubusercontent.com/qikushu/stat/master/R/correlMatrixBySubject.txt", comment.char="#", head=T, row.names = "Subject", fileEncoding = "UTF-8-BOM")

#install.packages("mvtnorm")
library(mvtnorm)

#X1～X5の平均値
m <- c(60, 60, 60, 60, 60)
sigma = as.matrix(d)
colnames(sigma) = c()
rownames(sigma) = c()
y <- rmvnorm(100, m, sigma*300, method = "chol")
colnames(y)=colnames(d)

# 100点を超えた場合は100点にする
y[y > 100] = 100
# マイナス点になった場合は0店にする
y[y < 0] = 0

# 国語数学理科の三次元データでデモンストレーションする
y2 = y[,c("Japanese","Math", "Science")]
#平均点作成
meanScore = apply(y2, 1, mean)
y3 = as.data.frame(cbind(y2,meanScore))
#平均点でソート
y4 = y3[order(y3$meanScore),]
#色のグラデーション作成
rainbowColor = heat.colors(nrow(y4))
y5 = as.data.frame(cbind(y4,rainbowColor))

#一次元データ
# 解釈させる
scoreMath = y5$Math
scoreScience = y5$Science
scoreJapanese = y5$Japanese

# 数学の分布
plot(scoreMath, rnorm(nrow(y5)), xlab = "Math", ylab="dummy", col=y5$rainbowColor, pch=20)
# 理科の分布
plot(scoreScience, rnorm(nrow(y5)), xlab = "Science", ylab="dummy", col=y5$rainbowColor, pch=20)
# 国語の分布
plot(scoreJapanese, rnorm(nrow(y5)), xlab = "Japanese", ylab="dummy", col=y5$rainbowColor, pch=20)

# 二次元データ
# 数学と国語
plot(y5$Math, y5$Japanese, xlab = "Math", ylab="Japanese", col=y5$rainbowColor, pch=20)
# 数学と理科
plot(y5$Math, y5$Science, xlab = "Math", ylab="Science", col=y5$rainbowColor, pch=20)

# 三次元plot
library(rgl)
plot3d(y5, col=y5$rainbowColor)


##############
# 主成分分析
rpca=prcomp(x=y4,scale=T)
# 第1主成分
PC1 = rpca$x[,1]
# 第2主成分
PC2 = rpca$x[,2]
# 第3主成分
PC3 = rpca$x[,3]
# 三次元プロット
pcaRotated= as.data.frame(cbind(PC1, PC2, PC3,rainbowColor))
plot3d(pcaRotated, col=pcaRotated$rainbowColor)

# 第一主成分と各教科の得点の関係
plot(PC1, scoreMath)
cor(PC1, scoreMath)
plot(PC1, scoreScience)
cor(PC1, scoreScience)
plot(PC1, scoreJapanese)
cor(PC1, scoreJapanese)

# 第二主成分と各教科の得点の関係
plot(PC2, scoreMath)
cor(PC2, scoreMath)
plot(PC2, scoreScience)
cor(PC2, scoreScience)
plot(PC2, scoreJapanese)
cor(PC2, scoreJapanese)

# 第一主成分、第二主成分、第三主成分のあいだには相関があるか
# 第一主成分と第二主成分
plot(PC1, PC2)
cor(PC1, PC2)
# 第二主成分と第三主成分
plot(PC2, PC3)
cor(PC2, PC3)
# 第三主成分と第一主成分
plot(PC3, PC1)
cor(PC3, PC1)






