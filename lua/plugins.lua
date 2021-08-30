vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'mhinz/vim-signify'
  use 'AndrewRadev/splitjoin.vim'
  use 'kiteco/vim-plugin'
  use 'machakann/vim-sandwich'
  use 'nvim-lua/completion-nvim'
  -- use 'phaazon/hop.nvim'
  -- use 'lambdalisue/gina.vim'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'dsummersl/vim-diffundo'
  use 'sainnhe/gruvbox-material'

  use 'jeetsukumaran/vim-indentwise' -- Support indent motions ]ii
  use 'tpope/vim-unimpaired' -- many additional mappings for ]q, etc
  use 'tpope/vim-repeat' -- awesome: makes the surround plugin work with the '.' keys (repeatability!)
  use 'kreskij/Repeatable.vim'
  use 'easymotion/vim-easymotion' -- mapped to s for two letter searching.
  use 'wellle/visual-split.vim' -- I've mapped this to <leader>v Lines to quickly resize splits (VSSplit)
  use 'kana/vim-operator-user' -- Define my own operators for motions.
  use 'tommcdo/vim-exchange'

  use 'tommcdo/vim-lion' -- align with operator gL and gl (ie glip= to align paragraph by =)
  use 'tommcdo/vim-express' -- custom g* operations (g=iw - prompt 'get_'.v:val.'()' to change a word to a func)

  use 'stefandtw/quickfix-reflector.vim' -- edit the qf list directly with copen
  use { 'dsummersl/vim-projectionist', branch = 'issue-94' } -- :E* commands for a project
  use 'MarcWeber/vim-addon-local-vimrc' -- enable project local .vimrc files
  use 'tpope/vim-fugitive' -- git
  use 'tpope/vim-rhubarb' -- Gbrowse 
  use 'tpope/vim-eunuch' -- eunuch.vim: cp/move/unlink commands
  use 'ludovicchabant/vim-gutentags'
  use 'vinodkri/vim-tmux-runner' -- :VtrSendCommandToRunner for tmux
  use 'tpope/vim-abolish' -- fix spelling errors
  use 'editorconfig/editorconfig-vim' -- 0.1.0 EditorConfig Plugin for Vim -- helps define and maintain consistent coding style
  use 'mattn/emmet-vim' -- fast HTML tag generation (in insert mode type tr*3CTL-Y, to make three <tr>s
  use 'tomtom/tcomment_vim' -- An extensible & universal comment vim-plugin that also handles embedded filetypes
  use { 'Yggdroot/LeaderF', run = './install.sh' }
  use 'gregsexton/gitv'
  use 'mhinz/vim-grepper' -- Grepper to search in lots of ways
  use 'jiangmiao/auto-pairs' -- close quotes and such automatically
  use 'dsummersl/vim-utf2ascii' -- simple utf2ascii function.
  use 'AndrewRadev/switch.vim' -- Easily toggle boolean values:
  use { 'dsummersl/gundo.vim' }
  use { 'w0rp/ale' }
  use { 'RRethy/vim-hexokinase', run = 'make hexokinase' } -- Colors for red/green/#123123
  use '~/Documents/classes/nvim-sluice'
  use 'SirVer/ultisnips'
  use 'nvim-lua/lsp-status.nvim'
  use 'neovim/nvim-lspconfig'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'glepnir/lspsaga.nvim'

  use 'itchyny/lightline.vim'
  use 'machakann/vim-highlightedyank' -- highlight any text as it is yanked
  use 'pgdouyon/vim-evanesco' -- Highlight search, clear after searching
  use 'nathanaelkane/vim-indent-guides' -- A Vim plugin for visually displaying indent levels in code

  use 'prabirshrestha/async.vim'
  use 'vim-test/vim-test'
  use 'mattn/webapi-vim'

  use 'wellle/targets.vim' -- many text objects
  use 'kana/vim-textobj-user' -- user defined textobj implementations
  use 'glts/vim-textobj-comment' -- select comment with vic or vac.
  use 'michaeljsmith/vim-indent-object' -- vii and viI (visual inner Indent)
  use 'saaguero/vim-textobj-pastedtext' -- vgb for last pasted text.

  use 'ryanoasis/vim-devicons'
end)
