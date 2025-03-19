require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local sign_define = vim.fn.sign_define

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

--custom for german keyboard
map("n", "ü", "{");
map("n", "ö", "}");

--dap
local dap = require("dap")
map('n', '<F5>',  function() dap.continue() end)
map('n', '<F9>', function() dap.step_over() end)
map('n', '<F11>', function() dap.step_into() end)
map('n', '<F12>', function() dap.step_out() end)
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line"})
map("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Start or continue the debugger"})
sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
