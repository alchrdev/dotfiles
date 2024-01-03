return {
  "folke/trouble.nvim",
  cmd = { "TroubleToggle", "Trouble" },
  opts = { use_diagnostic_signs = true },
  lazy = true,
  config = function()
    require("trouble").setup {
      icons = false,
    }
  end,
  keys = {
    {
      "<leader>tt",
      function()
        require("trouble").toggle()
      end,
      desc = "Toggle Trouble"
    },
    {
      "<leader>tn",
      function()
        require("trouble").next({skip_groups = true, jump = true });
      end,
      desc = "Next Trouble"
    },
    {
      "<leader>tp",
      function()
        require("trouble").previous({skip_groups = true, jump = true });
      end,
      desc = "Previous Trouble"
    },
  }
}
