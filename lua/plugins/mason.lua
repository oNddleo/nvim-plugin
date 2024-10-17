return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  opts = {
    ensure_installed = {
      "black",
      "debugpy",
      "mypy",
      "ruff-lsp",
      "pyright",
      "gopls",
      "rust-analyzer",
      "json-lsp",
      "goimports",
    },
  },
}
