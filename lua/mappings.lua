-- Define options for mappings
local opts = { noremap = true }

-- Set j and k to move one displayed line (ignore wrapping)
vim.keymap.set({ "n", "v" }, "j", "gj", opts)
vim.keymap.set({ "n", "v" }, "k", "gk", opts)
vim.keymap.set("s", "j", "j", opts)
vim.keymap.set("s", "k", "k", opts)

-- Navigate down/up/left/right five displayed lines
vim.keymap.set({ "n", "v" }, "<C-j>", "5gj", opts)
vim.keymap.set({ "n", "v" }, "<C-k>", "5gk", opts)
vim.keymap.set({ "n", "v" }, "<C-h>", "5h", opts)
vim.keymap.set({ "n", "v" }, "<C-l>", "5l", opts)

-- Escape from terminal when <Esc> is pressed
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", opts)

-- Ctrl-W to delete whole word properly
vim.keymap.set("i", "<C-w>", "<Esc>gi<C-w>", opts)

-- Allow for smoother navigation in visual line mode
vim.keymap.set("v", "<S-j>", "j", opts)
vim.keymap.set("v", "<S-k>", "k", opts)

-- Terminal
vim.keymap.set("", "<C-t>", "<Cmd>sp<CR><C-w>w<Cmd>term<CR>i", opts)
vim.keymap.set("", "<A-t>", "<Cmd>vsp<CR><C-w>w<Cmd>term<CR>i", opts)
vim.keymap.set("", "<C-A-T>", "<Cmd>term<CR>i", opts)
vim.keymap.set("i", "<C-t>", "<Esc><Cmd>sp<CR><C-w>w<Cmd>term<CR>i", opts)
vim.keymap.set("i", "<A-t>", "<Esc><Cmd>vsp<CR><C-w>w<Cmd>term<CR>i", opts)
vim.keymap.set("i", "<C-A-T>", "<Esc><Cmd>term<CR>i", opts)
vim.keymap.set("t", "<C-t>", "<Esc><Cmd>sp<CR><Cmd>term<CR>", opts)
vim.keymap.set("t", "<A-t>", "<Esc><Cmd>vsp<CR><Cmd>term<CR>", opts)
vim.keymap.set("t", "<C-A-T>", "<Esc><Cmd>term<CR>", opts)

-- <{{ Buffer

-- New/Close
vim.keymap.set({ "", "i", "t" }, "<A-k>", "<Cmd>enew<CR>", opts)
vim.keymap.set({ "", "i", "t" }, "<A-j>", "<Cmd>Bdelete!<CR>", opts)

-- Navigation
vim.keymap.set({ "", "i", "t" }, "<A-0>", "<Cmd>lua require('bufferline').go_to(1, true)<CR>", opts)
for i = 1, 9 do
  vim.keymap.set({ "", "i", "t" }, "<A-" .. i .. ">", "<Cmd>BufferLineGoToBuffer " .. i .. "<CR>", opts)
end
vim.keymap.set({ "", "i", "t" }, "<A-l>", "<Cmd>BufferLineCycleNext<CR>", opts)
vim.keymap.set({ "", "i", "t" }, "<A-h>", "<Cmd>BufferLineCyclePrev<CR>", opts)
vim.keymap.set({ "", "i", "t" }, "<C-A-L>", "<Cmd>BufferLineMoveNext<CR>", opts)
vim.keymap.set({ "", "i", "t" }, "<C-A-H>", "<Cmd>BufferLineMovePrev<CR>", opts)

-- Pinning
vim.keymap.set({ "", "i", "t" }, "<C-A-P>", "<Cmd>BufferLineTogglePin<CR>", opts)

-- Terminal Renaming
vim.keymap.set(
  { "", "i", "t" },
  "<C-A-R>",
  "<Cmd>lua if vim.bo.buftype == 'terminal' then vim.cmd('file ' .. vim.fn.input('New Terminal Name: ') .. '.terminal') end<CR>",
  opts
)

-- Buffer }}>

-- <{{ Telescope

-- File Pickers
vim.keymap.set("n", ",f", "<Cmd>Telescope find_files<CR>", opts)
vim.keymap.set("n", ",F", "<Cmd>Telescope git_files<CR>", opts)
vim.keymap.set("n", ",g", "<Cmd>Telescope live_grep<CR>", opts)

-- Vim Pickers
vim.keymap.set("n", ",b", "<Cmd>Telescope buffers<CR>", opts)
vim.keymap.set("n", ",h", "<Cmd>Telescope oldfiles<CR>", opts)
vim.keymap.set("n", ",m", "<Cmd>Telescope keymaps<CR>", opts)

-- LSP Pickers
vim.keymap.set("n", ",r", "<Cmd>Telescope lsp_references<CR>", opts)
vim.keymap.set("n", ",ci", "<Cmd>Telescope lsp_incoming_calls<CR>", opts)
vim.keymap.set("n", ",co", "<Cmd>Telescope lsp_outgoing_calls<CR>", opts)
vim.keymap.set("n", ",sd", "<Cmd>Telescope lsp_document_symbols<CR>", opts)
vim.keymap.set("n", ",sw", "<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>", opts)
vim.keymap.set("n", ",e", "<Cmd>Telescope diagnostics<CR>", opts)
vim.keymap.set("n", ",i", "<Cmd>Telescope lsp_implementations<CR>", opts)
vim.keymap.set("n", ",d", "<Cmd>Telescope lsp_definitions<CR>", opts)
vim.keymap.set("n", ",t", "<Cmd>Telescope lsp_type_definitions<CR>", opts)

-- Git Pickers
vim.keymap.set("n", ",Gc", "<Cmd>Telescope git_commits<CR>", opts)
vim.keymap.set("n", ",GB", "<Cmd>Telescope git_bcommits<CR>", opts)
vim.keymap.set("v", ",GB", "<Cmd>Telescope git_bcommits_range<CR>", opts)
vim.keymap.set("n", ",Gb", "<Cmd>Telescope git_branches<CR>", opts)
vim.keymap.set("n", ",Gs", "<Cmd>Telescope git_status<CR>", opts)
vim.keymap.set("n", ",GS", "<Cmd>Telescope git_stash<CR>", opts)

-- Telescope }}>

-- nvim-tree
vim.keymap.set({ "", "i", "t" }, "<C-b>", "<Cmd>NvimTreeToggle<CR>", opts)
vim.keymap.set({ "", "i", "t" }, "<C-A-B>", "<Cmd>NvimTreeFindFile<CR>", opts)
