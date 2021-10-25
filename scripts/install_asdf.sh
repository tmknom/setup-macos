#!/usr/bin/env bash
#
# asdfによるCLIツールのインストール

set -eu -o pipefail

# Homebrewがインストールされているかチェック
if ! command -v brew >/dev/null 2>&1; then
  brew_message_command="make install-homebrew"
  printf "Not found brew, run following command:\n\n  \033[31m%s\033[0m\n" "${brew_message_command}" >&2
  exit 1
fi

# asdfがインストールされているかチェック
if ! command -v asdf >/dev/null 2>&1; then
  asdf_message_command="make install-cli"
  printf "Not found asdf, run following command:\n\n  \033[31m%s\033[0m\n" "${asdf_message_command}" >&2
  exit 1
fi

# 念のためasdfを最新化
echo "Run brew upgrade asdf..."
brew upgrade asdf

# プラグインを最新化
asdf plugin update --all

# Terraformのインストール
echo "Run asdf install terraform..."
if ! command -v terraform >/dev/null 2>&1; then
  asdf plugin add terraform https://github.com/Banno/asdf-hashicorp.git
fi
asdf install terraform latest
asdf global terraform latest

# AWS CLIのインストール
echo "Run asdf install awscli..."
if ! command -v aws >/dev/null 2>&1; then
  asdf plugin add awscli https://github.com/MetricMike/asdf-awscli.git
fi
asdf install awscli latest
asdf global awscli latest

# Node.jsのインストール
echo "Run asdf install nodejs..."
asdf install nodejs latest
asdf global nodejs latest

printf "\n\033[32mInstalled CLI tools by asdf.\033[0m\n"
