require "nvchad.mappings"


local map = vim.keymap.set

map("n", "<leader>ff", "<cmd> Telescope <cr>")

-- NOTE: Custom mappings for vim tmux navigator
map("n", "<C-h>", "<cmd> TmuxNavigateLeft <cr>", { desc = "window left" } )
map("n", "<C-j>", "<cmd> TmuxNavigateDown <cr>", { desc = "window down" } )
map("n", "<C-k>", "<cmd> TmuxNavigateUp <cr>", { desc = "window up" } )
map("n", "<C-l>", "<cmd> TmuxNavigateRight <cr>", { desc = "window right" } )
map("n", "<C-\\>", "<cmd> TmuxNavigatePrevious <cr>", { desc = "window previous" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
