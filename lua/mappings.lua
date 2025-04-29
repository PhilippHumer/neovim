require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local sign_define = vim.fn.sign_define

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("v", "aa", "<ESC>gg0vGg_", {desc = "mark all"})
map("n", "gD", function () vim.lsp.buf.declaration() end, {desc="go to declaration"})
map("n", "gd", function () vim.lsp.buf.definition() end, {desc="go to definition"})

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

--project manager
--map("n", "<leader>cp", "<cmd> NeovimProjectHistory <CR>", { desc = "Change Project"})
