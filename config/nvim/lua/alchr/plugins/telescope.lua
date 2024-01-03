return {
  "nvim-telescope/telescope.nvim",
  event = 'VeryLazy',
  dependencies = {
    "nvim-lua/plenary.nvim",

  },
  config = function(opts)
    local actions = require("telescope.actions")
    local icons = require("alchr.config.icons")

    local status, telescope = pcall(require, "telescope")
    if not status then
      return
    end
    require('telescope').setup(opts)

    telescope.setup({
      file_ignore_patterns = { "%.git/." },
      defaults = {
        mappings = {
          n = {
            ["q"] = actions.close,
          },
        },
        layout_config = {
          prompt_position = "top",
          vertical = { width = 0.5 }
        },
        vimgrep_arguments = {
          "rg",
          "--hidden",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--glob=!.git/*",
          "--glob=!node_modules/*",
        },
        prompt_prefix = icons.ui.Search .. " ",
        selection_caret = icons.ui.TriangleShortArrowRight .. " ",
        initial_mode = "insert",
        select_strategy = "reset",
        sorting_strategy = "ascending",
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        pickers = {
          find_files = {
            find_command = {
              "rg",
              "--hidden",
              "--files",
              "--glob=!.git/*",
              "--glob=!node_modules/*",
            },
          },
        },
      },
    })
  end,
  keys = {
    { "<leader><space>", "<cmd>Telescope resume<cr>", desc = "Telescope resume" },
    { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
    { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Find in Files (Grep)" },
    { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
    -- find
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    {
      "<leader>fF",
      function()
        require("telescope.builtin").find_files({ hidden = true, no_ignore = false })
      end,
      desc = "Find Files (+hidden)",
    },
    {
      "<leader>sW",
      function()
        local word = vim.fn.expand("<cword>")
        require("telescope.builtin").grep_string({ search = word })
      end,
      desc = "Search Word Under Cursor",
    },
    {
      "<leader>su",
      function()
        local word = vim.fn.expand("<cWORD>")
        require("telescope.builtin").grep_string({ search = word })
      end,
      desc = "Search Static Under Cursor",
    },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
    -- git
    { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
    { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
    -- search
    { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
    { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
    { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
    { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
    { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
    { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
    { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
    { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
    { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
    { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
    { "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "Word" },
  },
}

