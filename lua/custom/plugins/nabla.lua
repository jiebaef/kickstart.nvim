local helpers = require 'misc.helpers'
if helpers.isLinux() and helpers.hosts.isNas() then
  return {}
end

return {} --[[ { -- preview equations
  'jbyuki/nabla.nvim',
  keys = {
    { '<leader>qm', ':lua require"nabla".toggle_virt()<cr>', desc = 'toggle [m]ath equations' },
  },
}
]] --
