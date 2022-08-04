-- telescope-config.lua
local M = {}

M.treesitter_or_ctags = function()
  local opts = {} -- define here if you want to define something
  local parsers = require "nvim-treesitter.parsers"

  -- TODO if its typescript, use current_buffer_tags (treesitter doesn't show functions)

  if parsers.has_parser(parsers.get_buf_lang(vim.api.nvim_get_current_buf())) then
    require"telescope.builtin".treesitter(opts)
  else
    require"telescope.builtin".current_buffer_tags(opts)
  end
end

return M

-- call via:
-- :lua require"telescope-config".project_files()

-- example keymap:
-- vim.api.nvim_set_keymap("n", "<Leader><Space>", "<CMD>lua require'telescope-config'.project_files()<CR>", {noremap = true, silent = true})
