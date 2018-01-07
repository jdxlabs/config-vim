# My ~/.vim dir

## Install

  * First, get Vundle : `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
  * Then, install plugins : `:PluginInstall`
  * If you want to active the linter for js : `sudo npm install eslint --global`

## Fonts install for compatibility with vim-airline plugin
```
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
sudo cp PowerlineSymbols.otf /usr/share/fonts
fc-cache -f -v
mkdir -p ~/.config/fontconfig/conf.d/
cp 10-powerline-symbols.conf ~/.config/fontconfig/conf.d
```
