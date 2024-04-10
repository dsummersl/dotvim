return function()
  return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "SmiteshP/nvim-navic",
    },
    config = function()
      local neotest_status = {
        function()
          local neotest = require("neotest")
          local adapter_ids = neotest.state.adapter_ids()
          if #adapter_ids == 0 then
            return ""
          end

          local summary = neotest.state.status_counts(adapter_ids[1], { buffer = vim.fn.bufnr()})
          local passed = summary.passed
          local failed = summary.failed
          local skipped = summary.skipped
          local running = summary.running
          local total = summary.total
          if skipped + passed + failed + running == 0 then
            return ""
          end

          if running > 0 and failed > 0 then
            return string.format("%d  %d/%d", failed, passed, total)
          end

          if running > 0 then
            return string.format("%d/%d", passed, total)
          end

          if failed > 0 then
            return string.format("%d  %d", failed, total)
          end

          return string.format("%d/%d", passed, total)
        end,
        color = function()
          local utils = require('lualine.utils.utils')
          local neotest = require("neotest")
          local adapter_ids = neotest.state.adapter_ids()
          if #adapter_ids == 0 then
            return ""
          end
          local summary = neotest.state.status_counts(adapter_ids[1], { buffer = vim.fn.bufnr()})
          if not summary then
            return ""
          end

          if summary.failed > 0 then
            return { fg = utils.extract_color_from_hllist({ "fg", "sp" }, {"DiagnosticError"}, '#e32636') }
          elseif summary.running > 0 then
            return { fg = utils.extract_color_from_hllist({ "fg", "sp" }, {"DiagnosticWarn"}, '#ffa500') }
          end

          return { fg = utils.extract_color_from_hllist({ "fg", "sp" }, {"DiagnosticInfo"}, '#ffffff') }
        end,
        cond = function()
          local neotest = require("neotest")
          local adapter_ids = neotest.state.adapter_ids()
          if #adapter_ids == 0 then
            return false
          end
          local summary = neotest.state.status_counts(adapter_ids[1], { buffer = vim.fn.bufnr()})
          return summary ~= nil
        end,
      }
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          section_separators = '',
          component_separators = '',
        },
        sections = {
          lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 1) end } },
          lualine_b = { 'branch', 'diagnostics', neotest_status },
          lualine_c = { 'filename' },
          lualine_x = { 'filetype' },
          lualine_y = {},
          lualine_z = { 'location' }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      }
    end,
  }
end
