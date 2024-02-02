#!/bin/bash

# Instalando pacotes iniciais
yes | sudo pacman -S git base-devel curl tmux neovim zsh openssh docker docker-compose unzip neofetch &&

# Configurando o docker
# sudo groupadd docker &&
# sudo usermod -aG docker $USER && newgrp docker &&
# sudo systemctl enable docker.service &&
# sudo systemctl start docker.service &&

# Instalando oh-my-zsh e plugins
RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &&
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &&
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k &&

# Instalando nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash &&

# Clonando dotfiles e configurando nvim/git-config/tmux/zsh
git clone https://github.com/matheuspergoli/dotfiles.git ~/.dotfiles && mkdir ~/.config && cp -r ~/.dotfiles/.config/** ~/.config && cp -r ~/.dotfiles/.zshrc ~/.zshrc && mv ~/.dotfiles/.gitconfig ~/  &&

# Instalando tpm
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm &&

source ~/.bashrc &&

# Configurando node e instalando pnpm
nvm install node && corepack enable && corepack enable pnpm &&

rm -rf ~/.dotfiles &&

echo "SETUP FINALIZADO!!!"
