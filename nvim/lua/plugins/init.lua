local overrides = require "configs.overrides"
-- Used with cmp configuration
-- local cmp = require "cmp"

return {
  -- ##############################
  -- nvim-cmp old configuration begin
  -- ##############################
  -- {
  --   "hrsh7th/nvim-cmp",
  --   opts = {
  --     mapping = {
  --       -- Change tab behavior
  --       ["<Tab>"] = function(callback)
  --         if cmp.visible() then
  --           cmp.confirm { select = true }
  --         else
  --           callback()
  --         end
  --       end,
  --
  --       -- Disabled Enter
  --       ["<CR>"] = function(callback)
  --         callback()
  --       end,
  --     },
  --     sources = {
  --       { name = "copilot", priority = 10 },
  --       { name = "nvim_lsp", priority = 9 },
  --       { name = "luasnip", priority = 5 },
  --       { name = "path" },
  --       { name = "buffer" },
  --     },
  --   },
  -- },

  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = "BufRead",
  --   config = function()
  --     require("copilot").setup {
  --       suggestion = { enabled = false },
  --       panel = { enabled = false },
  --       filetypes = {
  --         ["*"] = true,
  --       },
  --       copilot_node_command = vim.fn.system("asdf where nodejs 22.0.0"):gsub("%s+", "") .. "/bin/node",
  --     }
  --   end,
  -- },

  -- {
  --   "zbirenbaum/copilot-cmp",
  --   event = "InsertEnter",
  --   config = function()
  --     require("copilot_cmp").setup()
  --   end,
  -- },
  -- ##############################
  -- nvim-cmp old configuration end
  -- ##############################
  --

  --
  -- ##############################
  -- experimenting with blink
  -- ##############################
  {
    import = "nvchad.blink.lazyspec",
  },

  {
    "saghen/blink.cmp",
    dependencies = { "fang2hou/blink-copilot" },
    opts = {
      keymap = {
        preset = "enter",
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
        copilot_node_command = vim.fn.system("asdf where nodejs 22.0.0"):gsub("%s+", "") .. "/bin/node",
      }
    end,
  },
  --
  -- ##############################
  -- end of blink configuration
  -- ##############################

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
      -- format & linting
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
    end, -- Override to setup mason-lspconfig
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
      debug = true, -- Enable debugging
      model = "claude-3.5-sonnet",
      window = {
        layout = "float",
        relative = "cursor",
        width = 1,
        height = 0.4,
        row = 1,
      },
    },
    keys = {
      { "<leader>cpe", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      { "<leader>cpt", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
      {
        "<leader>cpi",
        ":CopilotChatInPlace<cr>",
        mode = "x",
        desc = "CopilotChat - Run in-place code",
      },
      {
        "<leader>cpf",
        "<cmd>CopilotChatFixDiagnostic<cr>", -- Get a fix for the diagnostic message under the cursor.
        desc = "CopilotChat - Fix diagnostic",
      },
      {
        "<leader>cpr",
        "<cmd>CopilotChatReset<cr>", -- Reset chat history and clear buffer.
        desc = "CopilotChat - Reset chat history and clear buffer",
      },
    },
  },

  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      provider = "copilot",
      copilot = {
        model = "claude-3.5-sonnet",
      },
    },
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
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
