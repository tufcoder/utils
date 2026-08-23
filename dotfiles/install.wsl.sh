#!/bin/bash

GIT_CORE_AUTOCRLF=$(grep -qi microsoft /proc/version && echo "input" || echo "true")
GIT_CORE_EDITOR="vim"
GIT_REMOTE_ADDRESS="git@github.com"
GIT_REMOTE_NAME="tufcoder"
GIT_REMOTE_UTILS="$GIT_REMOTE_ADDRESS:$GIT_REMOTE_NAME/utils.git"
GIT_USER_EMAIL="oswaldogpc@gmail.com"
GIT_USER_NAME="Oswaldo Castro"
WINDOWS_DRIVE_C="/mnt/c"
WINDOWS_USER="oswaldo-castro"

echo "--- Atualizando pacotes do sistema ---"
sudo apt update && sudo apt full-upgrade -y

echo "--- Instalando ferramentas essenciais ---"
sudo apt install build-essential git curl wget unzip tmux vim -y

echo "--- Configurando o Git no WSL2/Linux ---"
git config --global user.email "$GIT_USER_EMAIL"
git config --global user.name "$GIT_USER_NAME"
git config --global core.autocrlf "$GIT_CORE_AUTOCRLF"
git config --global core.editor "$GIT_CORE_EDITOR"
git config --global -l

echo "--- Copiando chaves SSH do Windows para o WSL ---"
mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"

# Copia tudo de .ssh do Windows se existir
if [ -d "$WINDOWS_DRIVE_C/Users/$WINDOWS_USER/.ssh" ]; then
    cp -r "$WINDOWS_DRIVE_C/Users/$WINDOWS_USER/.ssh/"* "$HOME/.ssh/" 2>/dev/null || true
fi

# Ajuste dinâmico de permissões (o '*' fica fora das aspas para o glob funcionar)
for key in "$HOME/.ssh"/id_*; do
    [ -f "$key" ] || continue
    if [[ "$key" == *.pub ]]; then
        chmod 644 "$key"
        echo "Permissão 644 aplicada à chave pública: $(basename "$key")"
    else
        chmod 600 "$key"
        echo "Permissão 600 aplicada à chave privada: $(basename "$key")"
    fi
done

echo "--- Testando conexão com o Github ---"
ssh -T "$GIT_REMOTE_ADDRESS" || true

echo "--- Criando diretório e clonando dotfiles ---"
mkdir -p "$HOME/$GIT_REMOTE_NAME"

if [ ! -d "$HOME/$GIT_REMOTE_NAME/utils" ]; then
    echo "Clonando $GIT_REMOTE_UTILS em $HOME/$GIT_REMOTE_NAME/utils"
    git clone "$GIT_REMOTE_UTILS" "$HOME/$GIT_REMOTE_NAME/utils"

    echo "Criando os symlinks na home: .tmux.conf e .vimrc"
    ln -sf "$HOME/$GIT_REMOTE_NAME/utils/dotfiles/tmux.conf" "$HOME/.tmux.conf"
    ln -sf "$HOME/$GIT_REMOTE_NAME/utils/dotfiles/vimrc" "$HOME/.vimrc"

    echo "Criando diretório e carregando configs para o Neovim"
    mkdir -p "$HOME/.config"
    ln -sf "$HOME/$GIT_REMOTE_NAME/utils/dotfiles/nvim" "$HOME/.config/nvim"

    echo "Dotfiles clonados e symlinks criados com sucesso!"
else
    echo "Repositório de utils já clonado."
fi
