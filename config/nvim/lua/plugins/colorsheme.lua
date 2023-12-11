return{
  {
    "folke/tokyonight.nvim",
    lazy = false,
    enabled = true,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        on_highlights = function(hl, c)
          local prompt = "#323244"
          hl.TelescopeSelection = { bg = c.bg }
          hl.TelescopeSelectionCaret = { bg = c.bg, fg = c.blue }
          hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
          hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
          hl.TelescopePromptNormal = { bg = prompt }
          hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
          hl.TelescopePromptTitle = { bg = prompt, fg = prompt }
          hl.TelescopePromptPrefix = { bg = prompt, fg = c.blue }
          hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
          hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
        end,
      })
      vim.cmd.colorscheme 'tokyonight-night'
    end
  },
}
