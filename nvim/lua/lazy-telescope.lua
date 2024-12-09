return function()
  return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
      "nvim-telescope/telescope-media-files.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
      "nvim-telescope/telescope-frecency.nvim",
      "debugloop/telescope-undo.nvim",
      "benfowler/telescope-luasnip.nvim",
    },
    config = function()
      local actions = require("telescope.actions")
      local lga_actions = require("telescope-live-grep-args.actions")
      require("telescope").setup({
        defaults = {
          sorting_strategy = "descending",
          color_devicons = true,
          layout_config = {
            center = {
              height = 0.6,
            },
            cursor = {
              height = 0.6,
            },
            horizontal = {
              height = 0.6,
              preview_width = 0.6
            },
            vertical = {
              height = 0.6,
            },
          },
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-p>"] = actions.close,
              ["<Esc>"] = actions.close,
              ["<C-c>"] = function()
                vim.cmd([[stopinsert]])
              end,
            },
            n = {
              ["<C-c>"] = require("telescope.actions").close,
            },
          },
        },
        pickers = {
          find_files = {
            previewer = false,
          },
          oldfiles = {
            previewer = false,
            only_cwd = true,
            -- mappings = {
            --   i = {
            --     ["<C-p>"] = require('telescope.actions').find_files,
            --   },
            -- },
          },
        },
        extensions = {
          live_grep_args = {
            auto_quoting = true, -- enable/disable auto-quoting
            mappings = {         -- extend mappings
              i = {
                ["<C-t>"] = lga_actions.quote_prompt({ postfix = " -t " }),
              },
            },
          },
          frecency = {
            show_filter_column = false,
          }
        }
      })
      require("telescope").load_extension("media_files")
      require("telescope").load_extension("live_grep_args")
      require("telescope").load_extension("undo")
      require("telescope").load_extension("luasnip")
      require("telescope").load_extension "frecency"

      vim.cmd([[
        nnoremap <silent> <leader>/r :Telescope resume<CR>
        nnoremap <silent> <C-p> :Telescope find_files<CR>
        " User iterm2 to map shift-ctrl-p to <f15>
        " nnoremap <silent> <F11> :Telescope frecency workspace=CWD path_display={"smart"}<CR>
        " nnoremap <silent> <F15> :Telescope frecency workspace=CWD path_display={"smart"}<CR>
        nnoremap <silent> <F11> :Telescope oldfiles<CR>
        nnoremap <silent> <F15> :Telescope oldfiles<CR>
        nnoremap <silent> <C-t> :Telescope tags<CR>
        " User iterm2 to map shift-ctrl-t to <f16>
        nnoremap <silent> <F12> :silent! lua require"telescope-config".treesitter_or_ctags()<CR>
        nnoremap <silent> <F16> :silent! lua require"telescope-config".treesitter_or_ctags()<CR>

        noremap <silent> <leader>/g :lua require("telescope").extensions.live_grep_args.live_grep_args()<cr>
        noremap <silent> <leader>/f :exec ":lua require('telescope').extensions.live_grep_args.live_grep_args({ default_text = '". expand("%:t:r:r") ."' })"<cr>
        noremap <silent> <leader>// :exec ":lua require('telescope').extensions.live_grep_args.live_grep_args({ default_text = '\"". substitute(escape(@/,' '),'\\[<>]\{1}','\\\\b','g') ."\" ". expand("%") ."' })"<cr>
        noremap <silent> <leader>/w :Telescope grep_string<cr>
      ]])
    end,
  }
end
