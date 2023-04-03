-- Comma as leader
vim.g.mapleader = ','

-- Autosave configuration
vim.g.auto_save_events = { "InsertLeave", "TextChanged", "CursorHold", "CursorHoldI" }
vim.g.auto_save_silent = 1
vim.g.auto_save = 1

-- Updatetime for autosave
vim.opt.updatetime = 1000

-- Save undo history
vim.opt.undodir = vim.fn.expand("~/.nvim/undodir")
vim.opt.undofile = true

-- Use :help instead of :Man to prevent freezes
vim.opt.keywordprg = ':help'

-- Enables mouse support
vim.opt.mouse = "a"

-- Alignment tabs are 2 spaces wide, and never tabs
-- Real tabs render as 4 spaces wide. Applicable to languages like Python.
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 4

-- Show tabline at the top
vim.opt.showtabline = 2

-- Show line numbers on the left
vim.opt.number = true

-- Show signcolumn for diagnostic info
vim.opt.signcolumn = "yes:1"

-- Enable shared clipboard
vim.opt.clipboard:append({ 'unnamed', 'unnamedplus' })

-- Disable swap files
vim.opt.swapfile = false

-- Enables 24-bit RGB color in the TUI
vim.opt.termguicolors = true

-- Folding options
vim.opt.foldmethod = "marker"
vim.opt.foldmarker = "<--,-->"

-- Enables smart case insensitive searches
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- No timeout for mappings
vim.opt.timeout = false
