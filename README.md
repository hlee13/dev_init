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

function! NERDTreeOpenNode()
    "a:options
    "let newTreeNode = g:NERDTreeFileNode.New("lib/", b:NERDTree)
    "call g:NERDTreeCreator.createTabTree("../")
    "let node = g:NERDTreeFileNode.GetSelected()
    "let node = g:NERDTreeDirNode.GetSelected()
    if isdirectory(glob('src'))
    endif
    "let path = g:NERDTreePath.Create("lib")
     wincmd w
     if isdirectory(glob('src'))
         let path_0 = g:NERDTreePath.New("src/")
         let node_0 = g:NERDTreeFileNode.GetRootForTab().getChild(path_0)
         call node_0.openRecursively()
     endif

     if isdirectory(glob('conf'))
         let path_1 = g:NERDTreePath.New("conf/")
         let node_1 = g:NERDTreeFileNode.GetRootForTab().getChild(path_1)
         call node_1.openRecursively()
     endif

     call NERDTreeRender()
     wincmd l
    "let node = g:NERDTreeDirNode.findNode(path)
    "echo node
    "let node = g:NERDTreeFileNode.getChild(g:NERDTreePath)
    "echo g:NERDTreeDirNode.getDirChildren()
    "call node.openRecursively()
    "call g:NERDTree.ui.render()
    "call g:NERDTreeUI.render()
    "call NERDTreeRender()
    "redraw
    "echo node.getChildCount()
    "echo node
    "call g:NERDTreeOpener.open(l:node)
    "call g:NERDTreeKeyMap.Invoke()
    "let path = g:NERDTree.ui.getPath(line("."))
    "let node = g:NERDTree.root.findNode(path)
    "echo g:NERDTree.root.path.str()
    "let node = g:NERDTree.root.getChild(4)
    "s:openNodeRecursively()
endfunction
