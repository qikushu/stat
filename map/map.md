```
library(maps)
pdf("japan.pdf")
map("japan", xlim=c(125,150), ylim=c(26,48), interior=FALSE)
map.axes()
dev.off()
```

```
library(maps)
pdf("kyushu.pdf")
map("japan", xlim=c(129,132.5), ylim=c(31,34), interior=FALSE)
map("japan", boundary = FALSE, lty = 2, add = TRUE, fill=T, col="lightgrey")
map.axes()
dev.off()
```

```
points(139.281152,35.3497989,col="red",pch=20)
text(139.281152,35.2497989,"Hadano",col="red")
```
