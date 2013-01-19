#!/usr/bin/env ruby

# from https://gist.github.com/593551

vim_command = '/usr/bin/vim'
git_command = 'git'
hg_command = '/usr/local/Cellar/python/2.7/bin/hg'


# TODO add an option to see what updates are there (git/hg) and then interractively update.
# TODO it would probably be nice for other people to checkout this git/hg code w/o having to have
# an hg client.

# Git Plugins
# Each plugin can be configured thusly:
#
# URL: The plugin location. This supports three types:
#  - git       : a git plugin. Mostly on github.com?
#                Example: ["git://github.com/sjl/gundo.vim.git"],
#                ---
#                This requires the 'git' command to be on your machine. It just
#                does a git clone.
#  - mercurial : an hg plugin. Probably bitbucket.org? Requires an hg client in your path.
#                Example: ["hg://bitbucket.org/ns9tks/vim-fuzzyfinder"],
#  - vim       : a vim.org hosted plugin. DEPRECATED (use the github repository instead! (ie, ["git://github.com/vim-scripts/SCRIPTNAME.vim"])
#                Example: ["vim://align-294",        "10110"],
#                ---
#                The first string is the name of the plugin.
#                The second string corresponds to the # (URL?src_id) you see 
#                for the specific version you wanna download. For instance:
#
#                For the script: http://www.vim.org/scripts/script.php?script_id=30
#                The latest version is 1.13, and the src_id of the link is
#                http://www.vim.org/scripts/download_script.php?src_id=9196
#                so 9196 is what I'd put here.
#
#   lambda (optional): you can supply a lambda function at the end of any array
#   to do any post cleanup/install action.. The directory you are currently in
#   is the bundle/<name> (that you provided here). Example:
#
#	  ["git://github.com/vim-scripts/applescript.vim", lambda { }],

bundles = [
  # don't like how the tags are displayed. Its kinda annoying.
  #["git://github.com/kshenoy/vim-signature.git"],
  ["https://github.com/tpope/vim-unimpaired.git"],
  ["git://github.com/sjl/threesome.vim.git"],
	["git://github.com/sjl/gundo.vim.git"],
  ["git://github.com/scrooloose/nerdcommenter.git"],
  # this one requires phpctags:
  ["git://github.com/techlivezheng/tagbar-phpctags.git"],
  #["git://github.com/motemen/git-vim"],
  ["git://github.com/sukima/xmledit"],
  ["git://github.com/majutsushi/tagbar.git"],
	["git://github.com/vim-scripts/applescript.vim"],
  # this is no longer maintained by me:
  #["git://github.com/dsummersl/lookupfile-grep"],
  ["git://github.com/dsummersl/vimplugin-macromatches.git"],
  ["git://github.com/dsummersl/wikia-csv.git"],
  ["git://github.com/dsummersl/vimunit.git"],
  ["git://github.com/tpope/vim-fugitive.git"],
  ["git://github.com/kien/ctrlp.vim.git"],
  ["git://github.com/dsummersl/ultisnips.git", lambda {
    `git remote add upstream https://github.com/guns/ultisnips.git`
  }],
  ["git://github.com/bdd/vim-scala"],
  ["git://github.com/kchmck/vim-coffee-script"],
  ["git://github.com/tpope/vim-surround.git"],
  ["git://github.com/mattn/webapi-vim.git"],
  ["git://github.com/mattn/gist-vim.git"],
  ["git://github.com/dsummersl/indenthl", lambda {
		# I want to have indent hilighting for java and groovy too.
		FileUtils.mkdir_p("after/syntax/groovy")
		FileUtils.cp("after/syntax/python/indenthl.vim","after/syntax/groovy")
	}],
  # my own lame SVN mappings:
  ["git://github.com/dsummersl/svntools"],
  ["git://github.com/PProvost/vim-ps1"],
  # tmux keybindings for the console:
  ["git://github.com/benmills/vimux"],
  ["git://github.com/pitluga/vimux-nose-test"],
  ["git://github.com/altercation/vim-colors-solarized"],
  ["hg://bitbucket.org/ns9tks/vim-l9"],
  ["vim://cecutil-1066"    , "7618"]  , 
  ["vim://vimball-1502"    , "11981"] , 
  ["vim://align-294"       , "10110"] , 
  ["vim://largefile-1506"  , "9277"]  , 
  ["vim://genutils-197"    , "11399"] , 
  ["vim://matchit-39"      , "8196"]  , 
  ["vim://csapprox-2390"      , "18594"]  , 
  ["vim://conqueshell-2771", "16279"]  , 

#  "git://github.com/timcharper/textile.vim.git",
#  "git://github.com/tpope/vim-cucumber.git",
#  "git://github.com/tpope/vim-fugitive.git",
#  "git://github.com/tpope/vim-git.git",
#  "git://github.com/tpope/vim-haml.git",
#  "git://github.com/tpope/vim-markdown.git",
#  "git://github.com/tpope/vim-rails.git",
#  "git://github.com/tpope/vim-repeat.git",
#  "git://github.com/tsaleh/vim-supertab.git",
#  "git://github.com/tsaleh/vim-tcomment.git",
#  "git://github.com/vim-ruby/vim-ruby.git",
]

#["pythoncomplete",        ""],
#["rails-1567",        ""],
#["showmarks",        ""],

require 'fileutils'
require 'open-uri'

bundles_dir = File.join(File.dirname(__FILE__), "bundle")

FileUtils.cd(bundles_dir)

trash = ARGV.include?('--trash')

bundles.each do |script|
	url = script[0]
	puts url
	if (url.start_with? 'git')
		dir = url.split('/').last.sub(/\.git$/, '')
		if File.exists?(dir)
			if !trash
				puts "  Skipping"
			else
				FileUtils.rm_rf dir
			end
			next
		end
		puts "  Unpacking #{url} into #{dir}"
		`#{git_command} clone #{url} #{dir}`
	end
	if (url.start_with? 'hg')
		url = script[0].gsub(/^hg:/,"http:")
		dir = url.split('/').last
		if File.exists?(dir)
			if !trash
				puts "  Skipping"
			else
				FileUtils.rm_rf dir
			end
			next
		end
		puts "  Unpacking #{url} into #{dir}"
		`#{hg_command} clone #{url} #{dir}`
	end
	if (url.start_with? 'vim')
		name = script[0].gsub(/^vim:\/\//,"")
		script_id = script[1]
		if !trash && File.exists?(name)
			puts "  Skipping"
			next
		end
		puts "Setup & Download #{name}"
		FileUtils.mkdir_p(name)
		FileUtils.cd(name)
		f = open("http://www.vim.org/scripts/download_script.php?src_id=#{script_id}")
		local_file = f.meta["content-disposition"].gsub(/attachment; filename=/,"")
		if local_file.end_with? 'vim'
			FileUtils.mkdir_p(File.dirname("plugin"))
			FileUtils.cd("plugin")
		end
		puts "  Writing #{local_file}"
		File.open(local_file, "w") do |file|
			file << f.read
		end
		if local_file.end_with? 'zip'
			puts "  Unzip"
			%x(unzip #{local_file})
		end
		if local_file.end_with?('vba') || local_file.end_with?('vmb')
			puts "  Vimball"
			# launch vim and make it process the vimball the right way:
			local_folder = name
			system("cd ../.. ; #{vim_command} +\"e bundle/#{local_folder}/#{local_file}|UseVimball ~/.vim/bundle/#{local_folder}\"")
    elseif local_file.end_with?('vba.gz') || local_file.end_with?('vmb.gz')
			puts "  Vimball Gzip"
			%x(gunzip #{local_file})
			# launch vim and make it process the vimball the right way:
			local_folder = name
			unzipped_file = local_file.gsub(/.gz/,"")
			system("cd ../.. ; #{vim_command} +\"e bundle/#{local_folder}/#{unzipped_file}|UseVimball ~/.vim/bundle/#{local_folder}\"")
		elsif local_file.end_with?('vba.tar.gz') || local_file.end_with?('vmb.tar.gz')
			puts "  Vimball Tar Gzip"
			%x(tar zxf #{local_file})
			# launch vim and make it process the vimball the right way:
			local_folder = name
			unzipped_file = local_file.gsub(/.tar.gz/,"")
			system("cd ../.. ; #{vim_command} +\"e bundle/#{local_folder}/#{unzipped_file}|UseVimball ~/.vim/bundle/#{local_folder}\"")
		elsif local_file.end_with? 'tar.gz'
			puts "  Tar Gunzip"
			%x(tar zxf #{local_file})
		elsif local_file.end_with? '.gz'
			puts "  Gunzip"
			%x(gunzip #{local_file})
		end
		if local_file.end_with? 'vim'
			FileUtils.cd("..")
		end
		# do any custom code.
    if script.size == 3
      puts "  Custom setup"
      script[2].call
    end
		FileUtils.cd("..")
  else
		FileUtils.cd(dir)
    if script.size == 2
      puts "  Custom setup"
      script[1].call
    end
		FileUtils.cd("..")
	end

end

# vim:ft=ruby:
