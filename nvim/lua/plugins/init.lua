-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
-- if true then return {} end

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = { enabled = false },
    },
  },

  {
    "folke/which-key.nvim",
    config = function(_, opts)
      local wk = require("which-key")
      local del = vim.keymap.del

      wk.setup(opts)

      -- Delete top-level menu items here that you want to get overridden
      del("n", "<leader>cm")
    end
  },

  {
    "saghen/blink.cmp",
    dependencies = { "Kaiser-Yang/blink-cmp-avante", "fang2hou/blink-copilot" },
    opts = {
      keymap = {
        preset = "enter",
        ["<CR>"] = {},
        ["<Tab>"] = { "select_and_accept" },
      },
      sources = {
        default = { "copilot" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
          },
        },
      },
    },
  },

  {
    "kylechui/nvim-surround",
    version = "*", event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {}
    end,
  },

  { "folke/flash.nvim", enabled = false },

  {
    "stulzer/vim-vroom",
    branch = "develop",
    ft = "ruby,javascript,typescript,typescriptreact",
    config = function()
      vim.g.vroom_use_terminal = 1
    end,
  },

  { "rmehri01/onenord.nvim" },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        suggestion = { enabled = false },
        panel = { enabled = false },
        filetypes = {
          ["*"] = true,
        },
        copilot_node_command = vim.fn.system("asdf where nodejs 25.2.1"):gsub("%s+", "") .. "/bin/node",
      }
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = { enable = true },
    },
  },

  { "tpope/vim-rails", ft = "ruby" },

  { "jremmen/vim-ripgrep", lazy = false },

  {
    "stulzer/bundler-info.nvim",
    ft = "ruby",
    branch = "single-quotes",
    config = function()
      require("bundler-info").setup()
    end,
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    event = "VeryLazy",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    opts = {
      model = "claude-opus-4.6",
      window = {
        layout = "float",
        relative = "cursor",
        width = 1,
        height = 0.4,
        row = 1,
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onenord",
    },
  },
}
