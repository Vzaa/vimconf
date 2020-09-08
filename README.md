(Neo)Vim config
-
```
mkdir -p ~/.config/nvim/
echo -e "set runtimepath^=~/.vim runtimepath+=~/.vim/after\n"\
"let &packpath = &runtimepath\n"\
"source ~/.vimrc" > ~/.config/nvim/init.vim

git clone https://github.com/Vzaa/vimconf ~/.vim
ln -s ~/.vim/vimrc .vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#:PlugUpdate
#:CocInstall coc-json coc-clangd coc-python coc-rust-analyzer coc-snippets
```
