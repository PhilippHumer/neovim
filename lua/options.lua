require "nvchad.options"

-- add yours here!
require('dap.ext.vscode').load_launchjs(nil, {})

require("dap-python").setup("/home/philipp/anaconda3/bin/python")

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
