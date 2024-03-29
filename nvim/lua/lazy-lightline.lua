return function ()
  return {
    "itchyny/lightline.vim",
    config = function()
      vim.cmd([[
      function! LspStatus()
        return "-"
      endfunction
      function! LightlineMode()
        return lightline#mode()[0:0]
      endfunction
      function! LightlineFilename()
        let filename = expand('%:~:.') !=# '' ? expand('%:~:.') : '[No Name]'
        let modified = &modified ? ' +' : ''
        return filename . modified
      endfunction
      function! LightlineFiletype()
        return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() . ' ': 'no ft') : ''
      endfunction
      function! LightlineFileformat()
        return WebDevIconsGetFileFormatSymbol()
      endfunction
      function! LightlineBreadcrumb()
        return luaeval('require("nvim-navic").get_location({depth_limit = 3, separator = ": "})')
      endfunction
    ]])

      vim.g.lightline = {
        colorscheme = "jellybeans",
        active = {
          left = {
            { "mode",     "paste" },
            { "readonly", "filename", "breadcrumb" },
          },
          right = {
            { "lineinfo" },
            { "percent" },
            { "currentfunction", "indent", "fileformat", "filetype" },
          },
        },
        component = {
          indent = '%{&expandtab?"":"t"}%{&tabstop}',
        },
        component_function = {
          mode = "LightlineMode",
          filename = "LightlineFilename",
          filetype = "LightlineFiletype",
          fileformat = "LightlineFileformat",
          currentfunction = "LspStatus",
          breadcrumb = "LightlineBreadcrumb",
        },
      }
    end,
  }
end
