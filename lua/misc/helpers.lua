local M = {}

M.isLinux = function()
  return vim.fn.has 'macunix' == 1
end

M.hosts = {
  isFramework = function()
    -- local hostname = vim.loop.os_gethostname()
    -- return hostname == 'framework-arch-finn'
    return vim.fn.hostname() == 'framework-arch-finn'
  end,

  isNas = function()
    return vim.fn.hostname() == 'dockerhost'
  end,

  isNixos = function()
    return vim.fn.hostname() == 'nixos'
  end,

  isWindowsMain = function()
    return vim.fn.hostname() == 'DESKTOP-FINN'
  end,
}

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
