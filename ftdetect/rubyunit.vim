au BufNewFile,BufRead test_*.rb compiler rubyunit
au BufNewFile,BufRead test_*.rb set makeprg=ruby\ -Ilib\ -Itest
au BufNewFile,BufRead *_test.rb compiler rubyunit
au BufNewFile,BufRead *_test.rb set makeprg=ruby\ -Ilib\ -Itest
au BufNewFile,BufRead suite_*.rb compiler rubyunit
au BufNewFile,BufRead suite_*.rb set makeprg=ruby\ -Ilib\ -Itest
au BufNewFile,BufRead suite.rb compiler rubyunit
au BufNewFile,BufRead suite.rb set makeprg=ruby\ -Ilib\ -Itest


