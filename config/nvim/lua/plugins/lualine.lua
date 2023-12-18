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
-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

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
        component_separators = '|',
        section_separators = { left = '', right = '' },
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
        lualine_a = {
          { 'mode', separator = { left = '' }, right_padding = 2 },
        },
        lualine_b = {
          {
            "filename",
            symbols = {
              modified = "󱩼",
              readonly = "",
              unnamed = ""
            }
          }
        },
        lualine_c = { { "diagnostics", sources = { "nvim_lsp" }, symbols = { error = " ", warn = " ", info = " " } }, { "searchcount" }},
        lualine_x = { {'diff',  source = diff_source }, { 'b:gitsigns_head', separator = { left = '' },  icon = '' }},
        lualine_y = {},
        lualine_z = { { 'location', separator = { right = '' }, left_padding = 2 }},
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
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
