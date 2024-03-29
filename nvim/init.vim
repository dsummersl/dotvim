set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim

source ~/.vim/_vimrc

lua << EOF

local function read_file_as_string(file_path)
    local file = io.open(file_path, "r")
    if not file then
        vim.api.nvim_err_writeln("Error: Unable to open file " .. file_path)
        return nil
    end
    local content = file:read("*all")
    file:close()
    return content
end

vim.api.nvim_create_user_command('MiniDiffFile', function(opts)
    local file_path = opts.fargs[1]
    local content = read_file_as_string(file_path)
    if content then
        MiniDiff.set_ref_text(0, content)
    end
end, { nargs = 1, complete = "file"})

EOF
