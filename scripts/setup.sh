sudo pacman -Syu &&
sudo pacman -S git base-devel curl tmux neovim zsh docker unzip neofetch &&

sudo groupadd docker &&
sudo usermod -aG docker $USER && newgrp docker &&

sudo systemctl enable docker.service &&
sudo systemctl start docker.service &&

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &&

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &&

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k &&

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash &&

git clone https://github.com/matheuspergoli/dotfiles.git &&

