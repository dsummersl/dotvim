return function()
  return {
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
end
