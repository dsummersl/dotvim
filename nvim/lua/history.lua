local M = {}

local tree1 = {
  seq_last = 55,
  entries = {
    {seq = 1, time = 1596071429},
    {seq = 2, time = 1596071444},
    {seq = 3, time = 1596071447},
    {save = 1, seq = 4, time = 1596071453},
    {save = 2, seq = 5, time = 1596071484},
    {seq = 6, time = 1596071584},
    {seq = 7, time = 1596071591},
    {seq = 8, time = 1596071592},
    {seq = 9, time = 1596071595},
    {save = 3, seq = 10, time = 1596071597},
    {save = 7, seq = 11, time = 1596071601},
    {seq = 13, alt = {{save = 6, seq = 12, time = 1596071787}}, time = 1596071845},
    {seq = 14, time = 1596071849},
    {seq = 17, alt = {{seq = 15, time = 1596071851},
    {seq = 16, time = 1596071851}}, time = 1596071858},
    {seq = 18, time = 1596071858},
    {save = 8, seq = 19, time = 1596071861},
    {save = 9, seq = 20, time = 1596071866},
    {save = 10, seq = 21, time = 1596071875},
    {save = 11, seq = 22, time = 1596071883},
    {save = 13, seq = 23, time = 1596071888},
    {save = 14, seq = 25, alt = {{seq = 24, time = 1596071891}}, time = 1596071896},
    {seq = 26, time = 1596072002},
    {seq = 27, time = 1596072009},
    {save = 15, seq = 28, time = 1596072013},
    {seq = 29, time = 1596072128},
    {seq = 30, time = 1596072128},
    {seq = 31, time = 1596072130},
    {seq = 32, time = 1596072130},
    {seq = 33, time = 1596072167},
    {seq = 34, time = 1596072180},
    {seq = 35, time = 1596072181},
    {seq = 36, time = 1596072183},
    {seq = 37, time = 1596072185},
    {seq = 38, time = 1596072188},
    {seq = 39, alt = {{seq = 53, time = 1596073581},
    {seq = 54, time = 1596073581},
    {save = 23, seq = 55, time = 1596073583, newhead = 1}}, time = 1596072189},
    {seq = 40, time = 1596072193},
    {save = 16, seq = 41, time = 1596072218},
    {save = 17, seq = 42, time = 1596072229},
    {save = 18, seq = 43, time = 1596072238},
    {save = 20, seq = 44, time = 1596072423},
    {seq = 45, time = 1596073492},
    {save = 21, seq = 46, time = 1596073495},
    {seq = 47, time = 1596073514},
    {seq = 48, time = 1596073521},
    {seq = 49, time = 1596073531},
    {save = 24, seq = 50, time = 1596073532},
    {curhead = 1, seq = 51, alt = {{seq = 52, time = 1596073569}}, time = 1596073565}},
  time_cur = 1596073532,
  save_last = 24,
  synced = 1,
  save_cur = 24,
  seq_cur = 50
}

function M.printTree(tree)
  -- let @a=string(undotree())
  -- local undo = vim.api.nvim_eval('undotree()')
  -- print(vim.inspect(undo))
  for key, value in pairs(tree.entries) do
    if value['save'] ~= nil then
      print(key, " W ", value.seq)
    else
      print(key, " - ", value.seq)
    end
  end
  -- seq_cur == the current place in the undo.
end

M.printTree(tree1)

-- return M
