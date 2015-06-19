" Line 6
"   1) Failure:
"               \%W%*\\s%*\\d)\ Failure:,
" Line 17
"   1) Error:
"               \%E%*\\s%*\\d)\ Error:,
"
" Line 8
"   1) Failure:
" test_simulation(TC_Simulation)
"     [/home/sjoyeux/dev/genom.rb/test_suite/test_simulation.rb:38:in `test_simulation'
"		\%Z%*\\s[%f:%l:in\ %m,
"
" Line 19
"   1) Error:
" test_propose_commit(TC_DistributedTransaction)
"     [(roby://localhost:1246) /usr/lib/ruby/1.8/test/unit/assertions.rb:48:in `assert_block'
" 		\%Z%*\\s[(%\\w%#://%.%#)\ %f:%l:in\ %m,
"
" 		\%Z%*\\s%f:%l:in\ %m,
"
"   1) Failure:
" test_method_model(TC_Planner) [/home/doudou/laas/dev/roby//test_suite/test_planning.rb:67]:
" <ArgumentError> exception expected but was
" Class: <RuntimeError>
" Message: <"cannot change the method model for root since methods are already using it">
" ---Backtrace---
" 		\%Z---Backtrace---,
"
" 		\%-G%*\\s(%\\w%#://%.%#)\ /usr/lib/ruby/1.8/drb/drb.rb:%l:in\ %m,
" 		\%m:in\ (%\\w%#://%.%#)\ %f:%l:in\ %.%#,
" 		\%m:in\ %f:%l:in\ %.%#,
" 		\(%\\w%#://%.%#)\ %f:%l:in\ %m,
" 		\%*\\s(%\\w%#://%.%#)\ %f:%l:in\ %m,
" 		\%*\\s(%\\w%#://%.%#)\ %f:%l,
" 		\%.%#:%*\\d:%.%#:\ %*[^/]%f:%l:\ %m(SyntaxError),
" 		\%f:%l:\ parse\ error\\,\ %m,
" 		\%f:%l:\ warning:\ %m,
"               \%f:%l:%m\(%*\\w\),
"               \%C%m\ [%f:%l]:,
"               \%+C%*\\w(%*\\w):,
"               \%+C%*\\w:\ %m,
"               \%C%[%^\ ]%\\@=%m,
"               \%C%\\s%#,
"
" dRb versions of the ones below
"               \%*\\sfrom\ (%\\w%#://%.%#)\ %f:%l:in\ %m,
"               \%*\\sfrom\ (%\\w%#://%.%#)\ %f:%l,
" from /home/doudou/laas/dev/roby/lib/roby/adapters/genom.rb:225:in `using'
"               \%*\\sfrom\ %f:%l:in\ %m,
" from rackham.rb:16
"               \%*\\sfrom\ %f:%l,
" /home/sjoyeux/dev/genom.rb/lib/genom/runner/simulation.rb:179:in `method_missing'
" (found in tests)
"               \%*\\s%f:%l:in\ %m,
"               \%*\\s%f:%l,
" /home/doudou/laas/dev/roby/lib/roby/adapters/genom.rb:225:in `join': can't convert Symbol into String (TypeError)
"               \%f:%l:in\ %m

let s:cpo_save = &cpo
set cpo-=C

CompilerSet errorformat=\%W%*\\s%*\\d)\ Failure:,
                        \%E%*\\s%*\\d)\ Error:,
			\%Z---Backtrace---,
			\%Z%*\\s[%f:%l:in\ %m,
			\%Z%*\\s[(%\\w%#://%.%#)\ %f:%l:in\ %m,
                        \%*\\d:%*\\d:%*\\d.%*\\d%*\\s(%*\\w)%*\\sfrom\ .%\\?%f:%l:%m,
                        \%*\\d:%*\\d:%*\\d.%*\\d%*\\s(%*\\w)%*\\s.%\\?%f:%l:%m,
                        \%-A%*\\d:%*\\d:%*\\d.%*\\d%*\\s(%*\\w)\ %m,
			\%Z%*\\s%f:%l:in\ %m,
			\%-G%*\\s(%\\w%#://%.%#)\ /usr/lib/ruby/1.8/drb/drb.rb:%l:in\ %m,
			\%m:in\ (%\\w%#://%.%#)\ %f:%l:in\ %.%#,
			\%m:in\ %f:%l:in\ %.%#,
                        \%.%#]:\ %f:%l:in\ %m,
			\(%\\w%#://%.%#)\ %f:%l:in\ %m,
			\%*\\s(%\\w%#://%.%#)\ %f:%l:in\ %m,
			\%*\\s(%\\w%#://%.%#)\ %f:%l,
		        \%.%#:%*\\d:%.%#:\ %*[^/]%f:%l:\ %m(SyntaxError),
		        \%f:%l:\ parse\ error\\,\ %m,
		        \%f:%l:\ warning:\ %m,
                        \%f:%l:%m\(%*\\w\),
                        \%C%m\ [%f:%l]:,
                        \%+C%*\\w(%*\\w):,
                        \%+C%*\\w:\ %m,
                        \%C%[%^\ ]%\\@=%m,
                        \%C%\\s%#,
                        \%*\\sfrom\ (%\\w%#://%.%#)\ %f:%l:in\ %m,
                        \%*\\sfrom\ (%\\w%#://%.%#)\ %f:%l,
                        \%*\\sfrom\ %f:%l:in\ %m,
                        \%*\\sfrom\ %f:%l,
                        \%*\\s%f:%l:in\ %m,
                        \%*\\s%f:%l,
                        \%f:%l:in\ %m,
                        \%f:%l:%m

let &cpo = s:cpo_save
unlet s:cpo_save

