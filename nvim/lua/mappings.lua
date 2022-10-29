-- Set j and k to move one displayed line (ignore wrapping)
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true })
vim.api.nvim_set_keymap("v", "j", "gj", { noremap = true })
vim.api.nvim_set_keymap("v", "k", "gk", { noremap = true })

-- Navigate down/up/left/right five displayed lines
vim.api.nvim_set_keymap("n", "<C-j>", "5gj", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "5gk", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-h>", "5h", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", "5l", { noremap = true })
vim.api.nvim_set_keymap("v", "<C-j>", "5gj", { noremap = true })
vim.api.nvim_set_keymap("v", "<C-k>", "5gk", { noremap = true })
vim.api.nvim_set_keymap("v", "<C-h>", "5h", { noremap = true })
vim.api.nvim_set_keymap("v", "<C-l>", "5l", { noremap = true })

-- <A-;>/<A-'> as escape key
vim.api.nvim_set_keymap("", "<A-;>", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("", "<A-'>", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("s", "<A-;>", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("s", "<A-'>", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("t", "<A-;>", "<C-\\><C-n>", { noremap = true })
vim.api.nvim_set_keymap("t", "<A-'>", "<C-\\><C-n>", { noremap = true })

-- Set Ctrl-W to delete whole word properly
vim.api.nvim_set_keymap("i", "<C-w>", "<Esc>gi<C-w>", { noremap = true })

-- Tab new/close
vim.api.nvim_set_keymap("", "<A-=>", "<Cmd>tabnew<CR>", { noremap = true })
vim.api.nvim_set_keymap("", "<A-->", "<Cmd>tabclose<CR>", { noremap = true })

-- Terminal
vim.api.nvim_set_keymap("", "<C-t>", "<Cmd>sp<CR><C-w>w<Cmd>term<CR>i", { noremap = true })
vim.api.nvim_set_keymap("", "<A-t>", "<Cmd>vsp<CR><C-w>w<Cmd>term<CR>i", { noremap = true })

-- Telescope
vim.api.nvim_set_keymap("n", "<Leader>b", "<Cmd>Telescope buffers<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>h", "<Cmd>Telescope help_tags<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>g", "<Cmd>Telescope live_grep<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>f", "<Cmd>Telescope find_files<CR>", { noremap = true })
