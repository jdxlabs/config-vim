# My ~/.vim dir

## Install

  * First, get Vundle : `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
  * Then, install plugins : `:PluginInstall`
  * If you want to active the linter for js : `sudo npm install eslint --global`

## Fonts install for compatibility with vim-airline plugin

For Linux users :  
```
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
sudo cp PowerlineSymbols.otf /usr/share/fonts
fc-cache -f -v
mkdir -p ~/.config/fontconfig/conf.d/
cp 10-powerline-symbols.conf ~/.config/fontconfig/conf.d
```

For Mac users :  
- install the OTF with Font book
- In Iterm > Preferences > Profiles > Text, select Powerline

For Windows users (with WSL) :  
- Download the "DejaVu Sans Mono for Powerline.ttf" file [here](https://github.com/powerline/fonts/tree/master/DejaVuSansMono)
- Drag and drop it in Fonts
