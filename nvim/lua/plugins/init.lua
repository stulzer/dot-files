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
    -- dependencies = { "Kaiser-Yang/blink-cmp-avante", "fang2hou/blink-copilot" },
    dependencies = { "fang2hou/blink-copilot" },
    opts = {
      keymap = {
        preset = "enter", -- whole preset is good except for enter :)
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
          -- avante = {
          --   module = "blink-cmp-avante",
          --   name = "Avante",
          -- },
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
      model = "claude-3.5-sonnet",
      window = {
        layout = "float",
        relative = "cursor",
        width = 1,
        height = 0.4,
        row = 1,
      },
    },
  },

  -- {
  --   "yetone/avante.nvim",
  --   enabled = true,
  --   event = "VeryLazy",
  --   lazy = false,
  --   version = false, -- set this if you want to always pull the latest change
  --   opts = {
  --     provider = "copilot", -- or "ollama"
  --     copilot = {
  --       model = "claude-3.5-sonnet",
  --     },
  --     ollama = {
  --       model = "hf.co/mradermacher/CodeFuse-DeepSeek-33B-GGUF:Q4_K_M",
  --     },
  --   },
  --   build = "make",
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "stevearc/dressing.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     "echasnovski/mini.pick", -- for file_selector provider mini.pick
  --     "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
  --     "ibhagwan/fzf-lua", -- for file_selector provider fzf
  --     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  --     "zbirenbaum/copilot.lua", -- for providers='copilot'
  --     {
  --       "HakonHarnes/img-clip.nvim",
  --       event = "VeryLazy",
  --       opts = {
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       "MeanderingProgrammer/render-markdown.nvim",
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --   },
  -- },

  {
    "olimorris/codecompanion.nvim",
    cmd = { "CodeCompanion" },
    lazy = false,
    dependencies = {
      "ravitemer/mcphub.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("codecompanion").setup {
        adapters = {
          deepseek = function()
            return require("codecompanion.adapters").extend("ollama", {
              name = "CodeFuse-DeepSeek-33B-Q4_K_M",
              schema = {
                model = {
                  default = "hf.co/mradermacher/CodeFuse-DeepSeek-33B-GGUF:Q4_K_M",
                },
                num_ctx = {
                  default = 16384,
                },
                num_predict = {
                  default = -1,
                },
              },
            })
          end,
        },
        extensions = {
          mcphub = {
            callback = "mcphub.extensions.codecompanion",
            opts = {
              make_vars = true,
              make_slash_commands = true,
              show_result_in_chat = true,
            },
          },
        },
        strategies = {
          chat = {
            adapter = "deepseek",
          },
          inline = {
            adapter = "deepseek",
          },
        },
        display = {
          chat = {
            show_settings = true,
          },
        },
      }
    end,
  },
}
