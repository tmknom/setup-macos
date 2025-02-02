# setup-macos

macOSインストール直後に実行する初期化スクリプト

## ツールのインストール

cloneしてmakeコマンドを実行する。
なおHomebrewインストール時に、パスワードとエンターキー入力を求められるので注意。

```shell
git clone https://github.com/tmknom/setup-macos.git ~/code/setup-macos
cd ~/code/setup-macos
make install-homebrew
make install-cli
make install-asdf
make install-cask
make install-zinit
```

## SSH鍵の作成

次のコマンドを実行するとSSH鍵が生成され、公開鍵がクリップボードへコピーされる。

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/tmknom/setup-macos/main/init.sh)"
```
