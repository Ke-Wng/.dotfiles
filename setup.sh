#!/usr/bin/env bash
# prequisites: 

# install tools
echo "installing neccesary tools..."
sudo apt install {git,python3,gcc,g++,cmake,unzip,curl,ninja-build,gettext,vim,zsh,tmux,npm,nodejs}

# zsh
echo "installing zsh & oh-my-zsh..."
chsh -s /bin/zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# neovim
echo "installing neovim..."
# mkdir -p $HOME/Downloads
# git clone https://github.com/neovim/neovim $HOME/Downloads/neovim
# cd $HOME/Downloads/neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
# cd build
# cpack -G DEB && sudo dpkg -i nvim-linux64.deb

# tldr
echo "installing tldr"
sudo npm install -g tldr
tldr --update

# create sybolic links
echo "creating configure files"
for file in `ls $HOME/.dotfiles/`; do
  target="$HOME/.dotfiles/$file"
  link="$HOME/.$file"

  if [ "$file" == "tmux" ]; then
    target="$HOME/.dotfiles/tmux/.tmux.conf"
    link="$HOME/.tmux.conf"
  fi

  if [ "$file" == "nvim" ]; then
    if [ -d $HOME/.config ]; then
	echo "$HOME/.config already existed"
    else
	mkdir $HOME/.config
    fi
    link="$HOME/.config/nvim"
  fi

  if [ "$file" == "setup.sh" ]; then
    continue
  fi

  ln -sf "$target" "$link"

  echo "$target is linked to $link"
done
