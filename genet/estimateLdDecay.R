estimateLdDecay <- function(ldTable) {

# "distance" "r" "Dprime"
# "result" 8944804 0.0933315445176935 0.315024497190643
# "result1" 450147 0.253864390875367 0.525368634255667
# "result2" 174375 0.110575582160716 0.435299218106041
# "result3" 2497131 0.0995196698063984 0.103400377258413


	resultout = ldTable
	distance = resultout$distance
	LD.data = resultout$r
	n=length(distance)

	# Sved (1971)
	LD.nonlinear = nls(LD.data~(1/(1+C*distance)), start= c(C=0.1), control = nls.control (maxiter=100, warnOnly=T))
	summ<-summary(LD.nonlinear)
	param<-summ$parameters
	Cest<-param["C","Estimate"]
	fpoints<-(1/(1+ Cest *distance))

	pdf("SvedLDPlot.pdf")
	plot(distance, LD.data, pch=".", ylim=c(0,1))
	par(new=T)
	plot(distance, fpoints, pch="." , ylim=c(0,1), col="red")
	dev.off()

	#LDが半減するときの期待距離を求める
	df<-data.frame(distance,fpoints)
	maxld<-max(fpoints)
	#You could eleucubrate if it's better to use the maximum ESTIMATED value of LD
	#In that case you just set: maxld<-max(fpoints) 
	h.decay<-maxld/2
	half.decay.distance<-df$distance[which.min(abs(df$fpoints-h.decay))]
	print("half.decay.distance")
	print(half.decay.distance)

	# HW (1988)
	HW.st<-c(C=0.1)
	HW.nonlinear<-nls(LD.data~((10+C*distance)/((2+C*distance)*(11+C*distance)))*(1+((3+C*distance)*(12+12*C*distance+(C*distance)^2))/(n*(2+C*distance)*(11+C*distance))),start=HW.st,control=nls.control(maxiter=100))
	tt<-summary(HW.nonlinear)
	new.rho<-tt$parameters[1]
	fpointsHW<-((10+new.rho*distance)/((2+new.rho*distance)*(11+new.rho*distance)))*(1+((3+new.rho*distance)*(12+12*new.rho*distance+(new.rho*distance)^2))/(n*(2+new.rho*distance)*(11+new.rho*distance)))

	# plot
	pdf("HillWeirLDPlot.pdf")
	plot(distance, LD.data, pch=".", ylim=c(0,1))
	par(new=T)
	plot(distance, fpointsHW, pch="." , ylim=c(0,1), col="blue")
	dev.off()

	#LDが半減するときの期待距離を求める
	dfHW<-data.frame(distance,fpointsHW)
	maxldHW<-max(fpointsHW)
	h.decayHW<-maxldHW/2
	half.decay.distanceHW<-dfHW$distance[which.min(abs(dfHW$fpointsHW-h.decayHW))]
	print("half.decay.distanceHW")
	print(half.decay.distanceHW)

}
