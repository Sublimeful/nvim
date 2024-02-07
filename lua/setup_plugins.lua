-- gitsigns.nvim
require('gitsigns').setup()

-- lualine.nvim
local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed
    }
  end
end

require("lualine").setup {
  sections = {
    lualine_b = { {'diff', source = diff_source}, },
  }
}

-- luatab.nvim
require("luatab").setup()

-- nvim-brackets
require("nvim-brackets")

-- nvim-treesitter
require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
  },
})

-- lsp_signature.nvim
require("lsp_signature").setup({
  floating_window = false,
  hint_scheme = "SignatureHint",
  hint_prefix = "",
})

-- telescope.nvim
local actions = require("telescope.actions")
require('telescope').setup {
  pickers = {
    buffers = {
      sort_lastused = true,
    }
  },
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-f>"] = actions.preview_scrolling_down,
        ["<C-b>"] = actions.preview_scrolling_up,
        ["<Esc>"] = actions.close,
        ["<A-->"] = actions.nop,
        ["<C-h>"] = "which_key",
      }
    }
  },
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<A-->"] = actions.delete_buffer,
        }
      }
    }
  }
}

-- nvim-tree
require("nvim-tree").setup({
  view = {
    preserve_window_proportions = true,
  },
  actions = {
    open_file = {
      resize_window = false,
    },
    change_dir = {
      global = true,
    },
  },
  diagnostics = {
    enable = true,
  },
  filesystem_watchers = {
    enable = true,
  },
  on_attach = function(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
      return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- BEGIN KEYBINDS
    vim.keymap.set('n', '?',       api.tree.toggle_help,                opts('Help'))
    vim.keymap.set('n', '<C-t>',   api.node.open.tab,                   opts('Open: New Tab'))
    vim.keymap.set('n', '<C-v>',   api.node.open.vertical,              opts('Open: Vertical Split'))
    vim.keymap.set('n', '<C-x>',   api.node.open.horizontal,            opts('Open: Horizontal Split'))
    vim.keymap.set('n', '<BS>',    api.node.navigate.parent_close,      opts('Close Directory'))
    vim.keymap.set('n', '<CR>',    api.node.open.edit,                  opts('Open'))
    vim.keymap.set('n', '<Tab>',   api.node.open.preview,               opts('Open Preview'))
    vim.keymap.set('n', '>',       api.node.navigate.sibling.next,      opts('Next Sibling'))
    vim.keymap.set('n', '<',       api.node.navigate.sibling.prev,      opts('Previous Sibling'))
    vim.keymap.set('n', ']e',      api.node.navigate.diagnostics.next,  opts('Next Diagnostic'))
    vim.keymap.set('n', '[e',      api.node.navigate.diagnostics.prev,  opts('Prev Diagnostic'))
    vim.keymap.set('n', ']g',      api.node.navigate.git.next,          opts('Next Git'))
    vim.keymap.set('n', '[g',      api.node.navigate.git.prev,          opts('Prev Git'))
    vim.keymap.set('n', '.',       api.node.run.cmd,                    opts('Run Command'))
    vim.keymap.set('n', '-',       api.tree.change_root_to_parent,      opts('Up'))
    vim.keymap.set('n', 'a',       api.fs.create,                       opts('Create File Or Directory'))
    vim.keymap.set('n', 'bd',      api.marks.bulk.trash,                opts('Trash Bookmarked'))
    vim.keymap.set('n', 'bD',      api.marks.bulk.delete,               opts('Delete Bookmarked'))
    vim.keymap.set('n', 'bm',      api.marks.bulk.move,                 opts('Move Bookmarked'))
    vim.keymap.set('n', 'c',       api.fs.copy.node,                    opts('Copy'))
    vim.keymap.set('n', 'C',       api.tree.change_root_to_node,        opts('CD'))
    vim.keymap.set('n', 'd',       api.fs.trash,                        opts('Trash'))
    vim.keymap.set('n', 'D',       api.fs.remove,                       opts('Delete'))
    vim.keymap.set('n', 'E',       api.tree.expand_all,                 opts('Expand All'))
    vim.keymap.set('n', 'F',       api.live_filter.clear,               opts('Live Filter: Clear'))
    vim.keymap.set('n', 'f',       api.live_filter.start,               opts('Live Filter: Start'))
    vim.keymap.set('n', 'gy',      api.fs.copy.absolute_path,           opts('Copy Absolute Path'))
    vim.keymap.set('n', 'H',       api.tree.toggle_hidden_filter,       opts('Toggle Filter: Dotfiles'))
    vim.keymap.set('n', 'i',       api.node.show_info_popup,            opts('Info'))
    vim.keymap.set('n', 'I',       api.tree.toggle_gitignore_filter,    opts('Toggle Filter: Git Ignore'))
    vim.keymap.set('n', 'M',       api.tree.toggle_no_bookmark_filter,  opts('Toggle Filter: No Bookmark'))
    vim.keymap.set('n', 'm',       api.marks.toggle,                    opts('Toggle Bookmark'))
    vim.keymap.set('n', 'o',       api.node.open.edit,                  opts('Open'))
    vim.keymap.set('n', 'O',       api.node.open.no_window_picker,      opts('Open: No Window Picker'))
    vim.keymap.set('n', 'p',       api.fs.paste,                        opts('Paste'))
    vim.keymap.set('n', 'P',       api.node.navigate.parent,            opts('Parent Directory'))
    vim.keymap.set('n', 'q',       api.tree.close,                      opts('Close'))
    vim.keymap.set('n', 'r',       api.fs.rename,                       opts('Rename'))
    vim.keymap.set('n', 'R',       api.tree.reload,                     opts('Refresh'))
    vim.keymap.set('n', 's',       api.node.run.system,                 opts('Run System'))
    vim.keymap.set('n', 'S',       api.tree.search_node,                opts('Search'))
    vim.keymap.set('n', 'u',       api.fs.rename_full,                  opts('Rename: Full Path'))
    vim.keymap.set('n', 'U',       api.tree.toggle_custom_filter,       opts('Toggle Filter: Hidden'))
    vim.keymap.set('n', 'W',       api.tree.collapse_all,               opts('Collapse All'))
    vim.keymap.set('n', 'x',       api.fs.cut,                          opts('Cut'))
    vim.keymap.set('n', 'y',       api.fs.copy.filename,                opts('Copy File Name'))
    vim.keymap.set('n', 'Y',       api.fs.copy.relative_path,           opts('Copy Relative Path'))
    vim.keymap.set('n', '<2-LeftMouse>',  api.node.open.edit,           opts('Open'))
    vim.keymap.set('n', '<MiddleMouse>',  api.tree.change_root_to_node, opts('CD'))
    -- END KEYBINDS
  end,
})
