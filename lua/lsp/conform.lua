local M = {}

M.formatters_by_ft = {
	kotlin = { "ktlint" },
	lua = { "stylua" },
	python = { "isort", "black" },
	sh = { "shfmt" },
}

M.formatter_conf = {
	ktlint = {
		prepend_args = { "--editorconfig=~/.config/nvim/ktlint.cfg" },
	},
}

local prettierd_filetypes = {
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact",
	"vue",
	"css",
	"scss",
	"less",
	"html",
	"json",
	"jsonc",
	"yaml",
	"markdown",
	"markdown.mdx",
	"graphql",
	"handlebars",
}

for _, ft in ipairs(prettierd_filetypes) do
	local existing = M.formatters_by_ft[ft]

	if existing ~= nil then
		table.insert(existing, "prettierd")
	else
		M.formatters_by_ft[ft] = { "prettierd" }
	end
end

return M
