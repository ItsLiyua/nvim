vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode" })

vim.keymap.set("n", "<leader>nh", "<cmd>nohl<CR>", { desc = "Clear search" })

vim.keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
vim.keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<cmd>split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close split" })

vim.keymap.set("n", "<leader>to", "<cmd>enew<CR>", { desc = "Creates new empty buffer" })
vim.keymap.set("n", "<leader>tx", "<cmd>bd<CR>", { desc = "Closes current buffer" })
vim.keymap.set("n", "<leader>tn", "<cmd>bnext<CR>", { desc = "Go to next buffer" })
vim.keymap.set("n", "<leader>tp", "<cmd>bprevious<CR>", { desc = "Go to previous buffer" })

vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<CR>", { desc = "Move to left split" })
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<CR>", { desc = "Move to bottom split" })
vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<CR>", { desc = "Move to top split" })
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<CR>", { desc = "Move to right split" })
