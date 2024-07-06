-- [[ Basic Keymaps ]]
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>qq", ":q<enter>")
vim.keymap.set("n", "<leader>wf", ":w<enter>")
vim.keymap.set("n", "<leader>ex", ":Ex<enter>")
vim.keymap.set("n", "<A-t>", ":")
vim.keymap.set("", "<A-e>", "<Esc>", { noremap = true })

vim.keymap.set("n", "<leader>bn", ":bn<enter>")
vim.keymap.set("n", "<leader>bp", ":bp<enter>")

vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<leader>fo", vim.lsp.buf.format)

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>em", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>qf", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<arrowkeys> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-left>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-right>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-down>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-up>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle, { desc = "Toggle undo tree plugin" })

-- [[ Setting options ]]
vim.g.have_nerd_font = true

vim.opt.wrap = false

vim.opt.termguicolors = true

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.mouse = "a"

vim.opt.clipboard = "unnamedplus" -- ?

vim.opt.swapfile = false

-- Enable break indent
vim.opt.breakindent = true -- ?

-- Save undo histor
vim.opt.undofile = true -- ?

-- Case-insensitive searching UNLESS \C or
-- one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes" -- ?

-- Decrease update time
vim.opt.updatetime = 500

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
-- vim.opt.timeoutlen = 5000
vim.opt.timeout = false

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = false

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 50

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Show the mode
vim.opt.showmode = true

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	command = 'if expand("%") == "" | edit . | endif',
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require("lazy-plugins")
require("colorizer").setup()
vim.cmd("colorscheme rose-pine-moon")
--vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("set expandtab")
vim.cmd("let g:sneak#label = 1")
vim.cmd("let g:sneak#s_next = 1")
vim.cmd("let g:sneak#use_ic_scs = 1")
vim.cmd("map f <Plug>Sneak_s")
vim.cmd("map F <Plug>Sneak_S")

-- vim: ts=2 sts=2 sw=2 et
