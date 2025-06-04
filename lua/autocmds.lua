-- <{{ Disable all formatting options, such as putting comments after newlines
vim.api.nvim_create_autocmd({ "Filetype" }, {
  pattern = { "*" },
  callback = function()
    vim.o.formatoptions = ""
  end,
})
-- }}>

-- <{{ Jump to last cursor position when opening a file
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  pattern = { "*" },
  callback = function()
    local previous_pos = vim.api.nvim_buf_get_mark(0, '"')[1]
    local last_line = vim.api.nvim_buf_line_count(0)
    if previous_pos >= 1 and previous_pos <= last_line and vim.bo.filetype ~= "commit" then
      vim.cmd('normal! g`"')
    end
  end,
})
-- }}>

-- <{{ LspAttach
-- Only map the following keys after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Buffer local mappings
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { noremap = true, silent = true, buffer = ev.buf }
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", ",R", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", ",C", vim.lsp.buf.code_action, opts)
  end,
})
-- }}>
