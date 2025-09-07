return {
  -- Mason core
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = true,
  },
  -- Mason + LSP bridge
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = { "pyright" }, -- ✅ тільки ті, що Mason реально може поставити
      }

      local lspconfig = require("lspconfig")

      -- Clangd беремо із системи (apk add clang-extra-tools)
      lspconfig.clangd.setup {}

      -- Python (ставиться Mason через npm)
      lspconfig.pyright.setup {}
    end,
  },
}

