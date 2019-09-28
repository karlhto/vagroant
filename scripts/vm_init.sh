#!/usr/bin/env zsh

# Prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

chsh -s /bin/zsh vagrant

# Setup yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd -

yay --answerclean None --answerdiff None --answeredit None --answerupgrade None
yay -S --noconfirm neovim-git

git clone https://github.com/karlhto/configs
