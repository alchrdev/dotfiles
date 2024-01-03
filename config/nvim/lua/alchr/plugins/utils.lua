return{
  -- git
    {
      "tpope/vim-fugitive",
      config = function()
        vim.api.nvim_set_keymap("n", "<leader>gf", "<cmd>tab +Git<cr>", { noremap = true, silent = true })
      end
  },
}
