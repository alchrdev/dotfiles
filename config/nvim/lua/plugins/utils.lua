local plugins = {
  {
    -- auto pairs
    {
      "echasnovski/mini.pairs",
      event = "VeryLazy",
      config = function(_, opts)
        require("mini.pairs").setup(opts)
      end,
    },
    -- commenting
    {
      "echasnovski/mini.comment",
      event = "VeryLazy",
      opts = {},
      config = function(_, _)
        require("mini.comment").setup()
        require('nvim-treesitter.configs').setup {
          enable_autocmd = false,
        }
        vim.g.skip_ts_context_commentstring_module = true
      end,
    },
    -- auto tags
    {
      "windwp/nvim-ts-autotag",
      config = function()
        require("nvim-ts-autotag").setup()
      end,
    },
    -- maximize window toggling
    {
      "szw/vim-maximizer",
      keys = {
        { "<leader>z", "<CMD>MaximizerToggle<CR>", desc = "Maximize Window", silent = true },
        {
          "<leader>z",
          "<CMD>MaximizerToggle<CR>gv",
          mode = "v",
          desc = "Maximize Window",
          silent = true,
        },
      },
      init = function()
        vim.g.maximizer_set_default_mapping = 0
      end,
    },
    -- highlight/navigate uses of  word under cursor using LSP, Tree-sitter, or regex matching
    {
      "rrethy/vim-illuminate",
      event = "BufReadPost",
      opts = {
        delay = 250,
        under_cursor = true,
        min_count_to_highlight = 2,
      },
      config = function(_, opts)
        require("illuminate").configure(opts)
      end,
      -- stylua: ignore
      keys = {
        { "]]", function() require("illuminate").goto_next_reference(false) end, desc = "Next word reference", },
        { "[[", function() require("illuminate").goto_prev_reference(false) end, desc = "Prev word reference" },
      },
    },
    -- surround
    {
      "echasnovski/mini.surround",
      version = "*",
      config = function(_, opts)
        require("mini.surround").setup(opts)
      end,
    },
    -- markdown preview
    {
      "iamcco/markdown-preview.nvim",
      build = function()
        vim.fn["mkdp#util#install"]()
      end,
    },
    -- indent guides
    {
      event = { "BufReadPost", "BufNewFile" },
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      opts = {
        indent = {
          char = "┊",
        },
        exclude = {
          filetypes = { "help", "alpha", "dashboard", "Trouble", "lazy" },
        },
        scope = {
          enabled = false,
        },
      }
    },
    -- git
    {
      "tpope/vim-fugitive",
      config = function()
        vim.api.nvim_set_keymap("n", "<leader>gf", "<cmd>tab +Git<cr>", { noremap = true, silent = true })
      end
    },
    -- jumping
    {
      "folke/flash.nvim",
      event = "VeryLazy",
      opts = {},
      -- stylua: ignore
      keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
      },
    },
  },
}

return plugins
