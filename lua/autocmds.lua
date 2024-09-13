-- Disable all formatting options, such as putting comments after newlines
vim.api.nvim_create_autocmd({ "Filetype" }, {
  pattern = { "*" },
  callback = function()
    vim.o.formatoptions = ""
  end,
})

-- Jump to last cursor position when opening a file
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
