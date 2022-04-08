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

library(rgl)
plot3d(y5, col=y5$rainbowColor))
