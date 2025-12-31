# texliveの公式イメージを使う
FROM texlive/texlive:latest

# ユーザーの追加（公式イメージではtexliveというユーザーがある）
ARG USERNAME=texlive

# ユーザー切り替え
USER $USERNAME

# 初期ディレクトリの設定
WORKDIR /home/$USERNAME/src
