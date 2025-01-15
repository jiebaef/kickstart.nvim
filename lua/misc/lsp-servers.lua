local servers = {}

if require('misc.helpers').isFramework() then
  servers = {
    beautysh = {},
    csharp_ls = {},
    cssls = {},
    cssmodules_ls = {},
    djlint = {},
    docker_compose_language_service = {},
    dockerls = {},
    emmet_language_server = {
      filetypes = {
        "css",
        "html",
        "javascriptreact",
        "less",
        "sass",
        "scss",
        "svelte",
        "typescriptreact"
      },
    },
    html = { filetypes = { 'html', 'twig', 'hbs' } },
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
    ts_ls = {
      init_options = {
        plugins = {
          {
            name = '@vue/typescript-plugin',
            -- location = "P:/Scoop/apps/nvm/1.1.12/nodejs/nodejs/node_modules/@vue/typescript-plugin",
            -- location = 'P:/Scoop/apps/nvm/current/nodejs/v22.1.0/node_modules/@vue/typescript-plugin',
            location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
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
      root_dir = {
        'package.json',
        '.git',
      },
    },
  }
else
  servers = {
    csharp_ls = {},
    -- clangd = {},
    -- gopls = {},
    -- pyright = {},
    rust_analyzer = {},
    docker_compose_language_service = {},
    dockerls = {},
    -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
    --
    -- Some languages (like typescript) have entire language plugins that can be useful:
    --    https://github.com/pmizio/typescript-tools.nvim
    --
    -- But for many setups, the LSP (`tsserver`) will work just fine
    -- tsserver = {},
    --

    lua_ls = {
      -- cmd = {...},
      -- filetypes = { ...},
      -- capabilities = {},
      settings = {
        Lua = {
          completion = {
            callSnippet = 'Replace',
          },
        },
      },
    },
    powershell_es = {},

  }
end

return servers
