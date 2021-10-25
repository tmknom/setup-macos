#!/usr/bin/env bash
#
# npmによるCLIツールのインストール

set -eu -o pipefail

# npmがインストールされているかチェック
if ! command -v npm >/dev/null 2>&1; then
  message_command="make install-asdf"
  printf "Not found npm, run following command:\n\n  \033[31m%s\033[0m\n" "${message_command}" >&2
  exit 1
fi

# https://github.com/commitizen/cz-cli
npm install -g commitizen

# https://github.com/commitizen/cz-conventional-changelog
npm install -g cz-conventional-changelog

# https://github.com/leoforfree/cz-customizable
npm install -g cz-customizable

printf "\n\033[32mInstalled CLI tools by npm.\033[0m\n"
