return function()
  local neotest = {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-plenary",
      "nvim-neotest/neotest-vim-test",
    },
    config = function()
      local neotest = require("neotest")
      neotest.setup({
        adapters = {
          require("neotest-plenary"),
          require("neotest-vim-test"),
        },
        status = {
          signs = false,
        }
      })
      local testfile = function()
        neotest.run.run(vim.fn.expand("%"))
      end
      local testoutput = function()
        neotest.output.open({ enter = true })
      end
      vim.keymap.set('n', ',ctn', neotest.run.run, { desc = 'Run nearest test' })
      vim.keymap.set('n', ',ctf', testfile, { desc = 'Run all tests in file' })
      vim.keymap.set('n', ',ctl', neotest.run.run_last, { desc = 'Rerun last test' })
      vim.keymap.set('n', ',cto', testoutput, { desc = 'Open last test run' })
    end
  }
  local vimtest = {
    "vim-test/vim-test",
    lazy = true,
    keys = { ",ctn", ",ctf", ",ctl" },
    dependencies = { "vinodkri/vim-tmux-runner" },
    config = function()
      vim.g["test#preserve_screen"] = 1
      vim.g["test#strategy"] = "vtr"
      vim.g["test#sub"] = ""
      local SubstituteTransform = function(cmd)
        -- Transforms for running tests in. {} is replaced. For example:
        -- let test#sub = 'docker run --rm web python manage.py test {} | pygmentize -l pytb'
        -- or, just pipe to something
        -- let g:test#transformation = 'sub'
        -- let test#sub = '{} | pygmentize -l pytb'
        return vim.fn.substitute(vim.g["test#sub"], "{}", cmd, "g")
      end
      local LastTransform = function(cmd)
        -- Keep only the last word, and combine with SubstituteTransform - handy for
        -- the djangotest type test where I want to take advantage of its figuring out
        -- the test name (at the end of the cmd) but want to run it differently
        -- let g:test#transformation = 'last'
        -- let test#sub = '{} | pygmentize -l pytb'
        return SubstituteTransform(vim.fn.substitute(cmd, "^.* \\(\\S\\+\\)$", "\\1", ""))
      end
      vim.g["test#custom_transformations"] = {
        sub = SubstituteTransform,
        last = LastTransform,
      }

      -- E15 when I run this. I think its b/c of function?
      vim.cmd([[
        " Send a selection to the terminal:
        map <leader>ctn :TestNearest<CR>
        map <leader>ctf :TestFile<CR>
        map <leader>ctt :TestLast<CR>

        VtrAttachToPane
      ]])
    end,
  }

  return neotest
end
