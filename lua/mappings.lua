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

-- Buffer new/close
vim.api.nvim_set_keymap("", "<A-=>", "<Cmd>enew<CR>", opts)
vim.api.nvim_set_keymap("", "<A-->", "<Cmd>Bdelete!<CR>", opts)
vim.api.nvim_set_keymap("i", "<A-=>", "<Esc><Cmd>enew<CR>", opts)
vim.api.nvim_set_keymap("i", "<A-->", "<Esc><Cmd>Bdelete!<CR>", opts)
vim.api.nvim_set_keymap("t", "<A-=>", "<C-\\><C-n><Cmd>enew<CR>", opts)
vim.api.nvim_set_keymap("t", "<A-->", "<C-\\><C-n><Cmd>Bdelete!<CR>", opts)

-- Buffer navigation
vim.api.nvim_set_keymap("", "<A-0>", "<Cmd>lua require('bufferline').go_to(1, true)<CR>", opts)
vim.api.nvim_set_keymap("i", "<A-0>", "<Esc><Cmd>lua require('bufferline').go_to(1, true)<CR>", opts)
vim.api.nvim_set_keymap("t", "<A-0>", "<C-\\><C-n><Cmd>lua require('bufferline').go_to(1, true)<CR>", opts)
for i = 1, 9 do
  vim.api.nvim_set_keymap("", "<A-" .. i .. ">", "<Cmd>BufferLineGoToBuffer " .. i .. "<CR>", opts)
  vim.api.nvim_set_keymap("i", "<A-" .. i .. ">", "<Esc><Cmd>BufferLineGoToBuffer " .. i .. "<CR>", opts)
  vim.api.nvim_set_keymap("t", "<A-" .. i .. ">", "<C-\\><C-n><Cmd>BufferLineGoToBuffer " .. i .. "<CR>", opts)
end
vim.api.nvim_set_keymap("", "<A-]>", "<Cmd>BufferLineCycleNext<CR>", opts)
vim.api.nvim_set_keymap("", "<A-[>", "<Cmd>BufferLineCyclePrev<CR>", opts)
vim.api.nvim_set_keymap("", "<C-A-]>", "<Cmd>BufferLineMoveNext<CR>", opts)
vim.api.nvim_set_keymap("", "<C-A-[>", "<Cmd>BufferLineMovePrev<CR>", opts)
vim.api.nvim_set_keymap("i", "<A-]>", "<Esc><Cmd>BufferLineCycleNext<CR>", opts)
vim.api.nvim_set_keymap("i", "<A-[>", "<Esc><Cmd>BufferLineCyclePrev<CR>", opts)
vim.api.nvim_set_keymap("i", "<C-A-]>", "<Esc><Cmd>BufferLineMoveNext<CR>", opts)
vim.api.nvim_set_keymap("i", "<C-A-[>", "<Esc><Cmd>BufferLineMovePrev<CR>", opts)
vim.api.nvim_set_keymap("t", "<A-]>", "<C-\\><C-n><Cmd>BufferLineCycleNext<CR>", opts)
vim.api.nvim_set_keymap("t", "<A-[>", "<C-\\><C-n><Cmd>BufferLineCyclePrev<CR>", opts)
vim.api.nvim_set_keymap("t", "<C-A-]>", "<C-\\><C-n><Cmd>BufferLineMoveNext<CR>", opts)
vim.api.nvim_set_keymap("t", "<C-A-[>", "<C-\\><C-n><Cmd>BufferLineMovePrev<CR>", opts)

-- Buffer Pinning
vim.api.nvim_set_keymap("", "<C-A-P>", "<Cmd>BufferLineTogglePin<CR>", opts)
vim.api.nvim_set_keymap("i", "<C-A-P>", "<Esc><Cmd>BufferLineTogglePin<CR>", opts)
vim.api.nvim_set_keymap("t", "<C-A-P>", "<C-\\><C-n><Cmd>BufferLineTogglePin<CR>", opts)

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
