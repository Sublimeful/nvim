local M = {}

-- <{{ bd_close
-- Bdelete a buffer and close all windows showing it
-- Does not delete NvimTree buffers.
-- Safely avoids closing the last normal window (excluding NvimTree).
-- @param bufnr (number, optional) The buffer number to delete. Defaults to current buffer.
function M.bd_close(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  
  -- Don't delete NvimTree
  local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
  if ft == "NvimTree" then
    return
  end

  -- Count only *normal* windows (exclude NvimTree)
  local function get_normal_windows()
    return vim.tbl_filter(function(win)
      local buf = vim.api.nvim_win_get_buf(win)
      local ft = vim.api.nvim_buf_get_option(buf, "filetype")
      return ft ~= "NvimTree"
    end, vim.api.nvim_list_wins())
  end

  -- Close windows showing the buffer
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_buf(win) == bufnr then
      if #get_normal_windows() > 1 then
        pcall(vim.api.nvim_win_close, win, true)
      end
    end
  end

  -- Delete the buffer
  vim.cmd("Bdelete! " .. bufnr)
end
-- }}>

return M
