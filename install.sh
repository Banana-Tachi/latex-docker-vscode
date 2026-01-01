#!/bin/bash

# エラーが発生したら停止
set -e

echo "🚀 LaTeX Docker 環境のセットアップを開始します..."

echo "📝 .env ファイルを生成中..."
cat <<EOF > .env
UID=$(id -u)
GID=$(id -g)
CONTAINER_NAME=texlive
HOST_NAME=texlive
SERVICE_NAME=mylatex
VERSION=1.0.0
EOF

echo "🐳 Docker コンテナを起動中..."
docker compose up -d --build

echo "✅ セットアップが完了しました！"
echo "VSCode でこのフォルダを開き、'Reopen in Container' を選択してください。"