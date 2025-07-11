local helpers = require 'misc.helpers'
if helpers.isLinux() and helpers.hosts.isNas() then
  return {}
end

return {} --[[{ -- directly open ipynb files as quarto docuements
  -- and convert back behind the scenes
  'GCBallesteros/jupytext.nvim',
  opts = {
    custom_language_formatting = {
      python = {
        extension = 'qmd',
        style = 'quarto',
        force_ft = 'quarto',
      },
      r = {
        extension = 'qmd',
        style = 'quarto',
        force_ft = 'quarto',
      },
    },
  },
}
]] --
