local opt = vim.opt
require 'custom.configs.autocommands'
-- highlight current line
opt.cursorline = true

-- Numbers
opt.number = true
opt.relativenumber = true

-- ding ding!
opt.errorbells = false

-- don't wrap long lines
opt.wrap = false

-- scroll offwidth so it's not the very bottom
opt.scrolloff = 6

-- vertical command window higher
opt.cmdwinheight = 6

-- command line higher
opt.cmdheight = 2

-- -- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd[[
    augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=201})
    augroup END
]]
