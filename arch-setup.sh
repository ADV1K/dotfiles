# install packages
sudo pacman -S --needed \
  git \
  atuin \
  make \
  stow \
  fish \
  curlie \
  starship \
  zoxide \
  direnv \
  eza \
  man-db \
  bat \
  bat-extras \
  ripgrep \
  fd \
  fzf \
  neovim \
  tmux \
  trash-cli \
  lf \
  netcat \
  ncdu \
  git-delta \
  tealdeer

# install dotfiles
git clone https://github.com/adv1k/dotfiles
cd dotfiles
mkdir ~/.config/
mkdir ~/.local/
make install

# change shell
sudo chsh -s /bin/fish advik
