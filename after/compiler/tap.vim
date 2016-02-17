" Vim compiler file
" Compiler:     tap (test anything protocol)
" Maintainer:   dane Summers <dsummersl@yahoo.co>
" Splint Home:	http://www.testanything.org/
" Last Change:  2006 Feb 12

if exists("current_compiler")
  finish
endif
let current_compiler = "tap"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo-=C

CompilerSet makeprg=mocha\ -R\ tap\ \ %


CompilerSet errorformat=%Enot\ ok\ %.\ %m,
	\%-C#\ (in\ test\ file\ %f\\,\ line\ %l),
	\%+C#\ %m,
	\%-G%.%#

let &cpo = s:cpo_save
unlet s:cpo_save
