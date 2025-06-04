-- <{{ Comma as leader key
vim.g.mapleader = ","
-- }}>

-- <{{ Autosave settings
vim.g.auto_save_events = { "InsertLeave", "TextChanged", "CursorHold", "CursorHoldI" }
vim.g.auto_save_silent = 1
vim.g.auto_save = 1
vim.opt.updatetime = 1000
-- }}>

-- <{{ Save undo history
vim.opt.undofile = true
-- }}>

-- <{{ Use :help instead of :Man to prevent freezes
vim.opt.keywordprg = ":help"
-- }}>

-- <{{ Enables mouse support
vim.opt.mouse = "a"
vim.opt.mousescroll = "ver:1,hor:1"
-- }}>

-- <{{ Tab settings
-- Alignment tabs are 2 spaces wide, and never tabs
-- Real tabs render as 4 spaces wide. Applicable to languages like Python.
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 4
-- }}>

-- <{{ Show tabline at the top
vim.opt.showtabline = 2
-- }}>

-- <{{ Highlight line cursor
vim.opt.cursorline = false
-- }}>

-- <{{ Show line numbers on the left
vim.opt.number = true
-- }}>

-- <{{ Show signcolumn for diagnostic info
vim.opt.signcolumn = "yes:1"
-- }}>

-- <{{ Enable shared clipboard
vim.opt.clipboard:append({ "unnamed", "unnamedplus" })
-- }}>

-- <{{ Enables 24-bit RGB color in the TUI
vim.opt.termguicolors = true
-- }}>

-- <{{ Folding options
vim.opt.foldmethod = "marker"
vim.opt.foldmarker = "<{{,}}>"
-- }}>

-- <{{ Enables smart case insensitive searches
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- }}>

-- <{{ No timeout for mappings
vim.opt.timeout = false
-- }}>

-- <{{ nvim-tree settings
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- }}>
