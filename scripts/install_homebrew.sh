#!/usr/bin/env bash
#
# Homebrew自体のインストール

set -eu -o pipefail

# 無限に入力を待たないよう注意喚起
message() {
  cat <<-'EOL'
Start install homebrew...

1. Input password
2. Press return key
3. Wait about ten minutes

EOL
} >&2

# brewコマンドが見つからなかったときだけHomebrewをインストール
# https://brew.sh/index_ja
if ! command -v brew >/dev/null 2>&1; then
  message
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/owner/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

printf "\n\033[32mInstalled Homebrew.\033[0m\n"
