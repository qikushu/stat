#install.packages('genetics', dependencies=T, repos = "http://cran.ism.ac.jp/")
#install.packages('vcfR', dependencies=T, repos = "http://cran.ism.ac.jp/")

library(genetics)
library(vcfR)
source("https://raw.githubusercontent.com/qikushu/stat/master/genet/samplingLD.R")
argnum=length(commandArgs())
args<-commandArgs()[5:argnum]
head1 = args[1]

print(head1)
# サンプリング開始
count=10000
maxdist = 10000000 #10 Mbp
chr="chr01"
VCFraw <- read.vcfR("myccnip2_chr01_cleaned_snps.vcf.gz")
glVCF <- vcfR2genlight(VCFraw)  # genlightオブジェクトの生成
mat1 = as.matrix(glVCF)  # 行列に変換
resultout = data.frame(matrix(rep(NA, 3), nrow=1))[numeric(0), ]
colnames(resultout) = c("distance", "r", "Dprime")

resultout = rbind(resultout, samplingLD(count=count, matSelected = mat1[,glVCF$chromosome == chr], maxdist= maxdist))
# output to file
outfilename = paste0("LDlist",chr,"_", head1, ".txt")
write.table(resultout, outfilename)

chr="chr02"
VCFraw <- read.vcfR("myccnip2_chr02_cleaned_snps.vcf.gz")
glVCF <- vcfR2genlight(VCFraw)  # genlightオブジェクトの生成
mat1 = as.matrix(glVCF)  # 行列に変換
resultout = data.frame(matrix(rep(NA, 3), nrow=1))[numeric(0), ]
colnames(resultout) = c("distance", "r", "Dprime")


resultout = rbind(resultout, samplingLD(count=count, matSelected = mat1[,glVCF$chromosome == chr], maxdist= maxdist))
# output to file
outfilename = paste0("LDlist",chr,"_", head1, ".txt")
write.table(resultout, outfilename)

chr="chr03"
VCFraw <- read.vcfR("myccnip2_chr03_cleaned_snps.vcf.gz")
glVCF <- vcfR2genlight(VCFraw)  # genlightオブジェクトの生成
mat1 = as.matrix(glVCF)  # 行列に変換
resultout = data.frame(matrix(rep(NA, 3), nrow=1))[numeric(0), ]
colnames(resultout) = c("distance", "r", "Dprime")


resultout = rbind(resultout, samplingLD(count=count, matSelected = mat1[,glVCF$chromosome == chr], maxdist= maxdist))
# output to file
outfilename = paste0("LDlist",chr,"_", head1, ".txt")
write.table(resultout, outfilename)

chr="chr04"
VCFraw <- read.vcfR("myccnip2_chr04_cleaned_snps.vcf.gz")
glVCF <- vcfR2genlight(VCFraw)  # genlightオブジェクトの生成
mat1 = as.matrix(glVCF)  # 行列に変換
resultout = data.frame(matrix(rep(NA, 3), nrow=1))[numeric(0), ]
colnames(resultout) = c("distance", "r", "Dprime")

resultout = rbind(resultout, samplingLD(count=count, matSelected = mat1[,glVCF$chromosome == chr], maxdist= maxdist))
# output to file
outfilename = paste0("LDlist",chr,"_", head1, ".txt")
write.table(resultout, outfilename)

chr="chr05"
VCFraw <- read.vcfR("myccnip2_chr05_cleaned_snps.vcf.gz")
glVCF <- vcfR2genlight(VCFraw)  # genlightオブジェクトの生成
mat1 = as.matrix(glVCF)  # 行列に変換
resultout = data.frame(matrix(rep(NA, 3), nrow=1))[numeric(0), ]
colnames(resultout) = c("distance", "r", "Dprime")
resultout = rbind(resultout, samplingLD(count=count, matSelected = mat1[,glVCF$chromosome == chr], maxdist= maxdist))
# output to file
outfilename = paste0("LDlist",chr,"_", head1, ".txt")
write.table(resultout, outfilename)

chr="chr06"
VCFraw <- read.vcfR("myccnip2_chr06_cleaned_snps.vcf.gz")
glVCF <- vcfR2genlight(VCFraw)  # genlightオブジェクトの生成
mat1 = as.matrix(glVCF)  # 行列に変換
resultout = data.frame(matrix(rep(NA, 3), nrow=1))[numeric(0), ]
colnames(resultout) = c("distance", "r", "Dprime")
resultout = rbind(resultout, samplingLD(count=count, matSelected = mat1[,glVCF$chromosome == chr], maxdist= maxdist))
# output to file
outfilename = paste0("LDlist",chr,"_", head1, ".txt")
write.table(resultout, outfilename)

chr="chr07"
VCFraw <- read.vcfR("myccnip2_chr07_cleaned_snps.vcf.gz")
glVCF <- vcfR2genlight(VCFraw)  # genlightオブジェクトの生成
mat1 = as.matrix(glVCF)  # 行列に変換
resultout = data.frame(matrix(rep(NA, 3), nrow=1))[numeric(0), ]
colnames(resultout) = c("distance", "r", "Dprime")
resultout = rbind(resultout, samplingLD(count=count, matSelected = mat1[,glVCF$chromosome == chr], maxdist= maxdist))
# output to file
outfilename = paste0("LDlist",chr,"_", head1, ".txt")
write.table(resultout, outfilename)

chr="chr08"
VCFraw <- read.vcfR("myccnip2_chr08_cleaned_snps.vcf.gz")
glVCF <- vcfR2genlight(VCFraw)  # genlightオブジェクトの生成
mat1 = as.matrix(glVCF)  # 行列に変換
resultout = data.frame(matrix(rep(NA, 3), nrow=1))[numeric(0), ]
colnames(resultout) = c("distance", "r", "Dprime")
resultout = rbind(resultout, samplingLD(count=count, matSelected = mat1[,glVCF$chromosome == chr], maxdist= maxdist))
# output to file
outfilename = paste0("LDlist",chr,"_", head1, ".txt")
write.table(resultout, outfilename)

chr="chr09"
VCFraw <- read.vcfR("myccnip2_chr09_cleaned_snps.vcf.gz")
glVCF <- vcfR2genlight(VCFraw)  # genlightオブジェクトの生成
mat1 = as.matrix(glVCF)  # 行列に変換
resultout = data.frame(matrix(rep(NA, 3), nrow=1))[numeric(0), ]
colnames(resultout) = c("distance", "r", "Dprime")
resultout = rbind(resultout, samplingLD(count=count, matSelected = mat1[,glVCF$chromosome == chr], maxdist= maxdist))
# output to file
outfilename = paste0("LDlist",chr,"_", head1, ".txt")
write.table(resultout, outfilename)

chr="chr10"
VCFraw <- read.vcfR("myccnip2_chr10_cleaned_snps.vcf.gz")
glVCF <- vcfR2genlight(VCFraw)  # genlightオブジェクトの生成
mat1 = as.matrix(glVCF)  # 行列に変換
resultout = data.frame(matrix(rep(NA, 3), nrow=1))[numeric(0), ]
colnames(resultout) = c("distance", "r", "Dprime")
resultout = rbind(resultout, samplingLD(count=count, matSelected = mat1[,glVCF$chromosome == chr], maxdist= maxdist))
# output to file
outfilename = paste0("LDlist",chr,"_", head1, ".txt")
write.table(resultout, outfilename)

chr="chr11"
VCFraw <- read.vcfR("myccnip2_chr11_cleaned_snps.vcf.gz")
glVCF <- vcfR2genlight(VCFraw)  # genlightオブジェクトの生成
mat1 = as.matrix(glVCF)  # 行列に変換
resultout = data.frame(matrix(rep(NA, 3), nrow=1))[numeric(0), ]
colnames(resultout) = c("distance", "r", "Dprime")
resultout = rbind(resultout, samplingLD(count=count, matSelected = mat1[,glVCF$chromosome == chr], maxdist= maxdist))
# output to file
outfilename = paste0("LDlist",chr,"_", head1, ".txt")
write.table(resultout, outfilename)

chr="chr12"
VCFraw <- read.vcfR("myccnip2_chr12_cleaned_snps.vcf.gz")
glVCF <- vcfR2genlight(VCFraw)  # genlightオブジェクトの生成
mat1 = as.matrix(glVCF)  # 行列に変換
resultout = data.frame(matrix(rep(NA, 3), nrow=1))[numeric(0), ]
colnames(resultout) = c("distance", "r", "Dprime")
resultout = rbind(resultout, samplingLD(count=count, matSelected = mat1[,glVCF$chromosome == chr], maxdist= maxdist))
# output to file
outfilename = paste0("LDlist",chr,"_", head1, ".txt")
write.table(resultout, outfilename)
