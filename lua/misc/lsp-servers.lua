local servers = {}

if require('misc.helpers').isFramework() then
  servers = {
    beautysh = {},
    csharp_ls = {},
    djlint = {},
    docker_compose_language_service = {},
    dockerls = {},
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
  }
end

return servers
