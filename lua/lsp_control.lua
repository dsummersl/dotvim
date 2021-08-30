local lsp_control = {}

lsp_control.show = true

lsp_control.toggle_virtualtext = function()
    lsp_control.show = not lsp_control.show
    vim.lsp.diagnostic.display(
        vim.lsp.diagnostic.get(0, 1),
        0,
        1,
        {lsp_control = lsp_control.show}
    )
end

return lsp_control
