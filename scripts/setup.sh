sudo pacman -Sy archlinux-keyring &&
sudo pacman -Syu &&
sudo pacman -S git base-devel curl &&
sudo pacman -S zsh zsh-completions &&
sudo pacman -S tmux neovim docker &&

sudo groupadd docker &&
sudo usermod -aG docker $USER &&
newgrp docker &&

sudo systemctl start docker.service &&
sudo systemctl enable docker.service &&

touch ~/.zshrc &&
