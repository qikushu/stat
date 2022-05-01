## R 4.2 のソースファイルからコンパイルしたときのメモ
ubuntu linuxにて、`sudo apt install R`でいれると、Rのバージョンが古く、使いたいライブラリーが使用できない場合がある。またその都度管理者権限が必要になる。私は管理者だからいいけど、学生が自習するときに自分で入れたいものなどあるかもしれないので、ユーザーディレクトリにインストールする必要性にかられた。また、いま動いているものを変に動かして、動かなくなったりするのも問題だから、ソースコンパイルしてディレクトリごとに管理できるようになると、慎重に対処できるようになる。

Rのソースをダウンロードして、解凍してconfigure
```
./configure --prefix=$HOME/R --with-pcre1
```
pcreはサーバーにはpcre1,2, 3が入っているみたいだが、うまくいかなかったので、こうした。
```
make
make install
```
これならうまくいった。

## あれあれ？pngが出力できない
Rにてcapabilities()関数で取り扱える画像ファイルのフォーマットを確認
PNGがFALSE, JPEGもFALSEだった。すでに過去のことなので、画面は覚えていない。


過去に同じトラブルが起きたときに、cairoという仮想デバイス関係をいじったかな、と思ったのでいろいろググってみたが、
R 4.1以前はX11のサポートでcairoは動くんだけど、4.2はいらないよ、と書いてあった。
X関係はよく知らないが、関係ありそうなライブラリーをインストール。

```
sudo apt-get install xvfb
sudo apt install xorg-dev
./configure --prefix=$HOME/R --with-pcre1
make
```
makeでコケる。エラーメッセージをググると、java関係のエラー。openjdkが11だったので17にあげたらmakeはうまくいった。
makeをしたディレクトリのbinディレクトリの中のRを起動してから、`capabilities()`を実行した。
```
PNG FALSE
```
まだまだうまくいかない。`libpng`が入っていないケースもあるとのこと。
```
sudo apt install -y libpng-dev
```
すでに入っていた。`libsdl-pango-dev`も必要とのこと
```
sudo apt-get install -y libsdl-pango-dev
./configure --prefix=$HOME/R --with-pcre1
make
```
makeは成功。Rを起動
```
capabilities()
       jpeg         png        tiff       tcltk         X11        aqua 
       TRUE        TRUE        TRUE       FALSE       FALSE       FALSE 
   http/ftp     sockets      libxml        fifo      cledit       iconv 
       TRUE        TRUE       FALSE        TRUE        TRUE        TRUE 
        NLS       Rprof     profmem       cairo         ICU long.double 
       TRUE        TRUE       FALSE        TRUE        TRUE        TRUE 
    libcurl 
       TRUE 

# おお、うまくいったのかな
png("aa.png")
plot(iris)
dev.off()
```
となり、うまくいったと思います

