#!/usr/bin/env bash

set -e # exit on error

echo "==> installing dependencies..."

sudo apt update
sudo apt install -y \
	zsh \
	git \ 
	curl \ 
	screenfetch\ 
	micro

# ------------------------------------
# oh my zsh
# ------------------------------------

if [ ! -d "$HOME/.oh-my-zsh" ]; then
	echo "==> installing oh my zsh..."
	RUNZSH=no KEEP_ZSHRC=yes sh -c \
		"$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
	echo "==> Oh My Zsh already installed"
fi

# -------------------------
# zsh-autocomplete
# -------------------------
if [ ! -d "$HOME/zsh-autocomplete" ]; then
  echo "==> Installing zsh-autocomplete..."
  git clone https://github.com/marlonrichert/zsh-autocomplete.git \
    "$HOME/zsh-autocomplete"
else
  echo "==> zsh-autocomplete already installed"
fi

# -------------------------
# zsh-syntax-highlighting
# -------------------------
if [ ! -d "$HOME/zsh-syntax-highlighting" ]; then
  echo "==> Installing zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    "$HOME/zsh-syntax-highlighting"
else
  echo "==> zsh-syntax-highlighting already installed"
fi

echo "==> Done!"
echo "You can now start zsh or set it as default with: chsh -s $(which zsh)"

# make it executable 
#  
# chmod +x fetchtools.sh

