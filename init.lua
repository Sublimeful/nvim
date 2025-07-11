-- <{{ Require all the modules
require("settings")
require("mappings")
require("plugins")
require("theme")
require("plugins_setup")
require("nvimlsp")
require("autocmds")
-- }}>

-- <{{ Load custom init.lua
local custom_init_path = vim.fn.stdpath("data") .. "/custom/init.lua"
if vim.fn.filereadable(custom_init_path) == 1 then
  dofile(custom_init_path)
end
-- }}>
