The main vimrc script is stored in ~/.vim/vimrc. $HOME/.vimrc should have a single line

  source $HOME/.vim/vimrc

List of useful plugins

 * pyclewn (gdb integration)
   http://pyclewn.sourceforge.net/
   vimdir=$HOME/.vim/bundle/pyclewn python setup.py install --force --home=$HOME/.vim/bundle/pyclewn-bin
   don't forget to add the full path to pyclewn-bin/bin to PATH and to pyclewn-bin/lib/python/ to PYTHONPATH
 * vim-ruby
   git clone git://github.com/vim-ruby/vim-ruby.git ~/.vim/bundle/vim-ruby
 * latex-suite, vcs integration, align, surround, matchit
   apt-get install vim-latexsuite vim-addon-manager vim-scripts
   vim-addons install align latex-suite vcscommand surround matchit

