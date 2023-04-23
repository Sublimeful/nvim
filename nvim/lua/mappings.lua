-- Define options for mappings
local opts = { noremap = true }

-- Set j and k to move one displayed line (ignore wrapping)
vim.api.nvim_set_keymap("n", "j", "gj", opts)
vim.api.nvim_set_keymap("n", "k", "gk", opts)
vim.api.nvim_set_keymap("v", "j", "gj", opts)
vim.api.nvim_set_keymap("v", "k", "gk", opts)
vim.api.nvim_set_keymap("s", "j", "j", opts)
vim.api.nvim_set_keymap("s", "k", "k", opts)

-- Navigate down/up/left/right five displayed lines
vim.api.nvim_set_keymap("n", "<C-j>", "5gj", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "5gk", opts)
vim.api.nvim_set_keymap("n", "<C-h>", "5h", opts)
vim.api.nvim_set_keymap("n", "<C-l>", "5l", opts)
vim.api.nvim_set_keymap("v", "<C-j>", "5gj", opts)
vim.api.nvim_set_keymap("v", "<C-k>", "5gk", opts)
vim.api.nvim_set_keymap("v", "<C-h>", "5h", opts)
vim.api.nvim_set_keymap("v", "<C-l>", "5l", opts)

-- <A-;>/<A-'> as escape keys, disable default keybinds for ; and '
vim.api.nvim_set_keymap("", ";", "<Nop>", opts)
vim.api.nvim_set_keymap("", "'", "<Nop>", opts)
vim.api.nvim_set_keymap("s", ";", ";", opts)
vim.api.nvim_set_keymap("s", "'", "'", opts)
vim.api.nvim_set_keymap("n", "r<A-;>", "<Esc>", opts)
vim.api.nvim_set_keymap("n", "r<A-'>", "<Esc>", opts)
vim.api.nvim_set_keymap("t", "<A-;>", "<C-\\><C-n>", opts)
vim.api.nvim_set_keymap("t", "<A-'>", "<C-\\><C-n>", opts)

-- Ctrl-W to delete whole word properly
vim.api.nvim_set_keymap("i", "<C-w>", "<Esc>gi<C-w>", opts)

-- Tab new/close
vim.api.nvim_set_keymap("", "<A-=>", "<Cmd>tabnew<CR>", opts)
vim.api.nvim_set_keymap("", "<A-->", "<Cmd>tabclose<CR>", opts)
vim.api.nvim_set_keymap("i", "<A-=>", "<Esc><Cmd>tabnew<CR>", opts)
vim.api.nvim_set_keymap("i", "<A-->", "<Esc><Cmd>tabclose<CR>", opts)
vim.api.nvim_set_keymap("t", "<A-=>", "<C-\\><C-n><Cmd>tabnew<CR>", opts)
vim.api.nvim_set_keymap("t", "<A-->", "<C-\\><C-n><Cmd>tabclose<CR>", opts)

-- Tab navigation
for i = 1, 9 do
  vim.api.nvim_set_keymap("", "<A-"..i..">", "<Cmd>tabn "..i.."<CR>", opts)
  vim.api.nvim_set_keymap("i", "<A-"..i..">", "<Esc><Cmd>tabn "..i.."<CR>", opts)
  vim.api.nvim_set_keymap("t", "<A-"..i..">", "<C-\\><C-n><Cmd>tabn "..i.."<CR>", opts)
end

-- Terminal
vim.api.nvim_set_keymap("", "<C-t>", "<Cmd>sp<CR><C-w>w<Cmd>term<CR>i", opts)
vim.api.nvim_set_keymap("", "<A-t>", "<Cmd>vsp<CR><C-w>w<Cmd>term<CR>i", opts)
vim.api.nvim_set_keymap("", "<C-A-T>", "<Cmd>term<CR>i", opts)

-- Telescope
vim.api.nvim_set_keymap("n", ",b", "<Cmd>Telescope buffers<CR>", opts)
vim.api.nvim_set_keymap("n", ",h", "<Cmd>Telescope help_tags<CR>", opts)
vim.api.nvim_set_keymap("n", ",g", "<Cmd>Telescope live_grep<CR>", opts)
vim.api.nvim_set_keymap("n", ",f", "<Cmd>Telescope find_files<CR>", opts)
