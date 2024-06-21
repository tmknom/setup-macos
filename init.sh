#!/usr/bin/env bash
#
# macOSインストール直後に実行するスクリプト

# SSH鍵の作成
echo 'パスフレーズを忘れずに！'
ssh-keygen -t ed25519 -C "github@example.com"

# GitHubへアクセスするための最低限の設定
cat <<'EOL' >> ~/.ssh/config
Host github.com
  HostName github.com
  IdentityFile ~/.ssh/id_rsa
  User git
EOL

# クリップボードに公開鍵をコピー
pbcopy < ~/.ssh/id_rsa.pub
echo 'クリップボードに公開鍵をコピー！'
