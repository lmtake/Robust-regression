library(car)
data(Davis)#carのDavisデータを使用
head(Davis)
a <- lm(height~weight,data=Davis);a
plot(Davis$weight,Davis$height,xlab="重さ",ylab="高さ",ylim=c(100,250))

library(MASS)
b <- rlm(height~weight,data=Davis);b #ロバスト回帰
tx <- data.frame(weight=seq(40,160,l=100))
lines(tx$weight,predict(a,tx),col=2,lwd=1)
lines(tx$weight,predict(b,tx),col=4,lwd=3,lty=2)
#lwd = x:線分の幅 (line width) を番号で指定する。値が大きいほど太い線になる。
#lty=2 or "dashed" 線分の形式 (line type) をダッシュにする．
#col(color)の初期値は1
#番号は 1 から順に「黒，赤，緑，青，水色，紫，黄，灰」となっている．

c <- rlm(height~weight,data=Davis,psi="psi.bisquare");c #2重平方重み損失
lines(tx$weight,predict(c,tx),col=5,lwd=1)
