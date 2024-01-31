# Atualizando o sistema e instalando os pacotes necessários
sudo pacman-key --init &&
sudo pacman-key --populate &&
sudo pacman -Sy archlinux-keyring &&
sudo pacman -Su &&
sudo pacman -S git base-devel curl tmux neovim zsh docker docker-compose unzip neofetch &&

# Configurando o docker
sudo groupadd docker &&
sudo usermod -aG docker $USER && newgrp docker &&
sudo systemctl enable docker.service &&
sudo systemctl start docker.service &&

# Instalando oh-my-zsh e plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &&
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &&
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k &&

# Instalando o nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash &&

# Clonando meus dotfiles e configurando nvim/tmux e zsh
git clone https://github.com/matheuspergoli/dotfiles.git ~/.dotfiles && mkdir ~/.config && cp -r ~/.dotfiles/.config/** ~/.config && cp -r ~/.dotfiles/.zshrc ~/.zshrc &&

# Instalando tpm
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm &&

# Configurando node e instalando pnpm
nvm install node && corepack enable && corepack enable pnpm &&

rm -rf ~/.dotfiles &&
source ~/.zshrc &&

echo "Zap"
