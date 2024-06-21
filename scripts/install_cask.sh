#!/usr/bin/env bash
#
# HomebrewによるGUIツールのインストール

set -eu -o pipefail

# Homebrewがインストールされているかチェック
if ! command -v brew >/dev/null 2>&1; then
  message_command="make install-homebrew"
  printf "Not found brew, run following command:\n\n  \033[31m%s\033[0m\n" "${message_command}" >&2
  exit 1
fi

# Spectacleのインストール
# Spectacleはウィンドウサイズをキーボードでリサイズするためのツール
# brew install --cask spectacle

# Docker Desktopのインストール
# 更新頻度が高いため、念のためインストール済みの場合はスキップさせる
if ! command -v docker >/dev/null 2>&1; then
  brew install --cask docker
fi

# JetBrains Toolboxのインストール
# GoLandやIntelliJなどのIDEを集中管理するツール
# 更新頻度が高いため、念のためインストール済みの場合はスキップさせる
if [ ! -d "/Applications/JetBrains Toolbox.app" ]; then
  brew install --cask jetbrains-toolbox
fi

# Skitchのインストール
# Skitchは簡単なドローイングツールで画面キャプチャの加工などに使う
brew install --cask skitch

# Kindleのインストール
brew install --cask kindle

# iTerm2を見やすくするフォントをインストール
# https://koji.noshita.net/post/2021/0721-ricty-backtick/
# https://memo.koumei2.com/m1%E3%83%81%E3%83%83%E3%83%97%E3%81%AE-mac-mini-%E3%81%A7-ricty%E3%83%95%E3%82%A9%E3%83%B3%E3%83%88%E3%82%92%E4%BD%BF%E3%81%86/
brew install --cask fontforge
brew install --cask font-ricty-diminished

printf "\n\033[32mInstalled GUI tools.\033[0m\n"
