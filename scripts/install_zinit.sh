#!/usr/bin/env bash
#
# zinitのインストール

set -eu -o pipefail

# Gitがインストールされているかチェック
if ! command -v git >/dev/null 2>&1; then
  message_command="make install-homebrew"
  printf "Not found git, run following command:\n\n  \033[31m%s\033[0m\n" "${message_command}" >&2
  exit 1
fi

# zinitが見つからなかったときだけインストール
if [ ! -d "${HOME}/.zinit" ]; then
  bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
fi

printf "\n\033[32mInstalled zinit.\033[0m\n"
