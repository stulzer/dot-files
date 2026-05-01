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
    branch = "lua-rewrite",
    ft = "ruby,javascript,typescript,typescriptreact",
    cmd = { "VroomRunTestFile", "VroomRunNearestTest", "VroomRunLastTest" },
    keys = {
      { "<Leader>S", "<cmd>VroomRunTestFile<cr>", desc = "Run test file" },
      { "<Leader>s", "<cmd>VroomRunNearestTest<cr>", desc = "Run nearest test" },
      { "<Leader>l", "<cmd>VroomRunLastTest<cr>", desc = "Run last test" },
    },
    opts = {},
  },

  { "rmehri01/onenord.nvim" },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      local function get_node_path()
        local cmd
        if vim.fn.has("mac") == 1 then
          cmd = "asdf where nodejs 25.2.1"
        else
          cmd = "mise where node@25.9.0"
        end
        local result = vim.fn.system(cmd)
        if vim.v.shell_error ~= 0 then
          vim.notify("copilot: failed to resolve node path via: " .. cmd, vim.log.levels.WARN)
          return "node" -- fallback to PATH
        end
        return vim.trim(result) .. "/bin/node"
      end

      require("copilot").setup {
        suggestion = { enabled = false },
        panel = { enabled = false },
        filetypes = {
          ["*"] = true,
        },
        copilot_node_command = get_node_path(),
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
      model = "claude-sonnet-4.5",
      window = {
        layout = "float",
        relative = "cursor",
        width = 1,
        height = 0.4,
        row = 1,
      },
      prompts = {
        Commit = {
          prompt = "Write commit message for the change with commitizen convention. Keep the title under 50 characters and wrap message at 72 characters. Format as a gitcommit code block. Use backticks for all file and code related changes."
        },
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
