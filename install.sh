#!/usr/bin/env bash

########
# nvim #
########

mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.config/nvim/undo"

ln -sf "$HOME/dotfiles/nvim/init.vim" "$HOME/.config/nvim"

rm -rf "$HOME/.config/X11"
ln -s "$HOME/dotfiles/X11" "$HOME/.config"

# install neovim plugin manager
[ ! -f "$HOME/dotfiles/nvim/autoload/plug.vim" ] \
    && curl -fLo "$HOME/dotfiles/nvim/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p "$HOME/.config/nvim/autoload"
ln -sf "$HOME/dotfiles/nvim/autoload/plug.vim" "$HOME/.config/nvim/autoload/plug.vim"

# Install (or update) all the plugins
nvim --noplugin +PlugUpdate +qa

######
# i3 #
######

rm -rf "$HOME/.config/i3"
ln -s "$HOME/dotfiles/i3" "$HOME/.config"

#######
# Zsh #
#######

mkdir -p "$HOME/.config/zsh"
ln -sf "$HOME/dotfiles/zsh/.zshenv" "$HOME"
ln -sf "$HOME/dotfiles/zsh/.zshrc" "$HOME/.config/zsh"
gn -sf "$HOME/dotfiles/zsh/aliases" "$HOME/.config/zsh/aliases"
rm -rf "$HOME/.config/zsh/external"
ln -sf "$HOME/dotfiles/zsh/external" "$HOME/.config/zsh"

#########
# Fonts #
#########

mkdir -p "$XDG_DATA_HOME"
cp -rf "$HOME/dotfiles/fonts" "$XDG_DATA_HOME"

#########
# dunst #
#########

mkdir -p "$HOME/.config/dunst"
ln -sf "$HOME/dotfiles/dunst/dunstrc" "$HOME/.config/dunst/dunstrc"

########
# tmux #
########

mkdir -p "$HOME/.config/tmux"
ln -sf "$HOME/dotfiles/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"

[ ! -d "$HOME/.config/tmux/plugins" ] \
&& git clone https://github.com/tmux-plugins/tpm \
"$HOME/.config/tmux/plugins/tpm"
