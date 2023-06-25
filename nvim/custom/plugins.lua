local overrides = require("custom.configs.overrides")

local plugins = {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	{
		"hrsh7th/nvim-cmp",
		opts = {
			mapping = {
				-- disable  tab
				["<Tab>"] = function(callback)
					callback()
				end,

				["<S-Tab>"] = function(callback)
					callback()
				end,
			},
		},
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{ "tpope/vim-commentary", lazy = false },

	{ "tpope/vim-fugitive", lazy = false },

	{ "tpope/vim-rails", ft = "ruby" },

	{ "tpope/vim-repeat", lazy = false },

	{ "tpope/vim-surround", lazy = false },

	{
		"stulzer/vim-vroom",
		branch = "develop",
		ft = "ruby",
		config = function()
			vim.g.vroom_use_terminal = 1
		end,
	},

	{ "jremmen/vim-ripgrep", lazy = false },

	{
		"github/copilot.vim",
		lazy = false,
		config = function()
			vim.g.copilot_assume_mapped = true
		end,
	},
}

return plugins
