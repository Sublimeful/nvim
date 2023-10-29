-- Configure custom server
require("lspconfig.configs").gdscript = {
  default_config = {
    force_setup = true,
    single_file_support = false,
    cmd = { 'ncat', '127.0.0.1', '6008' },
    root_dir = require('lspconfig.util').root_pattern('project.godot', '.git'),
    filetypes = { 'gd', 'gdscript', 'gdscript3' }
  }
}

-- Add custom server to lsp
table.insert(servers, 'gdscript')
