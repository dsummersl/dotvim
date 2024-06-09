return function()
  return {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      -- TODO https://github.com/petertriho/cmp-git be able to reference git users and commits from github
    },
    config = function()
      vim.cmd([[
        set completeopt=menu,menuone,noselect
        set pumheight=15
      ]])

      local cmp = require("cmp")
      local lspkind = require("lspkind")
      cmp.setup({
        enabled = function()
          if vim.bo.buftype == 'prompt' then
            return false
          end

          return true
        end,
        formatting = {
          format = lspkind.cmp_format({ with_text = false, maxwidth = 40 }),
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          documentation = cmp.config.window.bordered(),
        },
        mapping = {
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-e>"] = cmp.mapping(function(fallback)
            local copilot_keys = vim.fn["copilot#Accept"]()
            if copilot_keys ~= "" then
              vim.api.nvim_feedkeys(copilot_keys, "i", true)
            else
              fallback()
            end
          end),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-Space>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            local ls = require("luasnip")
            if ls.expandable() then
              ls.expand()
            elseif ls.jumpable(1) then
              ls.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },
        sources = {
          { name = "nvim_lsp_signature_help" },
          { name = "nvim_lsp",               priority_weight = 2, keyword_length = 3 },
          { name = "buffer",                 priority_weight = 3, keyword_length = 3 },
          { name = "luasnip",                priority_weight = 1 },
        },
      })

      -- `/` cmdline setup.
      -- cmp.setup.cmdline("/", {
      --   mapping = cmp.mapping.preset.cmdline(),
      --   sources = {
      --     { name = "buffer", keyword_length = 4 },
      --   },
      -- })

      -- Fix the default cmdline behavior so that it uses the native one:
      -- https://github.com/hrsh7th/nvim-cmp/issues/1454
      cmp.setup.cmdline(':', {
        sources = {},
        mapping = cmp.mapping.preset.cmdline({
          ['<Tab>'] = {
            c = function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              else
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-z>', true, true, true), 'ni', true)
              end
            end
          }
        })
      })
    end,
  }
end
