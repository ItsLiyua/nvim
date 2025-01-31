local k = vim.keymap
k.set("n", "q:", "<Nop>") -- Unmap regular command history
k.set("n", "nh", "<Nop>")

k.set("i", "jk", "<ESC>", { desc = "Exit insert mode" })
k.set("n", "<leader>mc", "<cmd>nohl<CR>", { desc = "Clear search" })
k.set("n", "<leader>qq", "<cmd>wa<CR><cmd>q<CR>", { desc = "Save all buffers and exit" })

k.set({ "n", "i" }, "<C-+>", "<C-a>", { desc = "Increment number" })
k.set("n", "<leader>m+", "<C-a>", { desc = "Increment number" })
k.set({ "n", "i" }, "<C-->", "<C-x>", { desc = "Decrement number" })
k.set("n", "<leader>m-", "<C-x>", { desc = "Decrement number" })

k.set("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Split vertically" })
k.set("n", "<leader>sh", "<cmd>split<CR>", { desc = "Split horizontally" })
k.set("n", "<leader>se", "<C-w>=", { desc = "Resize splits to equal size" })
k.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close split" })

k.set("n", "<leader>bo", "<cmd>enew<CR>", { desc = "New empty buffer" })
k.set("n", "<leader>bx", "<cmd>bd<CR>", { desc = "Close buffer" })
k.set("n", "<leader>e", "<cmd>bd<CR>", { desc = "Close buffer" })
k.set("n", "<C-w>", "<cmd>bd<CR>", { desc = "Close buffer" })

k.set("n", "<leader>fn", "<cmd>enew<CR>", { desc = "New file" })
k.set("n", "<leader>fw", "<cmd>w<CR>", { desc = "Save file" })

k.set("n", "<C-h>", "<cmd>wincmd h<CR>", { desc = "Move to left split" })
k.set("n", "<C-j>", "<cmd>wincmd j<CR>", { desc = "Move to bottom split" })
k.set("n", "<C-k>", "<cmd>wincmd k<CR>", { desc = "Move to top split" })
k.set("n", "<C-l>", "<cmd>wincmd l<CR>", { desc = "Move to right split" })
