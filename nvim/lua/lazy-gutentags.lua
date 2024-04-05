return function ()
  return {
    "ludovicchabant/vim-gutentags",
    init = function()
      vim.g.gutentags_modules = { "ctags" }
      vim.g.gutentags_cache_dir = "~/.vim/tags"
      vim.g.gutentags_ctags_exclude = {
        "*/node_modules/*",
        "*/bower_components/*",
        "*/public/assets/*",
        "*/public/packs/*",
        "*/public/packs-test/*",
        "*/vendor/*",
        "tags",
        "**/*.json",
        "**/*.md",
        "**/*.sql",
        "**/*.html",
      }

      vim.cmd([[
      " If there is more than one tag match, show the list of matches
      nmap <silent> <C-]> :GutentagsReset<cr>g<C-]>zt

      function! ResetGutentags()
        if exists('b:gutentags_files')
          unlet b:gutentags_files
        endif
        call gutentags#setup_gutentags()
      endfunction

      command! -nargs=0 GutentagsReset call ResetGutentags()

      " Some other ruby project is tromping over the gutentags files - manually
      " reload every time we enter:
      autocmd BufRead *.rb  :GutentagsReset
      autocmd BufRead *.slim  :GutentagsReset
      autocmd BufRead *.haml  :GutentagsReset
    ]])
    end,
  }
end
