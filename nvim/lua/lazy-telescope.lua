return function()
  return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
      "nvim-telescope/telescope-media-files.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    build = "pip install ueberzug",
    config = function()
      local actions = require("telescope.actions")
      local lga_actions = require("telescope-live-grep-args.actions")
      require("telescope").setup({
        defaults = {
          sorting_strategy = "descending",
          color_devicons = true,
          layout_config = {
            center = {
              height = 0.4,
            },
            cursor = {
              height = 0.4,
            },
            horizontal = {
              height = 0.4,
            },
            vertical = {
              height = 0.4,
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
          }
        }
      })
      require("telescope").load_extension("media_files")
      require("telescope").load_extension("live_grep_args")

      vim.cmd([[
        nnoremap <leader>/r :Telescope resume<CR>
        nnoremap <C-p> :Telescope find_files<CR>
        " User iterm2 to map shift-ctrl-p to <f15>
        nnoremap <F11> :Telescope oldfiles<CR>
        nnoremap <F15> :Telescope oldfiles<CR>
        nnoremap <C-t> :Telescope tags<CR>
        " User iterm2 to map shift-ctrl-t to <f16>
        nnoremap <F12> :silent! lua require"telescope-config".treesitter_or_ctags()<CR>
        nnoremap <F16> :silent! lua require"telescope-config".treesitter_or_ctags()<CR>

        noremap <leader>/g :lua require("telescope").extensions.live_grep_args.live_grep_args()<cr>
        noremap <leader>/f :exec ":lua require('telescope').extensions.live_grep_args.live_grep_args({ default_text = '". expand("%:t:r:r") ."' })"<cr>
        noremap <leader>// :exec ":lua require('telescope').extensions.live_grep_args.live_grep_args({ default_text = '\"". substitute(escape(@/,' '),'\\[<>]\{1}','\\\\b','g') ."\"' -g ". expand("%") ."' })"<cr>
        noremap <leader>/w :Telescope grep_string<cr>
      ]])
    end,
  }
end
