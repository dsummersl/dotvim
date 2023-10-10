return function()
  return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/playground",
    },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = "all",
        ignore_install = { "phpdoc" },
        matchup = {
          enable = true,
        },
        highlight = {
          enable = true,
          use_langtree = true,
          -- disable slow treesitter highlight for large files
          disable = function(lang, buf)
            local max_filesize = 20 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
        },
        incremental_selection = { enable = true },
        indent = { enable = false },
        textobjects = {
          select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              -- You can the capture groups defined in textobjects.scm
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              -- TODO this does not currently work for multiline comments
              -- ["ac"] = "@comment.outer",
              -- ["ic"] = "@comment.outer",
              ["as"] = "@statement.outer",
              ["is"] = "@statement.outer",
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ["]a"] = "@parameter.inner",
            },
            swap_previous = {
              ["[a"] = "@parameter.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]c"] = "@class.outer",
              ["]]"] = "@function.outer",
            },
            goto_previous_start = {
              ["[["] = "@function.outer",
              ["[c"] = "@class.outer",
            },
          },
        },
      })
    end,
  }
end
