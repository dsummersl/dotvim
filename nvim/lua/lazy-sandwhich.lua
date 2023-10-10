return function ()
  return {
    "machakann/vim-sandwich",
    config = function()
      -- for vim-sandwich don't have any s mappings as per docs
      vim.cmd([[nmap s <Nop>]])
      vim.cmd([[xmap s <Nop>]])

      vim.api.nvim_command("runtime autoload/sandwich.vim")
      vim.g["sandwich#recipes"] = vim.list_extend(vim.g["sandwich#default_recipes"], {
        -- { buns = { '{ ', ' }' }, nesting = 1, match_syntax = 1, kind = { 'add', 'replace' }, action = { 'add' }, input = { '{' } },
        -- { buns = { '[ ', ' ]' }, nesting = 1, match_syntax = 1, kind = { 'add', 'replace' }, action = { 'add' }, input = { '[' } },
        -- { buns = { '( ', ' )' }, nesting = 1, match_syntax = 1, kind = { 'add', 'replace' }, action = { 'add' }, input = { '(' } },
        {
          buns = { "{\\s*", "\\s*}" },
          nesting = 1,
          regex = 1,
          match_syntax = 1,
          kind = { "delete", "replace", "textobj" },
          action = { "delete" },
          input = { "{" },
        },
        {
          buns = { "\\[\\s*", "\\s*\\]" },
          nesting = 1,
          regex = 1,
          match_syntax = 1,
          kind = { "delete", "replace", "textobj" },
          action = { "delete" },
          input = { "[" },
        },
        {
          buns = { "(\\s*", "\\s*)" },
          nesting = 1,
          regex = 1,
          match_syntax = 1,
          kind = { "delete", "replace", "textobj" },
          action = { "delete" },
          input = { "(" },
        },
      })
    end,
  }
end
