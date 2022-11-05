samplingLD = function(count, matSelected, maxdist) {

    library(genetics)
    # データフレームの初期化
    resultdf = data.frame(matrix(rep(NA, 3), nrow=1))[numeric(0), ]
    colnames(resultdf) = c("distance", "r", "Dprime")
    nindv = dim(matSelected)[2]

# markerの名前を取得 e.g. "S12_12483169"
marker = colnames(matSelected)
# _でsplitしてlistにする
markerList = strsplit(marker,"_")
# 染色体(chr)と位置 (pos)でそれぞれベクトルにて保存する 
chr = do.call(rbind, markerList)[,1]
pos = as.integer(do.call(rbind, markerList)[,2])
# locベクトルを作成
nmarker1 = length(pos)
loc = rep(1:nmarker1, by=1)

i=0
while (i<count) {

    # 1つ目のマーカーのベクトル上の位置を取得
    loc1 = sample(nmarker1,size=1)   # ベクトル上での位置をランダムに選択
    pos1 = pos[loc1]    # 染色体上での位置 
    marker1 = marker[loc1]  # マーカー名

    # 二つ目のマーカーを選択
    # プラスマイナスmaxdistの範囲に含まれるマーカーのみを選択
    # 染色体番号は考慮していないことに注意すること
    boolean = pos > pos1 - maxdist & pos < pos1 + maxdist
    matsub = matSelected[,boolean]
    possub = pos[boolean]
    locsub = loc[boolean]

    # subセットに対して処理する
    loc2 = sample(locsub,size=1)
    pos2 = pos[loc2]

    #intervalを計算
    posint = abs(pos1-pos2)
    if (posint == 0) next

    # 遺伝子型
    g1= genotype(as.genotype.allele.count(matSelected[,loc1]))
    if (length(levels(g1)) != 2) {   # 多型がなければやり直し
        next
    }
    g2= genotype(as.genotype.allele.count(matSelected[,loc2]))
    if (length(levels(g2)) != 2) {   # 多型がなければやり直し
        next
    }

    # LDの計算 
    LD.result = LD(g1,g2)
    result = c(posint, abs(LD.result$r), LD.result$`D'`)
    names(result) = c("distance", "r", "Dprime")
#print(pos1)
#print(pos2)
#print(posint)
#print(abs(LD.result$r))
#print(LD.result$`D'`)

     resultdf = rbind(resultdf, t(as.data.frame(result)))
        
     # Progress report
     if (i %% 100 == 0) {
        cat("Progress")
        print(i)
     }

     i = i + 1
}
    return(resultdf)
}
