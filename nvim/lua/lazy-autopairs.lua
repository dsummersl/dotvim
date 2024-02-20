return function ()
  return {
    "windwp/nvim-autopairs",
    -- later versions have broken the ability to hit 'enter' within (_).
    commit = "0f04d78619cce9a5af4f355968040f7d675854a1",
    config = function()
      require("nvim-autopairs").setup()

      local npairs = require('nvim-autopairs')
      local Rule = require('nvim-autopairs.rule')
      local cond = require('nvim-autopairs.conds')
      local utils = require('nvim-autopairs.utils')

      -- from https://github.com/windwp/nvim-autopairs/issues/167 -- ability to jump out of pairs
      local function multiline_close_jump(open, close)
        return Rule(close, '')
            :with_pair(function()
              local buf = vim.fn.bufnr()
              local row, col = utils.get_cursor(0)
              local line = utils.text_get_current_line(buf)

              if #line ~= col then --not at EOL
                return false
              end

              local unclosed_count = 0
              for c in line:gmatch("[\\" .. open .. "\\" .. close .. "]") do
                if c == open then unclosed_count = unclosed_count + 1 end
                if unclosed_count > 0 and c == close then unclosed_count = unclosed_count - 1 end
              end
              if unclosed_count > 0 then return false end

              local nextrow = row + 1
              if nextrow < vim.api.nvim_buf_line_count(0)
                  and vim.regex("^\\s*" .. close):match_line(0, nextrow) then
                return true
              end
              return false
            end)
            :with_move(cond.none())
            :with_cr(cond.none())
            :with_del(cond.none())
            :set_end_pair_length(0)
            :replace_endpair(function()
              return '<esc>xEa'
            end)
      end

      npairs.add_rules({
        multiline_close_jump('(', ')'),
        multiline_close_jump('[', ']'),
        multiline_close_jump('{', '}'),
      })
    end,
  }
end
