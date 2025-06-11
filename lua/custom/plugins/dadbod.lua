local helpers = require 'misc.helpers'
if helpers.isLinux() and helpers.hosts.isNas() then
  return {}
end

return {
  'tpope/vim-dadbod',
  'kristijanhusak/vim-dadbod-completion',
  'kristijanhusak/vim-dadbod-ui',
}
