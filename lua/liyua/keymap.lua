local k = vim.keymap

k.set("i", "jk", "<ESC>", { desc = "Exit insert mode" })
k.set("n", "<leader>mc", "<cmd>nohl<CR>", { desc = "Clear search" })
k.set("n", "<leader>qq", "<cmd>wa<CR><cmd>q<CR>", { desc = "Save all buffers and exit" })

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

k.set("n", "<leader>ml", "<cmd>Lazy<CR>", { desc = "Open lazy UI" })
k.set("n", "<leader>mt", "~h", { desc = "Toggle case" })

k.set({ "n", "v", "i" }, "<Up>", "<Nop>", { desc = "Disable arrow keys" })
k.set({ "n", "v", "i" }, "<Down>", "<Nop>", { desc = "Disable arrow keys" })
k.set({ "n", "v", "i" }, "<Left>", "<Nop>", { desc = "Disable arrow keys" })
k.set({ "n", "v", "i" }, "<Right>", "<Nop>", { desc = "Disable arrow keys" })

k.set("i", "<BS>", function()
	local line = vim.api.nvim_get_current_line()
	if line:match("^%s*$") and not line:match("^$") then
		return "<C-u><C-u>"
	else
		return "<C-h>"
	end
end, { silent = true, expr = true, desc = "Delete whole line if empty" })
