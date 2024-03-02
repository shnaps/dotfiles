local opt = vim.opt

-- trigger for java
require "custom.configs.jdtls"

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
