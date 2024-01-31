#!/bin/bash

# Apagando arquivos do pacman e gnupg para evitar erros de chave pública inválida
rm -rf ~/.gnupg &&
rm -rf /var/cache/pacman &&
rm -rf /etc/pacman.d/gnupg &&

# Configurando chaves do pacman e atualizando o sistema
pacman-key --init &&
pacman-key --populate &&
yes | pacman -Sy archlinux-keyring &&
yes | pacman -Su &&
yes | pacman -Syyu &&

# Configurando sudoers file
echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel &&

# Criando usuário
useradd -m -G wheel -s /bin/bash heizmen &&

# Definindo senha
passwd heizmen &&

echo "Zap"
