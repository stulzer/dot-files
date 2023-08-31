local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",
		"html",
		"css",
		"javascript",
		"typescript",
		"tsx",
		"c",
		"markdown",
		"markdown_inline",
		"json",
		"yaml",
		"python",
		"ruby",
	},
	indent = {
		enable = true,
	},
}

M.mason = {
	ensure_installed = {
		-- lua
		"lua-language-server",
		"stylua",

		-- web dev
		"css-lsp",
		"html-lsp",
		"typescript-language-server",
		"tailwindcss-language-server",
		"prettier",

		-- ruby
		"erb-lint",
		"rubocop",
		"ruby-lsp",
		"solargraph",
		"standardrb",
	},
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

return M
