return{
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        transparent = true,
        style = "night",
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
        on_highlights = function(hl, c)
          local prompt = "#323244"
          hl.MatchParen = { bg = c.fg_gutter }
          hl.TelescopePromptPrefix = { fg = prompt }
          hl.TelescopeSelection = { bg = c.bg }
          hl.TelescopeSelectionCaret = { bg = c.bg, fg = c.blue }
          hl.TelescopeBorder = { fg = prompt}
          -- hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
          -- hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
          -- hl.TelescopePromptNormal = { bg = prompt }
          -- hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
          -- hl.TelescopePromptTitle = { bg = prompt, fg = prompt }
          -- hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
          -- hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
        end,
      })
      vim.cmd.colorscheme 'tokyonight-night'
    end
  },
}


