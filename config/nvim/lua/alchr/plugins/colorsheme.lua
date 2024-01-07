-- colorsheme inspired in https://github.com/jesseleite/nvim-noirbuddy
return{
  {
    "catppuccin/nvim",
    enabled = true,
    priority = 1000,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        background = {
          light = "latte",
          dark = "mocha",
        },
        color_overrides = {
          mocha = {
            rosewater = "#cfcfcf",
            flamingo = "#a7a7a7",
            pink = "#636363",
            mauve = "#cfcfcf",
            red = "#cfcfcf",
            maroon = "#d8d8d9",
            peach = "#e3609a",
            yellow = "#cfcfcf",
            green = "#e3609a",
            teal = "#a7a7a7",
            sky = "#555557",
            sapphire = "#d8d8d9",
            blue = "#d8d8d9",
            lavender = "#a7a7a7",
            text = "#aeaeae",
            subtext1 = "#BDAE8B",
            subtext0 = "#A69372",
            overlay2 = "#555557",
            overlay1 = "#735F3F",
            overlay0 = "#535353",
            surface2 = "#737373",
            surface1 = "#2f2f2f",
            surface0 = "#232728",
            base = "#18181a",
            mantle = "#242424",
            crust = "#272727",
          },
        },
        styles = {
          comments = { "italic" },
          conditionals = {},
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        transparent_background = true,
        show_end_of_buffer = false,
        no_italic = true,
        custom_highlights = function(colors)
          return {
           FloatBorder = { bg = colors.surface0, fg = colors.surface0 },
           VertSplit = { bg = colors.red, fg = colors.red },
           CursorLineNr = { fg = colors.surface2 },
           Pmenu = { bg = colors.base },
           PmenuSel = { bg = colors.crust },
           PmenuThumb = { bg = colors.crust, fg = colors.crust },
           MatchParent = { fg = colors.peach },
           IlluminatedWordText = { bg = colors.surface1 },
           IlluminatedWordRead = { bg = colors.surface1 },
           IlluminatedWordWrite = { bg = colors.surface1 },
           CmpItemMenu = { fg = colors.surface2 },
           NormalFloat = { bg = colors.base },
          }
        end,
      })

      vim.api.nvim_command("colorscheme catppuccin")
    end,
  },
}


