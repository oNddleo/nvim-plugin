return {
  {
    "nvim-neotest/nvim-nio",
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function(_, _)
      -- Function to detect the Python interpreter from the local `.venv`
      local function get_python_path()
        -- Look for `.venv` in the current working directory
        local cwd = vim.fn.getcwd() -- Get the current working directory
        local venv_path = cwd .. "/.venv/bin/python"

        -- Check if the `.venv` Python interpreter exists
        if vim.fn.filereadable(venv_path) == 1 then
          return venv_path
        else
          -- Fallback to system Python if no `.venv` is found
          return vim.fn.exepath "python3" or "python3"
        end
      end
      require("dap-python").setup(get_python_path())
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    ft = { "python" },
    opts = function()
      return require "configs.python-none-ls"
    end,
  },
}
