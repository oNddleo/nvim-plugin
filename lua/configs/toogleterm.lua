return {
  -- amongst your other plugins
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup {
      size = 20, -- Terminal size when opening horizontally
      open_mapping = [[<C-\>]], -- Keybinding to toggle the terminal (Ctrl+\ by default)
      hide_numbers = true, -- Hide line numbers in the terminal buffer
      shade_terminals = true, -- Apply shading to terminal buffer
      shading_factor = "2", -- Amount of shading (1 to 3)
      start_in_insert = true, -- Start terminal in insert mode
      direction = "horizontal", -- Terminal opens in a horizontal split
      persist_size = true, -- Remember the size of the terminal across toggles
      close_on_exit = true, -- Close terminal window when the process exits
      shell = vim.o.shell, -- Shell to use, defaults to your system shell
      float_opts = {
        border = "curved", -- Floating terminal border style
        width = 100, -- Set floating terminal width
        height = 30, -- Set floating terminal height
      },
    }
  end,
  keys = {
    { [[<C-\>]] },
    { "<leader>0", "<Cmd>2ToggleTerm<Cr>", desc = "Terminal #2" },
  },
}
