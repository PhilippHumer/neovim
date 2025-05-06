return {

    {
        "mfussenegger/nvim-dap-python"
    },

  {
    "eatgrass/maven.nvim",
    cmd = { "Maven", "MavenExec" },
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
          require('maven').setup({
          executable = "mvn", -- `mvn` should be in your `PATH`, or the path to the maven exectable, for example `./mvnw`
        })
    end
  },

  {
    "nvim-lua/plenary.nvim"
  },

  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function ()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function ()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function ()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function ()
        dapui.close()
      end
    end
  },

  {
    "nvim-neotest/nvim-nio",
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
    }
  },

    {
        "mfussenegger/nvim-jdtls",
        dependencies = {
            "mfussenegger/nvim-dap"
        }
    },

  {
    "phpactor/phpactor"
  },

  {
    "mfussenegger/nvim-dap",
  },

  {
    "williamboman/mason.nvim",
  },

  {
    "p00f/nvim-ts-rainbow",
  },

  --{
  --  "coffebar/neovim-project",
  --  opts = {
  --    projects = { -- define project roots
  --      "/home/philipp/dev/*",
  --      "~/.config/*",
  --    },
  --    picker = {
  --      type = "telescope", -- or "fzf-lua"
  --    }
  --  },
  --  init = function()
  --    -- enable saving the state of plugins in the session
  --    vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
  --  end,
  --  dependencies = {
  --    { "nvim-lua/plenary.nvim" },
  --    -- optional picker
  --    { "nvim-telescope/telescope.nvim", tag = "0.1.4" },
  --    -- optional picker
  --    { "ibhagwan/fzf-lua" },
  --    { "Shatur/neovim-session-manager" },
  --  },
  --  lazy = false,
  --  priority = 100,
  --},

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
