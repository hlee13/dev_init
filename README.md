# hl_vim_init
use vimrc to build develop environment with YCM
# Install
1: cp .vimrc ~/.vimrc

2: BundleInstall " YouCompleteMe & Syntastic & Supertab

3: cp random_color_picker.vim ~/.vim/plugin

4: cp .ycm_extra_conf.py ~/.ycm_extra_conf.py

5: cproject_init.sh cscope.sh

6: " ctags " cscope.sh

# CSCOPE 
\* * * * * cd /home/didi/github/bigdata-dp/its && ~/scripts/cscope.sh > cscope.log 2>&1

# CTAGS
\*/2 * * * * cd /home/didi/github/bigdata-dp/its && ctags -R .

\*/2 * * * * cd /home/didi/github/bigdata-dp && ctags -R --exclude=boost --exclude=gtest --exclude=gmock third-lib/*
