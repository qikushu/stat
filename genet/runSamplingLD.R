#install.packages('genetics', dependencies=T, repos = "http://cran.ism.ac.jp/")
#install.packages('vcfR', dependencies=T, repos = "http://cran.ism.ac.jp/")

library(genetics)
library(vcfR)
source("https://raw.githubusercontent.com/qikushu/stat/master/genet/samplingLD.R")
argnum=length(commandArgs())
args<-commandArgs()[5:argnum]
head1 = args[1]
vcffile = args[2]
chr = args[3]

print(head1)
# サンプリング開始
count=10000
maxdist = 10000000 #10 Mbp
VCFraw <- read.vcfR(vcffile)
glVCF <- vcfR2genlight(VCFraw)  # genlightオブジェクトの生成
chromBoolean = glVCF$chromosome == chr

mat1 = as.matrix(glVCF)  # 行列に変換
rm(VCFraw)
rm(glVCF)

gc(reset = TRUE)
gc(reset = TRUE)

resultout = data.frame(matrix(rep(NA, 3), nrow=1))[numeric(0), ]
colnames(resultout) = c("distance", "r2", "Dprime")

resultout = rbind(resultout, samplingLD(count=count, matSelected = mat1[,chromBoolean], maxdist= maxdist))
# output to file
outfilename = paste0("LDlist",chr,"_", head1, ".txt")
write.table(resultout, outfilename)

