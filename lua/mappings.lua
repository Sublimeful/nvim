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


-- Allow for smoother navigation in visual line mode
vim.api.nvim_set_keymap("v", "<S-j>", "j", opts)
vim.api.nvim_set_keymap("v", "<S-k>", "k", opts)


-- Buf new/close/restore
vim.api.nvim_set_keymap("", "<A-=>", "<Cmd>tabnew<CR>", opts)
vim.api.nvim_set_keymap("", "<A-->", "<Cmd>BufferClose<CR>", opts)
vim.api.nvim_set_keymap("", "<S-A-=>", "<Cmd>BufferRestore<CR>", opts)
vim.api.nvim_set_keymap("i", "<A-=>", "<Esc><Cmd>tabnew<CR>", opts)
vim.api.nvim_set_keymap("i", "<A-->", "<Esc><Cmd>BufferClose<CR>", opts)
vim.api.nvim_set_keymap("i", "<S-A-=>", "<Esc><Cmd>BufferRestore<CR>", opts)
vim.api.nvim_set_keymap("t", "<A-=>", "<C-\\><C-n><Cmd>tabnew<CR>", opts)
vim.api.nvim_set_keymap("t", "<A-->", "<C-\\><C-n><Cmd>BufferClose<CR>", opts)
vim.api.nvim_set_keymap("t", "<S-A-=>", "<C-\\><C-n><Cmd>BufferRestore<CR>", opts)


-- Buf navigation
for i = 1, 9 do
  vim.api.nvim_set_keymap("", "<A-"..i..">", "<Cmd>BufferGoto "..i.."<CR>", opts)
  vim.api.nvim_set_keymap("i", "<A-"..i..">", "<Esc><Cmd>BufferGoto "..i.."<CR>", opts)
  vim.api.nvim_set_keymap("t", "<A-"..i..">", "<C-\\><C-n><Cmd>BufferGoto "..i.."<CR>", opts)
end
vim.api.nvim_set_keymap("", "<A-]>", "<Cmd>BufferNext<CR>", opts)
vim.api.nvim_set_keymap("", "<A-[>", "<Cmd>BufferPrevious<CR>", opts)
vim.api.nvim_set_keymap("", "<S-A-]>", "<Cmd>BufferMoveNext<CR>", opts)
vim.api.nvim_set_keymap("", "<S-A-[>", "<Cmd>BufferMovePrevious<CR>", opts)
vim.api.nvim_set_keymap("i", "<A-]>", "<Esc><Cmd>BufferNext<CR>", opts)
vim.api.nvim_set_keymap("i", "<A-[>", "<Esc><Cmd>BufferPrevious<CR>", opts)
vim.api.nvim_set_keymap("i", "<S-A-]>", "<Esc><Cmd>BufferMoveNext<CR>", opts)
vim.api.nvim_set_keymap("i", "<S-A-[>", "<Esc><Cmd>BufferMovePrevious<CR>", opts)
vim.api.nvim_set_keymap("t", "<A-]>", "<C-\\><C-n><Cmd>BufferNext<CR>", opts)
vim.api.nvim_set_keymap("t", "<A-[>", "<C-\\><C-n><Cmd>BufferPrevious<CR>", opts)
vim.api.nvim_set_keymap("t", "<S-A-]>", "<C-\\><C-n><Cmd>BufferMoveNext<CR>", opts)
vim.api.nvim_set_keymap("t", "<S-A-[>", "<C-\\><C-n><Cmd>BufferMovePrevious<CR>", opts)


-- Buf Pinning
vim.api.nvim_set_keymap("", "<A-p>", "<Cmd>BufferPin<CR>", opts)
vim.api.nvim_set_keymap("i", "<A-p>", "<Esc><Cmd>BufferPin<CR>", opts)
vim.api.nvim_set_keymap("t", "<A-p>", "<C-\\><C-n><Cmd>BufferPin<CR>", opts)


-- Terminal
vim.api.nvim_set_keymap("", "<C-t>", "<Cmd>sp<CR><C-w>w<Cmd>term<CR>i", opts)
vim.api.nvim_set_keymap("", "<A-t>", "<Cmd>vsp<CR><C-w>w<Cmd>term<CR>i", opts)
vim.api.nvim_set_keymap("", "<C-A-T>", "<Cmd>term<CR>i", opts)


-- Telescope

-- File Pickers
vim.api.nvim_set_keymap("n", ",f", "<Cmd>Telescope find_files<CR>", opts)
vim.api.nvim_set_keymap("n", ",F", "<Cmd>Telescope git_files<CR>", opts)
vim.api.nvim_set_keymap("n", ",g", "<Cmd>Telescope live_grep<CR>", opts)

-- Vim Pickers
vim.api.nvim_set_keymap("n", ",b", "<Cmd>Telescope buffers<CR>", opts)
vim.api.nvim_set_keymap("n", ",h", "<Cmd>Telescope oldfiles<CR>", opts)
vim.api.nvim_set_keymap("n", ",m", "<Cmd>Telescope keymaps<CR>", opts)

-- LSP Pickers
vim.api.nvim_set_keymap("n", ",r", "<Cmd>Telescope lsp_references<CR>", opts)
vim.api.nvim_set_keymap("n", ",ci", "<Cmd>Telescope lsp_incoming_calls<CR>", opts)
vim.api.nvim_set_keymap("n", ",co", "<Cmd>Telescope lsp_outgoing_calls<CR>", opts)
vim.api.nvim_set_keymap("n", ",sd", "<Cmd>Telescope lsp_document_symbols<CR>", opts)
vim.api.nvim_set_keymap("n", ",sw", "<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>", opts)
vim.api.nvim_set_keymap("n", ",e", "<Cmd>Telescope diagnostics<CR>", opts)
vim.api.nvim_set_keymap("n", ",i", "<Cmd>Telescope lsp_implementations<CR>", opts)
vim.api.nvim_set_keymap("n", ",d", "<Cmd>Telescope lsp_definitions<CR>", opts)
vim.api.nvim_set_keymap("n", ",t", "<Cmd>Telescope lsp_type_definitions<CR>", opts)

-- Git Pickers
vim.api.nvim_set_keymap("n", ",Gc", "<Cmd>Telescope git_commits<CR>", opts)
vim.api.nvim_set_keymap("n", ",GB", "<Cmd>Telescope git_bcommits<CR>", opts)
vim.api.nvim_set_keymap("v", ",GB", "<Cmd>Telescope git_bcommits_range<CR>", opts)
vim.api.nvim_set_keymap("n", ",Gb", "<Cmd>Telescope git_branches<CR>", opts)
vim.api.nvim_set_keymap("n", ",Gs", "<Cmd>Telescope git_status<CR>", opts)
vim.api.nvim_set_keymap("n", ",GS", "<Cmd>Telescope git_stash<CR>", opts)


-- nvim-tree
vim.api.nvim_set_keymap("n", "<C-b>", "<Cmd>NvimTreeToggle<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-A-B>", "<Cmd>NvimTreeFindFile<CR>", opts)
