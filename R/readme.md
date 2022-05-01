## Rのソースファイルからコンパイルしたときのメモ
sudo apt install Rとかでいれると、管理者権限が必要になる。管理者だからいいけど、学生が自習するときに自分で入れたいものなどあるときがあるかもしれないので
ユーザーディレクトリにインストールするのも一つの考え方である。

Rのソースをダウンロードして、解凍してconfigure
```
./configure --prefix=$HOME/R --with-pcre1
```
pcreはサーバーにはpcre1,2, 3が入っているみたいで、うまくいかないので`--with-pcre1`を入れた。
うまくいったので
```
make
make install
```
した。

## あれあれ？pngが出力できない
Rにてcapabilities()関数で取り扱える画像ファイルのフォーマットを確認
PNGがFALSE, JPEGもFALSEだった

X11が働いていないなど、cairoが入っていないなど、よくわからない。

X11で見たいわけではないので、解決しそうにないけど、とりあえずやってみる

```
sudo apt-get install xvfb
sudo apt-get install libjpeg-dev
sudo apt install xorg-dev
```
其の後
Rのmakeでコケる
openjdkが11だったので17にあげたらmakeはうまくいった

capabilities()
PNG がFALSE

sudo apt install -y libpng-dev
# すでに入っていた

# これかな
sudo apt-get install -y libsdl-pango-dev

# 

