# config

home 中的一些配置

## iterm2 的配置

1. 安装`iterm2`
   `brew install iterm2`
2. 导入主题文件`Nord.itermcolors`并选择

## nvim vim 的配置

1. 安装`vim` 和 `nvim`
   `brew install vim neovim`

2. 使用`vim-plug`安装插件

   ```shell
   # vim
   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

   # nvim
   curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```

   把`vimrc`复制到`~/.vimrc`
   打开`nvim`输入`:PlugInstall`

## oh-my-zsh 配置

1. 安装`zsh` 和 `oh-my-zsh`
    ``` shell
    brew install zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```

2. 复制`zshrc`到`~/.zshrc`,输入`source ~/.zshrc`

## tmux配置

1. 安装tmux插件管理器`tpm`
    github地址:[https://github.com/tmux-plugins/tpm](https://github.com/tmux-plugins/tpm)
    ```shell
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    ```
    复制`tmux`到`~/.tmux.conf`
