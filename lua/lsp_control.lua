local lsp_control = {}

lsp_control.show = true

--- I don't think this does anything anymore
lsp_control.toggle_virtualtext = function()
    lsp_control.show = not lsp_control.show
    vim.lsp.diagnostic.display(
        vim.lsp.diagnostic.get(0, 1),
        0,
        1,
        {lsp_control = lsp_control.show}
    )
end

lsp_control.on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local opts = { noremap = true, silent = true }
  buf_set_keymap('n', ',dD', '<cmd>Lspsaga peek_definition<CR>', opts)
  buf_set_keymap('n', ',dd', '<Cmd>Lspsaga goto_definition<CR>', opts)
  buf_set_keymap('n', ',do', '<Cmd>Lspsaga outline<CR>', opts)
  buf_set_keymap('n', ',dh', '<cmd>Lspsaga hover_doc<CR>', opts)
  buf_set_keymap('n', ',dr', '<cmd>Lspsaga rename<CR>', opts)
  buf_set_keymap('n', ',df', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
  buf_set_keymap('v', ',df', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)
  buf_set_keymap('n', ',da', '<cmd>Lspsaga code_action<CR>', opts)
  buf_set_keymap('n', ',dl', '<cmd>Lspsaga lsp_finder<CR>', opts)
  buf_set_keymap('n', ',dL', '<cmd>Trouble lsp_references<CR>', opts)
  -- I only care about diagnostic errors:
  buf_set_keymap('n', ']d', '<cmd>lua require("lspsaga.diagnostic"):goto_next({ severity = { min = vim.diagnostic.severity.WARN } })<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua require("lspsaga.diagnostic"):goto_prev({ severity = { min = vim.diagnostic.severity.WARN } })<CR>', opts)
  buf_set_keymap('n', ']e', '<cmd>lua require("lspsaga.diagnostic"):goto_next({ severity = { min = vim.diagnostic.severity.ERROR } })<CR>', opts)
  buf_set_keymap('n', '[e', '<cmd>lua require("lspsaga.diagnostic"):goto_prev({ severity = { min = vim.diagnostic.severity.ERROR } })<CR>', opts)

  local on_references = vim.lsp.handlers["textDocument/references"]
  vim.lsp.handlers["textDocument/references"] = vim.lsp.with(
    on_references, {
    -- Use location list instead of quickfix list
    loclist = true,
  })

  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec([[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.clear_references() ; vim.lsp.buf.document_highlight()
        " autocmd CursorMoved <buffer> 
      augroup END
    ]], false)
  end

  -- for some reason formatexpr is getting set to lua - and that is
  -- annoying b/c its not often right (text wrapping gets broken)!
  vim.api.nvim_exec([[
    set formatexpr=
  ]], false)
end

lsp_control.make_default_opts = function()
  local cmp_capabilities = require'cmp_nvim_lsp'.default_capabilities(vim.lsp.protocol.make_client_capabilities())
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
