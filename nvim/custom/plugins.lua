local overrides = require("custom.configs.overrides")
local cmp = require("cmp")

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
				-- Change tab behavior
				["<Tab>"] = function(callback)
					if cmp.visible() then
						cmp.confirm({ select = true })
					else
						callback()
					end
				end,

				-- Disabled Enter
				["<CR>"] = function(callback)
					callback()
				end,
			},
			sources = {
				{ name = "copilot", priority = 10 },
				{ name = "nvim_lsp", priority = 9 },
				{ name = "luasnip", priority = 5 },
				{ name = "path" },
				{ name = "buffer" },
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
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "BufRead",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},

	{
		"zbirenbaum/copilot-cmp",
		event = "InsertEnter",
		config = function()
			require("copilot_cmp").setup()
		end,
	},
}

return plugins
