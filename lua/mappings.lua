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
map('n', '<F5>',  function() dap.continue() end, {desc="Debug: continue"})
map('n', '<F9>', function() dap.step_over() end, {desc="Debug: step over"})
map('n', '<F7>', function() dap.step_into() end, {desc="Debug: step into"})
map('n', '<F8>', function() dap.step_out() end, {desc="Debug: step out"})
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line"})
map("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Start or continue the debugger"})
sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})

map('n', "<leader>ca", function () vim.lsp.buf.code_action() end)

--windsurf-codeium
-- Remove the `use` here if you're using folke/lazy.nvim.
-- use {
--   'Exafunction/windsurf.vim',
--   config = function ()
--     -- Change '<C-g>' here to any keycode you like.
--     vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
--     vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
--     vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
--     vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
--   end
-- }

--project manager
--map("n", "<leader>cp", "<cmd> NeovimProjectHistory <CR>", { desc = "Change Project"})
