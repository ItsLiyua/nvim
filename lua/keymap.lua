local wk = require("which-key")

wk.add({
	{ "jk", "<ESC>", mode = { "i" }, icon = { icon = "󰈆", color = "red" }, desc = "Exit insert/visual mode" },
	{ "<leader>nh", "<cmd>nohl<CR>", icon = { icon = "", color = "red" }, desc = "Clear search" },
	{ "<leader>+", "<C-a>", icon = { icon = "󰜄", color = "green" }, desc = "Increment number" },
	{ "<leader>-", "<C-x>", icon = { icon = "󰛲", color = "green" }, desc = "Decrement number" },
	{ "<leader>s", group = "Split...", icon = { icon = "", color = "purple" } },
	{ "<leader>sv", "<cmd>vsplit<CR>", icon = { icon = "", color = "green" }, desc = "Split window vertically" },
	{ "<leader>sh", "<cmd>split<CR>", icon = { icon = "", color = "green" }, desc = "Split window horizontally" },
	{ "<leader>se", "<C-w>=", icon = { icon = "󰇼", color = "blue" }, desc = "Make splits equal size" },
	{ "<leader>sx", "<cmd>close<CR>", icon = { icon = "", color = "red" }, desc = "Close split" },
	{ "<leader>t", group = "Buffers...", icon = { icon = "󰓩", color = "purple" } },
	{ "<leader>to", "<cmd>enew<CR>", icon = { icon = "󰝜", color = "green" }, desc = "Create new empty buffer" },
	{ "<leader>tx", "<cmd>bd<CR>", icon = { icon = "󰭌", color = "red" }, desc = "Close current buffer" },
	{ "<C-w>", "<cmd>bd<CR>", icon = { icon = "󰭌", color = "red" }, desc = "Close current buffer" },
	{ "<Tab>", "<cmd>bnext<CR>", icon = { icon = "", color = "blue" }, desc = "Go to next buffer" },
	{ "<S-Tab>", "<cmd>bprevious<CR>", icon = { icon = "", color = "blue" }, desc = "Go to previous buffer" },
	{ "<C-h>", "<cmd>wincmd h<CR>", icon = { icon = "", color = "blue" }, desc = "Move to left split" },
	{ "<C-j>", "<cmd>wincmd j<CR>", icon = { icon = "", color = "blue" }, desc = "Move to bottom split" },
	{ "<C-k>", "<cmd>wincmd k<CR>", icon = { icon = "", color = "blue" }, desc = "Move to top split" },
	{ "<C-l>", "<cmd>wincmd l<CR>", icon = { icon = "", color = "blue" }, desc = "Move to right split" },
	{ "<leader>f", group = "Find...", icon = { icon = "", color = "purple" } },
})
