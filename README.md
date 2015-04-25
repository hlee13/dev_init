# hl_vim_init
use vimrc to build develop environment with YCM

1: cp .vimrc ~/.vimrc

2: BundleInstall " YouCompleteMe & Syntastic & Supertab

3: cp random_color_pocker.vim ~/.vim/plugin

4: cproject_init.sh

5: " ctags " cscope.sh
# CSCOPE 
* * * * * cd /home/didi/github/bigdata-dp/its && ~/scripts/cscope.sh > cscope.log 2>&1

# CTAGS
*/2 * * * * cd /home/didi/github/bigdata-dp/its && ctags -R .
*/2 * * * * cd /home/didi/github/bigdata-dp && ctags -R --exclude=boost --exclude=gtest --exclude=gmock third-lib/*
