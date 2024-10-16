-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()
local lspconfig = require "lspconfig"
-- local function get_python_path(workspace)
--   -- Check if a virtual environment is activated (works for uv venv too)
--   if vim.env.VIRTUAL_ENV then
--     return vim.env.VIRTUAL_ENV .. "/bin/python"
--   end
--
--   -- If no active virtualenv, look for a `venv` folder in the workspace (adjust for uv structure)
--   local match = vim.fn.glob(workspace .. "/.venv")
--   if match ~= "" then
--     return match .. "/bin/python"
--   end
--
--   -- Search for uv virtual environments specifically, if it stores them differently
--   local uv_venv_match = vim.fn.glob(workspace .. "/uv/venv")
--   if uv_venv_match ~= "" then
--     return uv_venv_match .. "/bin/python"
--   end
--
--   -- Fallback to system Python if no virtual environment is found
--   return vim.fn.exepath "python3" or vim.fn.exepath "python" or "python"
-- end

-- EXAMPLE
local servers = { "html", "cssls", "pyright", "ruff_lsp", "gopls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

-- Pyright setup for Python
-- lspconfig.pyright.setup {
--   on_init = function(client)
--     -- Example: Optionally, you can set the Python interpreter (based on your virtual environment)
--     client.config.settings.python.pythonPath = get_python_path(client.config.root_dir)
--   end,
--   root_dir = function(fname)
--     return lspconfig.util.find_git_ancestor(fname) or lspconfig.path.dirname(fname)
--   end,
--   settings = {
--     python = {
--       analysis = {
--         autoSearchPaths = true,
--         useLibraryCodeForTypes = true,
--       },
--     },
--   },
-- }
