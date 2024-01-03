return{
  {
    "kyazdani42/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({
        -- your personnal icons can go here (to override)
        -- DevIcon will be appended to `name`
        override = {},
        -- globally enable default icons (default to false)
        -- will get overriden by `get_icons` option
        default = true,
      })
    end,
  },
  -- displays colors inline (hex, etc)
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      filetypes = {
        "css",
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        html = { mode = "foreground" },
      },
      user_default_options = {
        tailwind = true,
        css = true,
      },
    },
  },
}
