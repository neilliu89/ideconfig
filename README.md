# ideconfig
To make my own ide for python and golang.

## install
### tools
#### macos
brew install tmux
brew install neovim

#### linux ubuntu
apt-install tmux
apt-install neovim


### config
#### vim
1.安装vim-plug
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
2.复制init.vim 到 ~/.config/nvim/ 目录下
3.nvim执行:PlugInstall 安装插件
4.将golang bin包路径写入环境变量PATH中,.bashrc文件中增加如下内容：
```
export GOBIN='/home/neil/go/bin'
export PATH=$PATH:$GOBIN
```

