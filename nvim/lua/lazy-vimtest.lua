return function()
  local neotest = {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "mfussenegger/nvim-dap",
      "mfussenegger/nvim-dap-python",
      "nvim-neotest/neotest-plenary",
      "nvim-neotest/neotest-vim-test",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-jest",
    },
    config = function()
      local neotest = require("neotest")
      neotest.setup({
        adapters = {
          require("neotest-plenary"),
          require("neotest-vim-test"),
          require("neotest-python")({
            args = { "-vvv" }
          }),
        },
        consumers = {
          my_consumers = function(client)
            local yank = function()
              local position_id, _last_args = neotest.run.get_last_run()
              if not position_id then
                print("No last run!")
                return
              end
              -- local fname = vim.fn.expand("%:p")
              -- local adapter_name, adapter = client:get_adapter(fname)
              -- print(adapter)
              --
              -- -- this isn't working - I get an error about data not being
              -- -- provided
              -- local command = adapter.build_spec({ tree = position_id }).command
              --
              -- -- convert to string
              -- local command_str = table.concat(command, " ")
              vim.fn.setreg("*", position_id)
              vim.cmd("OSCYankRegister *")
            end

            return {
              yank = yank
            }
          end
        },
        status = {
          signs = false,
        },
        output = {
          open_on_run = false
        },
      })
      local testfile = function()
        neotest.run.run(vim.fn.expand("%"))
      end
      local testoutput = function()
        neotest.output.open({ enter = true })
      end
      local testdebug = function()
        neotest.run.run_last({ strategy = "dap" })
      end
      vim.keymap.set('n', ',ctn', neotest.run.run, { desc = 'Run nearest test' })
      vim.keymap.set('n', ',ctf', testfile, { desc = 'Run all tests in file' })
      vim.keymap.set('n', ',ctl', neotest.run.run_last, { desc = 'Rerun last test' })
      vim.keymap.set('n', ',ctd', testdebug, { desc = 'Rerun last test with debugger' })
      vim.keymap.set('n', ',cto', testoutput, { desc = 'Open last test run' })
      vim.keymap.set('n', ',cta', neotest.summary.open, { desc = 'Open test summary' })
      vim.keymap.set('n', ',cty', neotest.my_consumers.yank, { desc = 'Copy last command run' })
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
