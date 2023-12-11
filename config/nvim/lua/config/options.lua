local options = {
	incsearch = true, -- make search act like search in modern browsers
	backup = false, -- creates a backup file
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	cmdheight = 0, -- more space in the neovim command line for displaying messages
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 0, -- so that `` is visible in markdown files
	fileencoding = "utf-8", -- the encoding written to a file
	encoding = "utf-8",
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	mouse = "a", -- allow the mouse to be used in neovim
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 0, -- always show tabs
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	termguicolors = true, -- set term gui colors (most terminals support this)
	timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- enable persistent undo
	updatetime = 100, -- faster completion (4000ms default)
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = true, -- convert tabs to spaces
	shiftwidth = 2, -- the number of spaces inserted for each indentation
	tabstop = 2, -- insert 2 spaces for a tab
	cursorline = true, -- highlight the current line
	number = true, -- set numbered lines
	breakindent = true, -- wrap lines with indent
	relativenumber = true, -- set relative numbered lines
	numberwidth = 4, -- set number column width to 2 {default 4}
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	wrap = true, -- display lines as one long line
	linebreak = true, -- wrap long lines at word boundaries
	scrolloff = 8, -- Makes sure there are always eight lines of context
	sidescrolloff = 8, -- Makes sure there are always eight lines of context
	laststatus = 0, -- Always display the status line
	showcmd = false, -- Don't show the command in the last line
	ruler = false, -- Don't show the ruler
	guifont = "monospace:h17", -- the font used in graphical neovim applications
	title = true, -- set the title of window to the value of the titlestring
	confirm = true, -- confirm to save changes before exiting modified buffer
	fillchars = { eob = " ", fold = " " }, -- change the character at the end of buffer
	-- cursorlineopt = "number", -- set the cursorline
}


for k, v in pairs(options) do
	vim.opt[k] = v
end


-- Switches the visibility of the fold column on and off
function _G.ToggleFoldColumn()
    if vim.wo.foldcolumn == "0" then
        vim.wo.foldcolumn = "1"
    else
        vim.wo.foldcolumn = "0"
    end
end

-- Toggles fold display between first and last line
vim.wo.foldtext = [[v:lua.MyFoldText()]]
function _G.MyFoldText()
  local start_line = vim.fn.getline(vim.v.foldstart)
  local end_line = vim.fn.getline(vim.v.foldend)
  return start_line:gsub("%s+$", "") .. " ... " .. end_line:gsub("^%s+", "")
end
