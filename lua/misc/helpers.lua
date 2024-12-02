local M = {}

M.isFramework = function()
  local hostname = vim.loop.os_gethostname()
  return hostname == 'framework-arch-finn'
end

M.isLinux = function()
  if vim.fn.has 'macunix' then
    return true
  end
  return false
end

return M
