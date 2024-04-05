local lsp_control = {}

lsp_control.on_attach = function(client, bufnr)
  local keymap_opts = function(desc)
    return { noremap = true, silent = true, buffer = bufnr, desc = desc }
  end

  vim.keymap.set('n', ',dd', vim.lsp.buf.definition, keymap_opts('Jump to definition'))
  vim.keymap.set('n', ',dt', vim.lsp.buf.type_definition, keymap_opts('Jump to type definition'))
  vim.keymap.set('n', ',dh', vim.lsp.buf.hover, keymap_opts('LSP Hover'))
  vim.keymap.set('n', ',dr', vim.lsp.buf.rename, keymap_opts('LSP Rename'))
  vim.keymap.set('n', ',df', vim.lsp.buf.format, keymap_opts('Format buffer'))
  -- vim.keymap.set('v', ',df', vim.lsp.buf.range_formatting, opts)
  vim.keymap.set('n', ',da', vim.lsp.buf.code_action, keymap_opts('Code actions'))
  -- vim.keymap.set('v', ',da', vim.lsp.buf.range_code_action, keymap_opts('Code actions'))
  vim.keymap.set('n', ',dl', ':Telescope lsp_references<cr>', keymap_opts('LSP References'))
  vim.keymap.set('n', ',dk', vim.lsp.buf.signature_help, keymap_opts('LSP Signature Help'))

  vim.keymap.set('n', ']d',
    '<cmd>lua vim.diagnostic.goto_next{float=true, severity = { min = vim.diagnostic.severity.HINT }}<CR>',
    keymap_opts('Next lsp suggestion'))
  vim.keymap.set('n', '[d',
    '<cmd>lua vim.diagnostic.goto_prev{float=true, severity = { min = vim.diagnostic.severity.HINT }}<CR>',
    keymap_opts('Prev lsp suggestion'))
  vim.keymap.set('n', ']D',
    '<cmd>lua vim.diagnostic.goto_next{float=true, severity = { min = vim.diagnostic.severity.ERROR }}<CR>',
    keymap_opts('Next error'))
  vim.keymap.set('n', '[D',
    '<cmd>lua vim.diagnostic.goto_prev{float=true, severity = { min = vim.diagnostic.severity.ERROR }}<CR>',
    keymap_opts('Prev error'))

  local on_references = vim.lsp.handlers["textDocument/references"]
  vim.lsp.handlers["textDocument/references"] = vim.lsp.with(
    on_references, {
      -- Use location list instead of quickfix list
      loclist = true,
    })

  -- for some reason formatexpr is getting set to lua - and that is
  -- annoying b/c its not often right (text wrapping gets broken)!
  vim.api.nvim_exec([[
    set formatexpr=
  ]], false)

  if client.server_capabilities.documentSymbolProvider then
    require("nvim-navic").attach(client, bufnr)
  end
end

lsp_control.make_default_opts = function()
  local cmp_capabilities = require 'cmp_nvim_lsp'.default_capabilities(vim.lsp.protocol.make_client_capabilities())
  local opts = {
    on_attach = lsp_control.on_attach,
    on_init = function(client)
      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
      return true
    end,
    capabilities = cmp_capabilities,
    flags = { debounce_text_changes = 150 }
  }
  return opts
end

lsp_control.init = function()
  return {
    "neovim/nvim-lspconfig",
    dependencies = {
      "stevearc/dressing.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "b0o/schemastore.nvim",
      "https://gitlab.com/yorickpeterse/nvim-dd.git",
      "nvimtools/none-ls.nvim",
      "SmiteshP/nvim-navic",
    },
    config = function()
      require("dd").setup()
      vim.diagnostic.config({
        underline = false,
        virtual_text = false,
        severity_sort = true,
        update_in_insert = false,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = '⊪ ',
            [vim.diagnostic.severity.WARN] = '⊩ ',
            [vim.diagnostic.severity.HINT] = '. ',
            [vim.diagnostic.severity.INFO] = 'ℹ ',
          },
          linehl = {
            [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
            [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
            [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
            [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
          },
          numhl = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.HINT] = '',
            [vim.diagnostic.severity.INFO] = '',
          },
        },
      })

      local signs = { Error = "⊪ ", Warn = "⊩ ", Hint = ". ", Info = "ℹ " }

      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      require("mason").setup({})
      require("mason-lspconfig").setup({})
      local lspconfig = require("lspconfig")
      local on_attach = lsp_control.on_attach
      local cmp_capabilities =
          require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
      local opts = lsp_control.make_default_opts()

      lspconfig.yamlls.setup({
        on_attach = on_attach,
        capabilities = cmp_capabilities,
        flags = { debounce_text_changes = 150 },
        settings = {
          yaml = { schemas = require("schemastore").json.schemas() },
        },
      })
      lspconfig.jsonls.setup({
        on_attach = on_attach,
        capabilities = cmp_capabilities,
        flags = { debounce_text_changes = 150 },
        settings = {
          json = { schemas = require("schemastore").json.schemas() },
          jsonls = { schemas = require("schemastore").json.schemas() },
        },
      })
      lspconfig.pyright.setup(opts)
      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        capabilities = cmp_capabilities,
        flags = { debounce_text_changes = 150 },
        settings = { Lua = { diagnostics = { globals = { "vim" } } } },
      })
      lspconfig.html.setup(opts)
      lspconfig.cssls.setup(opts)
      lspconfig.jsonls.setup(opts)
      lspconfig.tsserver.setup(opts)
      lspconfig.ruby_ls.setup(opts)
      lspconfig.vimls.setup(opts)

      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.code_actions.refactoring,
          null_ls.builtins.diagnostics.buf,
          null_ls.builtins.diagnostics.proselint,
          null_ls.builtins.code_actions.proselint,
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.isort,
          -- null_ls.builtins.diagnostics.pylint,
          null_ls.builtins.diagnostics.codespell,
          null_ls.builtins.formatting.codespell,
          -- null_ls.builtins.diagnostics.flake8,
        },
        on_attach = on_attach,
      })
    end,
  }
end

return lsp_control
