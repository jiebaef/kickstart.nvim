local util = require 'lspconfig.util'
local helpers = require 'misc.helpers'

-- shared servers
local servers = {
  beautysh = {},
  black = {},
  csharp_ls = {},
  cssls = {},
  cssmodules_ls = {},
  djlint = {},
  docker_compose_language_service = {},
  dockerls = {},
  emmet_language_server = {
    filetypes = {
      'css',
      'html',
      'javascriptreact',
      'less',
      'sass',
      'scss',
      'svelte',
      'typescriptreact',
    },
  },
  html = { filetypes = { 'html', 'twig', 'hbs' } },
  isort = {},
  -- 'jupytext',
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
      },
    },
  },
  rust_analyzer = {},
  shfmt = {},
  stylua = {},
  svelte = {
    cmd = { 'svelteserver', '--stdio' },
    settings = {
      typescript = {
        inlayHints = {
          parameterNames = { enabled = 'all' },
          parameterTypes = { enabled = false },
          variableTypes = { enabled = true },
          propertyDeclarationTypes = { enabled = true },
          functionLikeReturnTypes = { enabled = false },
          enumMemberValues = { enabled = true },
        },
      },
    },
    filetypes = { 'svelte' },
    root_dir = util.root_pattern('package.json', '.git'),
  },
  ts_ls = {
    init_options = {
      plugins = {
        {
          name = '@vue/typescript-plugin',
          location = '',
          languages = { 'javascript', 'typescript', 'vue' },
        },
      },
    },
    filetypes = {
      'javascript',
      'typescript',
      'vue',
    },
  },
}

local extensions = {}

if helpers.isLinux() then
  if helpers.hosts.isNas() then
    servers = {
      docker_compose_language_service = {},
      dockerls = {},
      shfmt = {},
    }
  elseif helpers.hosts.isNixos() then
    extensions = {
      nil_ls = {},
    }

    -- TODO: find out where vue typescript is installed
    -- servers.ts_ls.init_options.plugins[1].location = '/usr/local/lib/node_modules/@vue/typescript-plugin'
  elseif helpers.hosts.isFramework() then
    -- extensions = {}
    servers.ts_ls.init_options.plugins[1].location = '/usr/local/lib/node_modules/@vue/typescript-plugin'
  end
else
  if helpers.hosts.isWindowsMain() then
    extensions = {
      powershell_es = {},
    }

    servers.ts_ls.init_options.plugins[1].location = 'P:/Scoop/apps/nvm/current/nodejs/v22.1.0/node_modules/@vue/typescript-plugin'
  end
end

vim.list_extend(servers, extensions)

return servers
