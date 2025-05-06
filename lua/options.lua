require "nvchad.options"

-- add yours here!
require('dap.ext.vscode').load_launchjs(nil, {})

require("dap-python").setup("/home/philipp/anaconda3/bin/python")

local dap = require('dap')
dap.configurations.java = {
    {
        type = 'java',
        request = 'launch',
        name = 'Launch Java'
    }
}

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.api.nvim_set_option("clipboard","unnamed") 
-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
