local overrides = require("custom.configs.overrides")

local plugins = {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "rust-analyzer",
        "lua_ls",
        "jsonnet_ls",
        "shfmt",
      },
    },
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
        {
            'williamboman/mason.nvim',
        },
    },
    opts = {
        ensure_installed = {
            'lua_ls',
            'jsonnet_ls',
            'rust_analyzer',
            'gopls',
        },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  -- autoforatting - works for all kinds of filetypes
  --[[
  {
    "nvimtools/none-ls.nvim",
    ft = 'go',
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  --[[
  {
   "github/copilot.vim",
   lazy = false,
   config = function()
     -- Mapping tab is already used by NvChad
    vim.g.copilot_no_tab_map = true;
    vim.g.copilot_assume_mapped = true;
    vim.g.copilot_tab_fallback = "";
      -- The mapping is set to other key, see custom/lua/mappings
      -- or run <leader>ch to see copilot mapping section
    end
  },
  ]]--
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = overrides.copilot,
  },
  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup{
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        mapping = cmp.mapping.preset.insert({
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-t>'] = cmp.mapping.complete(),
        }),

        -- sources for autocompletion
        sources = {
          { name = "copilot", group_index = 2 },
          { name = "nvim_lsp", group_index = 2 },
          { name = "buffer", group_index = 2 },
        },
      }

    end,
  },
}
return plugins
