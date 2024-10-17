require "nvchad.mappings"
local M = {}
-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>a", require("lspimport").import, { noremap = true })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
return M
