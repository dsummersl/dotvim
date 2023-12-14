-- How to setup local files: https://github.com/LazyVim/LazyVim/discussions/1878#discussioncomment-7667560
return function(extraspec)
   local spec = require('lazy-plugins')
   require("lazy").setup({
     spec = extraspec and vim.list_extend(spec, extraspec) or spec,
   })
end

