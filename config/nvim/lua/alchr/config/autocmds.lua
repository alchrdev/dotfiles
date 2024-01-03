local api = vim.api

local colors = {
  fg = "#24283b",
  bg = "#1f2335",
}

-- don't auto comment new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- change the background color of floating windows and borders.
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.cmd('highlight NormalFloat guibg=none guifg=none')
    vim.cmd('highlight FloatBorder guifg=' .. colors.fg .. ' guibg=none')
    vim.cmd('highlight NormalNC guibg=none guifg=none')
    -- CursorLine
    vim.cmd('highlight CursorLine guibg=none guifg=none')
    -- Harpoon
    vim.cmd('highlight HarpoonBorder guibg=none guifg=#24283b')
  end,
})

-- highlight on yank
api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- go to last loc when opening a buffer
api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- resize neovim split when terminal is resized
vim.api.nvim_command("autocmd VimResized * wincmd =")

-- adjust the height of the command bar during macro recording
api.nvim_create_autocmd("RecordingEnter", {
    command = [[set cmdheight=1]]
})

api.nvim_create_autocmd("RecordingLeave", {
    command = [[set cmdheight=0]]
})

-- wipe all registers on start
api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Wipe lowercase letter registers
    for i = 97, 122 do 
      vim.fn.setreg(string.char(i), {})
    end
    -- Wipe number registers
    for i = 48, 57 do
      vim.fn.setreg(string.char(i), {})
    end
  end,
})
