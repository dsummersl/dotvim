local lsp_control = {}

lsp_control.show = true

--- I don't think this does anything anymore
lsp_control.toggle_virtualtext = function()
  lsp_control.show = not lsp_control.show
  vim.lsp.diagnostic.display(
    vim.lsp.diagnostic.get(0, 1),
    0,
    1,
    { lsp_control = lsp_control.show }
  )
end

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
  vim.keymap.set('n', ',dl', vim.lsp.buf.references, keymap_opts('LSP References'))
  vim.keymap.set('n', ',dk', vim.lsp.buf.signature_help, keymap_opts('LSP Signature Help'))

  vim.keymap.set('n', ']d',
    '<cmd>lua vim.diagnostic.goto_next{float=true, severity = { min = vim.diagnostic.severity.WARN }}<CR>',
    keymap_opts('Next warning'))
  vim.keymap.set('n', '[d',
    '<cmd>lua vim.diagnostic.goto_prev{float=true, severity = { min = vim.diagnostic.severity.WARN }}<CR>',
    keymap_opts('Prev warning'))
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

return lsp_control
