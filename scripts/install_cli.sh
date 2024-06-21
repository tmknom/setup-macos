#!/usr/bin/env bash
#
# HomebrewによるCLIツールのインストール

set -eu -o pipefail

# Homebrewがインストールされているかチェック
if ! command -v brew >/dev/null 2>&1; then
  message_command="make install-homebrew"
  printf "Not found brew, run following command:\n\n  \033[31m%s\033[0m\n" "${message_command}" >&2
  exit 1
fi

# 基本ツールのインストール
brew install git
brew install make
brew install tree
brew install jq
brew install tmux

# GitHub CLIのインストール
# https://cli.github.com/
brew install gh

# Goのインストール
brew install go

# gomplateのインストール
# gomplateはGo製のテンプレートエンジン
# https://docs.gomplate.ca/
brew install gomplate

# asdfのインストール
# asdfはTerraformなどさまざまなCLIツールを複数バージョン管理
# https://github.com/asdf-vm/asdf
# brew install asdf

# direnvのインストール
# ディレクトリごとに環境変数を切り替え
# https://github.com/direnv/direnv
brew install direnv

# pecoのインストール
# コマンドライン上でインタラクティブなフィルタリングを実現
# https://github.com/peco/peco
# brew install peco

# fzfのインストール
# コマンドライン上でインタラクティブなフィルタリングを実現
# pecoと同等のツールだがプレビュー機能がついている
brew install fzf
"$(brew --prefix)"/opt/fzf/install --all --no-update-rc

# カラフルなlsコマンド
# エイリアスでlsと差し替えて使用する
# https://github.com/ogham/exa
brew install exa

# カラフルなcatコマンド
# エイリアスでcatと差し替えて使用する
# https://github.com/sharkdp/bat
brew install bat

# git diffを見やすくする
# https://github.com/dandavison/delta
brew install git-delta

# カラフルなgrep
# rgコマンドで使える
# https://github.com/BurntSushi/ripgrep
brew install ripgrep

# カラフルなfind
# https://github.com/sharkdp/fd
brew install fd

# カラフルなps
# https://github.com/dalance/procs
brew install procs

# 直感的に使えるsed
# https://github.com/chmln/sd
brew install sd

# カラフルなhexdump
# https://github.com/sharkdp/hexyl
brew install hexyl

# 便利なwc
# ディレクトリ配下のコードのファイル数や行数を表示する
# https://github.com/XAMPPRocky/tokei
brew install tokei

# 便利なman
# https://github.com/tldr-pages/tldr
brew install tldr

# スニペット管理ツール
# fzfを自動認識してくれるので、fzfを先にインストールすること
# https://github.com/knqyf263/pet
brew install knqyf263/pet/pet

# GnuPG
# asdf経由でnodejsをインストールするために必要
# https://github.com/asdf-vm/asdf-nodejs
brew install gpg

printf "\n\033[32mInstalled CLI tools.\033[0m\n"
