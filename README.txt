This uses vundle for bundle management. You need to install vundle manually
first:

  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

The main vimrc script is stored in ~/.vim/vimrc. $HOME/.vimrc should have a single line

  source $HOME/.vim/vimrc

Finally, install the bundles automagically with

  vim +BundleInstall +qall

List of useful plugins

 * pyclewn (gdb integration)
   http://pyclewn.sourceforge.net/
   vimdir=$HOME/.vim/bundle/pyclewn python setup.py install --force --home=$HOME/.vim/bundle/pyclewn-bin
 * latex-suite, vcs integration, align, surround, matchit
   apt-get install vim-latexsuite vim-addon-manager vim-scripts
   vim-addons install align latex-suite vcscommand surround matchit

