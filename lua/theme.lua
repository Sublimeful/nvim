-- Highlight groups
vim.api.nvim_set_hl(0, "SignatureHint", { fg = "#FFF000", bold = true })

-- Color Scheme setup
require("catppuccin").setup({
  flavour = "frappe", -- latte, frappe, macchiato, mocha
  background = { -- :h background
    light = "frappe",
    dark = "frappe",
  },
  transparent_background = true,
  show_end_of_buffer = false, -- Show the '~' characters after the end of buffers
  term_colors = true,
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  no_italic = false, -- Force no italic
  no_bold = false, -- Force no bold
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  color_overrides = {},
  custom_highlights = {},
  integrations = {
    cmp = true,
    mason = true,
    nvimtree = true,
    telescope = true,
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
    -- For more plugins integrations go to https://github.com/catppuccin/nvim#integrations
  },
})

-- Setup must be called before loading
vim.cmd.colorscheme("catppuccin")
