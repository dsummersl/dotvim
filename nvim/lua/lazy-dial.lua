return function ()
  return {
    "monaqa/dial.nvim",
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        -- default augends used when no group name is specified
        default = {
          augend.integer.alias.decimal,  -- nonnegative decimal number (0, 1, 2, 3, ...)
          augend.integer.alias.hex,      -- nonnegative hex number  (0x01, 0x1a1f, etc.)
          augend.date.alias["%m/%d/%Y"], -- date (02/19/2022, etc.)
          augend.date.alias["%m-%d-%Y"], -- date (02/19/2022, etc.)
        },
        enhanced = {
          augend.integer.alias.decimal,  -- nonnegative decimal number (0, 1, 2, 3, ...)
          augend.integer.alias.hex,      -- nonnegative hex number  (0x01, 0x1a1f, etc.)
          augend.date.alias["%m/%d/%Y"], -- date (02/19/2022, etc.)
          augend.constant.new({ elements = { "&&", "||" }, word = false, cyclic = true }),
          augend.constant.new({ elements = { "==", "!=" }, word = false, cyclic = true }),
          augend.constant.new({ elements = { "true", "false" } }),
          augend.constant.new({ elements = { "True", "False" } }),
          augend.constant.new({ elements = { "info", "warn", "debug" } }),
          augend.constant.new({ elements = { "INFO", "WARN", "DEBUG" } }),
          augend.constant.new({ elements = { "align", "justify" } }),
          augend.constant.new({ elements = { "and", "or" } }),
          augend.constant.new({ elements = { "assertContains", "assertNotContains" } }),
          augend.constant.new({ elements = { "assertFalse", "assertTrue" } }),
          augend.constant.new({ elements = { "assertIn", "assertNotIn" } }),
          augend.constant.new({ elements = { "before", "after" } }),
          augend.constant.new({ elements = { "columns", "rows" } }),
          augend.constant.new({ elements = { "disabled", "enabled" } }),
          augend.constant.new({ elements = { "even", "odd" } }),
          augend.constant.new({ elements = { "first", "last" } }),
          augend.constant.new({ elements = { "left", "right" } }),
          augend.constant.new({ elements = { "min", "max" } }),
          augend.constant.new({ elements = { "top", "bottom" } }),
          augend.constant.new({ elements = { "up", "down" } }),
          augend.constant.new({ elements = { "width", "height" } }),
          augend.constant.new({ elements = { "yes", "no" } }),
          augend.constant.new({ elements = { "open", "close" } }),
          augend.constant.new({ elements = { "padding", "margin" } }),
          augend.constant.new({ elements = { "present", "absent" } }),
          augend.constant.new({ elements = { "enable", "disable" } }),
          augend.constant.new({ elements = { "public", "protected", "private" } }),
          augend.user.new({
            find = require("dial.augend.common").find_pattern_regex("\\v\\.([a-zA-Z_-]+)>"),
            add = function(text, addend, cursor)
              local word = text:sub(2)
              text = "['" .. word .. "']"
              cursor = #text
              return { text = text, cursor = cursor }
            end,
          }),
          augend.user.new({
            find = require("dial.augend.common").find_pattern_regex("\\v\\[['\"]([a-zA-Z_-]+)['\"]\\]"),
            add = function(text, addend, cursor)
              local word = text:sub(3, -3)
              text = "." .. word
              cursor = #text
              return { text = text, cursor = cursor }
            end,
          }),
        },
      })

      vim.api.nvim_set_keymap("n", "<C-a>", require("dial.map").inc_normal("enhanced"), { noremap = true })
      vim.api.nvim_set_keymap("n", "<C-x>", require("dial.map").dec_normal("enhanced"), { noremap = true })
      vim.api.nvim_set_keymap("v", "<C-a>", require("dial.map").inc_visual("enhanced"), { noremap = true })
      vim.api.nvim_set_keymap("v", "<C-x>", require("dial.map").dec_visual("enhanced"), { noremap = true })
      vim.api.nvim_set_keymap("v", "g<C-a>", require("dial.map").inc_gvisual("enhanced"), { noremap = true })
      vim.api.nvim_set_keymap("v", "g<C-x>", require("dial.map").dec_gvisual("enhanced"), { noremap = true })
    end,
  }
end
