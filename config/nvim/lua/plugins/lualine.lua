local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed
    }
  end
end

return {
  "nvim-lualine/lualine.nvim",
  enabled = true,
  lazy = false,
  event = { "BufReadPost", "BufNewFile", "VeryLazy" },
  config = function()
    require("lualine").setup {
      options = {
        theme = "auto",
        icons_enabled = true,
        section_separators = "",
        component_separators = "",
        disabled_filetypes = {
          statusline = {
            'help',
            -- 'startify',
            -- 'dashboard',
            -- 'neo-tree',
            -- 'packer',
            -- 'neogitstatus',
            -- 'NvimTree',
            'Trouble',
            'alpha',
            'lir',
            'Outline',
            -- 'spectre_panel',
            -- 'toggleterm',
            'qf',
          },
          winbar = {},
        },
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          -- "filename",
          -- {
          --   "filetype",
          --   icon_only = true,
          --   separator = "",
          --   padding = {
          --     left = 1, right = 0 }
          -- },
          {
            "filename",
            path = 1,
            symbols = {
              modified = "󱩼",
              readonly = "",
              unnamed = ""
            }
          },
          { "diagnostics", sources = { "nvim_lsp" }, symbols = { error = " ", warn = " ", info = " " } },
          { "searchcount" }
        },
        lualine_x = { "mode", { 'diff', source = diff_source }, { 'b:gitsigns_head', icon = '' }, "progress" },
        lualine_y = {},
        lualine_z = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { "fugitive" },
    }

    -- Make statusbar transparent
  --   local custom_theme = require("lualine.themes.gruvbox")
  --     for _, mode in pairs(custom_theme) do
  --       for section_name, section in pairs(mode) do
  --         if section_name ~= "a" then
  --           section.bg = "none"
  --         end
  --       end
  --     end
  --     require("lualine").setup({
  --       options = {
  --         theme = custom_theme,
  --       },
  --     })
  end,
}