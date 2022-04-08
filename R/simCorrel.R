d = read.table("https://raw.githubusercontent.com/qikushu/stat/master/R/correlMatrixBySubject.txt", comment.char="#", head=T, row.names = "教科", fileEncoding = "UTF-8-BOM")

#install.packages("mvtnorm")
library(mvtnorm)

#X1～X5の平均値
m <- c(60, 60, 60, 60, 60)
sigma = as.matrix(d)
colnames(sigma) = c()
rownames(sigma) = c()
y <- rmvnorm(100, m, sigma*300, method = "chol") 

# 100点を超えた場合は100点にする
y[y > 100] = 100
# マイナス点になった場合は0店にする
y[y < 0] = 0

library(rgl)
y2 = y[,c("Japanese","Math", "Science")]
plot3d(y2)

