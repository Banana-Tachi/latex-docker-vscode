# LaTeX-Docker-VSCode

# Install
1. .envの生成
    ```
    cat <<EOF > .env
    CONTAINER_NAME=texlive
    HOST_NAME=texlive
    SERVICE_NAME=mylatex
    VERSION=1.0.0
    EOF
    ```
1. イメージのビルド
    ```sh
    docker-compose up -d --build
    ```
1. 権限変更
    ```
    sudo chmod -R 777 .vscode-server
    sudo chmod -R 777 src
    ```
1. VSCodeを起動しコンテナにアタッチ
1. コンテナ内でVSCodeの拡張機能 "LaTeX Workshop" を有効に
1. VSCodeの設定に以下を追加
    ```json
    "latex-workshop.latex.tools": [
	{
        "name": "pdflatex",
        "command": "latexmk",
        "args": [
            "-pdf",
            "-bibtex",
            "-synctex=1",
            "-interaction=nonstopmode",
            "-file-line-error",
            "%DOC%"
        ]
    },
    {
        "name": "latexmk-uplatex",
        "command": "latexmk",
        "args": [
            "-e","$latex=uplatex",
            "-e","$bibtex=upbibtex",
            "-e","$dvipdf='dvipdfmx %O -o %D %S'",
            "-e","$pdf_mode=3",              // uplatex → dvipdfmx でPDF化
		    "-bibtex",
            "-synctex=1",
            "-interaction=nonstopmode",
            "-file-line-error",
            "%DOC%"
       ]
    }
    ],
    "latex-workshop.latex.recipes": [
        {
            "name": "pdflatex",
            "tools": ["pdflatex"]
        },
        {
            "name": "uplatex -> dvipdfmx",
            "tools": ["latexmk-uplatex"]
        }
    ],
    "latex-workshop.latex.recipe.default": "uplatex -> dvipdfmx"
    ```

# Using
* src何にプロジェクトを置き、別リポジトリとして管理する
* LaTeXコンパイル
    * VSCode のサイドバーの "TEX" でビルドを選択
    * Ctrl+Shift+Pを押下し、 "Build with recipe" を検索・選択

# Reference
* https://zenn.dev/kneephys/articles/a1f95c4d620524