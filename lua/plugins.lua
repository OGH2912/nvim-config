local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

{
  "folke/tokyonight.nvim",
  config = function()
    require("tokyonight").setup({
      style = "night",
    })
    vim.cmd.colorscheme("tokyonight")
  end
},

{
  "nvim-tree/nvim-web-devicons"
},

{
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "folke/tokyonight.nvim"
  },
  config = function()
    require("bufferline").setup({
      options = {
        separator_style = "slant",
        diagnostics = "nvim_lsp",
        always_show_bufferline = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    })
  end
},

{
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" }
},

{
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
  },
},

{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require("nvim-treesitter.config").setup({
      highlight = { enable = true },
      indent = { enable = true },
      auto_install = true,
      ensure_installed = {
        "go","lua","json","yaml","bash"
      }
    })
  end
},

{
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  config = function()
    -- Disable default inline diagnostics
    vim.diagnostic.config({
      virtual_text = false,
    })

    require("tiny-inline-diagnostic").setup({
      preset = "modern", -- try: "classic", "minimal", etc
      options = {
        show_source = {
          enabled = true,
        },
      },
      multilines = {
        enabled = true,
      },
    })
  end,
},

{
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup()
  end
},

{
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "gopls",
        "perlnavigator",
        "intelephense",
        "jsonls",
        "yamlls",
        "lua_ls",
      },
      automatic_installation = true,
    })
  end,
},

{
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local servers = require("mason-lspconfig").get_installed_servers()

    for _, server in ipairs(servers) do
      vim.lsp.enable(server, {
        capabilities = capabilities,
      })
    end
  end,
},

{
  "jay-babu/mason-null-ls.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",
  },
  config = function()
    require("mason-null-ls").setup({
      ensure_installed = {
        "stylua",
        "prettier",
      },
      automatic_installation = true,
    })
  end,
},

{
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "jay-babu/mason-null-ls.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.diagnostics.perlcritic,
      },
  })
  end,
},

{
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
  },
  config = function()
    local cmp = require("cmp")

    cmp.setup({
      completion = {
        autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged }
      },

      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
      }),

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer" },
      }),

      formatting = {
        format = function(entry, vim_item)
          vim_item.menu = ({
            buffer = "[Buf]",
            nvim_lsp = "[LSP]",
            path = "[Path]",
          })[entry.source.name]
          return vim_item
        end,
      },
    })
  end
},

{
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup()
  end
},

{
  "nvim-lualine/lualine.nvim",
  dependancies = { "folke/tokyonight.nvim" },
  config = function()
    require("lualine").setup({
      options = { theme = "tokyonight" }
    })
  end
},

{
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      auto_restore = false,
      auto_save = true,
      auto_create = false,
      session_lens = {
        load_on_setup = true,
        previewer = "active_buffer"
      }
    })
  end
},

{
  "goolord/alpha-nvim",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.buttons.val = {
      dashboard.button("n", "New Session", function()
        local name = vim.fn.input("Session name: ")
        if name ~= "" then
          vim.cmd("AutoSession save " .. name)
        end
      end),
      dashboard.button("s","Open Session", ":AutoSession search<CR>"),
      dashboard.button("f","Find file",":Telescope find_files<CR>"),
      dashboard.button("g","Search text",":Telescope live_grep<CR>"),
      dashboard.button("q","Quit",":qa<CR>")
    }

    alpha.setup(dashboard.config)
  end
},

{
  "ojroques/nvim-osc52",
  config = function()
    require("osc52").setup({
      max_length = 0,
      silent = false,
      trim = false,
    })

    vim.api.nvim_create_autocmd("TextYankPost", {
      callback = function()
        require("osc52").copy_register('"')
      end,
    })
  end
}

})

