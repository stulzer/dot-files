local overrides = require "configs.overrides"

return {
  {
    import = "nvchad.blink.lazyspec",
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
          avante = {
            module = "blink-cmp-avante",
            name = "Avante",
          },
        },
      },
    },
  },

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
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "User FilePost",
    opts = {
      indent = { char = "│", highlight = "IblChar" },
      scope = { char = "│", highlight = "IblScopeChar" },
    },
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "blankline")

      local hooks = require "ibl.hooks"
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
      local hl_group = "@ibl.scope.underline.1"
      vim.api.nvim_set_hl(0, hl_group, { standout = true, underline = false })

      require("ibl").setup(opts)

      dofile(vim.g.base46_cache .. "blankline")
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = { enable = true },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "nvimtools/none-ls.nvim",
        config = function()
          require "configs.null-ls"
        end,
      },
    },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

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

  {
    "FabijanZulj/blame.nvim",
    config = function()
      require("blame").setup()
    end,
    lazy = false,
  },

  { "tpope/vim-rails", ft = "ruby" },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {}
    end,
  },

  {
    "stulzer/vim-vroom",
    branch = "develop",
    ft = "ruby,javascript,typescript,typescriptreact",
    config = function()
      vim.g.vroom_use_terminal = 1
    end,
  },

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
    },
  },

  {
    "yetone/avante.nvim",
    enabled = true,
    event = "VeryLazy",
    lazy = false,
    version = false,
    opts = {
      provider = "ollama",
      providers = {
        copilot = {
          model = "claude-sonnet-4.5",
        },
        ollama = {
          model = "hf.co/mradermacher/CodeFuse-DeepSeek-33B-GGUF:Q4_K_M",
        },
      },
    },
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "echasnovski/mini.pick",
      "nvim-telescope/telescope.nvim",
      "ibhagwan/fzf-lua",
      "nvim-tree/nvim-web-devicons",
      "zbirenbaum/copilot.lua",
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            use_absolute_path = true,
          },
        },
      },
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
