# texliveの公式イメージを使う
FROM texlive/texlive:latest

# ホストのUID/GIDを反映させるための引数
ARG USERNAME=texlive
ARG USER_UID=1000
ARG USER_GID=1000

RUN apt-get update && apt-get install -y \
    openssh-client \
    git \
    && rm -rf /var/lib/apt/lists/* \
    && groupmod -g $USER_GID $USERNAME || true \
    && usermod -u $USER_UID -g $USER_GID $USERNAME \
    && mkdir -p /home/$USERNAME/.vscode-server /home/$USERNAME/src \
    && chown -R $USERNAME:$USERNAME /home/$USERNAME

# ユーザー切り替え
USER $USERNAME

# 初期ディレクトリの設定
WORKDIR /home/$USERNAME/src
