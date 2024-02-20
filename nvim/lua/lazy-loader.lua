-- How to setup local files: https://github.com/LazyVim/LazyVim/discussions/1878#discussioncomment-7667560

local function find_plugin_index(spec, name)
  for i, plugin in ipairs(spec) do
    if type(plugin) == "string" and plugin == name then
      return i
    end
    if plugin[1] == name then
      return i
    end
  end
  return nil
end

return function(extra_spec)
  local default_spec = require('lazy-plugins')

  if extra_spec == nil then
    return require("lazy").setup({ spec = default_spec })
  end

  for _, plugin in ipairs(extra_spec) do
    local plugin_name = type(plugin) == "string" and plugin or plugin[1]
    local idx = find_plugin_index(default_spec, plugin_name)
    if idx ~= nil then
      default_spec[idx] = plugin  -- Replace with the entire plugin table
    end
  end

  require("lazy").setup({
    spec = default_spec,
  })
end
