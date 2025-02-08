local M = {}

M.isFramework = function()
  local hostname = vim.loop.os_gethostname()
  return hostname == 'framework-arch-finn'
end

M.isLinux = function()
  if vim.fn.has 'macunix' == 1 then
    return true
  end
  return false
end

M.isNas = function()
  return vim.fn.hostname() == 'dockerhost'
end

M.ignored_netrw_list = {
  '\\.acn',
  '\\.acr',
  '\\.alg',
  '\\.glg',
  '\\.glo',
  '\\.gls',
  '\\.ist',
  '\\.maf',
  '\\.mtc',
  '\\.mtc0',
  'node_modules',
}

return M
