-- LSP Config with Mason and Mason-LSPConfig
return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "clangd", "lua_ls" },
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")

      -- C / C++
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })

      -- Lua (útil para editar tu propia config de Neovim después)
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
    end
  },
}
