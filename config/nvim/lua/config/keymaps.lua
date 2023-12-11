-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

local opts = { noremap = true, silent = true }

-- do not yank with x
keymap.set("n", "x", '"_x', { silent = true })

-- select all
keymap.set("n", "<C-a>", "gg<S-v>G", { silent = true, desc = "Select all" })

-- better up/down
keymap.set("n", "j", "v:count == 1 ? 'gj' : 'j'", { expr = true, silent = true })
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- better paging
keymap.set("n", "<C-d>", "<C-d>zz", { silent = true, desc = "Page down" })
keymap.set("n", "<C-u>", "<C-u>zz", { silent = true, desc = "Page up" })

-- Move to window using the <ctrl> hjkl keys
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize window using <ctrl> arrow keys
keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- better indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- lazy
keymap.set("n", "<leader>lz", "<cmd>:Lazy<cr>", { desc = "Lazy" })

-- Clear search with <esc>
keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
-- Use n to always search forward and N to always backward
keymap.set("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
keymap.set("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Insert empty lines
keymap.set("n", "<A-O>", "O<Esc>", { desc = "Insert empty line above" })
keymap.set("n", "<A-o>", "o<Esc>", { desc = "Insert empty line below" })

-- Clear search, diff update and redraw
keymap.set(
  "n",
  "<leader>ur",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw / clear hlsearch / diff update" }
)

-- Move Lines
keymap.set("n", "<A-j>", ":m .+1<cr>==", { desc = "Move down" })
keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
keymap.set("i", "<A-j>", "<Esc>:m .+1<cr>==gi", { desc = "Move down" })
keymap.set("n", "<A-k>", ":m .-2<cr>==", { desc = "Move up" })
keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
keymap.set("i", "<A-k>", "<Esc>:m .-2<cr>==gi", { desc = "Move up" })

-- windows
keymap.set("n", "<leader>ww", "<C-W>p", { desc = "Other window"})
keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete window"})
keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split window right"})
keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split window below"})
keymap.set("n", "<leader>we", "<C-W>=", { desc = "Equalize windows"})

-- Buffers
keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer"})
keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer"})
keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer"})
keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer"})

-- tabs
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tc", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- save file
keymap.set("n", "<leader>w", ":write!<CR>", opts)

-- quit current
keymap.set("n", "<leader>q", ":q!<CR>", opts)

-- quit all
keymap.set("n", "<leader>Q", "qa!<CR>", opts)

-- new file
keymap.set("n", "<leader>nf", "<cmd>enew<cr>", { desc = "New File" })

-- Paste over currently selected text without yanking it
keymap.set("v", "p", '"_dp"')
keymap.set("v", "P", '"_dP"')

-- copy everything between { and } including the brackets
-- p puts text after the cursor,
-- P puts text before the cursor.

-- Select a block of text in curly braces and copy it to the clipboard
keymap.set("n", "YY", "va{Vy}")

-- Exit on jj and jk
keymap.set("i", "jj", "<ESC>", opts)
keymap.set("i", "jk", "<ESC>", opts)

-- Move to start/end of line
keymap.set({'n', 'x', 'o'}, 'H', '^', opts)
keymap.set({'n', 'x', 'o'}, 'L', '$', opts)

-- Todo comments
keymap.set("n", "<leader>t", ":TodoTelescope keywords=TODO<cr>")
keymap.set("n", "<leader>T", ":TodoTelescope keywords=TODO,FIX,FIXME,REMINDER<cr>")
keymap.set("n", "<leader>x", ":TodoTrouble<cr>")
keymap.set("n", "<leader>X", ":TodoTrouble keywords=TODO,FIX,FIXME<cr><cr>")

-- Trouble
keymap.set("n", "<leader>l", ":TroubleToggle document_diagnostics<cr>")
keymap.set("n", "<leader>L", ":TroubleToggle workspace_diagnostics<cr>")

-- Split line with X
keymap.set('n', 'X', ':keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<cr>', { silent = true })


-- Toggle the fold column visibility
keymap.set('n', '<leader>fc', ':lua ToggleFoldColumn()<CR>', opts)
