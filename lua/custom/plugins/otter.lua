local helpers = require 'misc.helpers'
if helpers.isLinux() and helpers.hosts.isNas() then
  return {}
end

return {} --[[ {

  -- for lsp features in code cells / embedded code
  'jmbuhr/otter.nvim',
  dev = false,
  dependencies = {
    {
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
      'hrsh7th/nvim-cmp',
    },
  },
  opts = {
    lsp = {
      hover = {
        border = require('misc.style').border,
      },
    },
    buffers = {
      set_filetype = true,
      write_to_disk = false,
    },
    handle_leading_whitespace = true,
  },
}
]] --
