#!/bin/bash

CONFIG_DIR="$HOME/.config"
DOTFILES_DIR="$HOME/.dotfiles"
NEOVIM_DIR="/opt/nvim"

echo -e "Running test simulation\n"

echo "Installing Neovim..."
if [ ! -d "$NEOVIM_DIR" ]; then
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
  chmod u+x nvim-linux-x86_64.appimage
  ./nvim-linux-x86_64.appimage

  echo "Exposing Neovim Globally..."
  sudo mkdir -p /opt/nvim
  sudo mv nvim-linux-x86_64.appimage /opt/nvim/nvim

  echo "Sourcing Neovim..."

  echo -e "Now you can officially say Neovim BTW\n"
else 
  echo "Neovim already exist"
fi

echo "Installing Node packages..."
if [ ! -d "$NVM_DIR" ]; then
  echo "Installing NVM..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

  echo "Sourcing NVM..."
  \. "$HOME/.nvm/nvm.sh"

  echo "Installing NVM..."
  nvm install 22

  echo "Verifying Packages..."
  node -v 
  nvm current 

  echo "Verifying npm..."
  npm -v 

  echo "Enabling Corepack for pnpm..."
  corepack enable pnpm

  echo -e "Verifying pnpm...\n"
  pnpm -v
else
  echo "NVM already exist"
fi

echo -e "\nTesting Ended"
