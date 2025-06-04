-- <{{ Global lsp config
vim.lsp.config("*", {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
-- }}>

-- <{{ Load custom lsp setup configs
local custom_setup_configs_path = vim.fn.stdpath("data") .. "/custom/lsp_setup_configs.lua"
if vim.fn.filereadable(custom_setup_configs_path) == 1 then
  local setup_configs = dofile(custom_setup_configs_path)
  if type(setup_configs) == "table" then
    for server_name, config in pairs(setup_configs) do
      vim.lsp.config(server_name, config)
    end
  end
end
-- }}>

-- <{{ Load custom lsp servers
local custom_servers_path = vim.fn.stdpath("data") .. "/custom/lsp_servers.lua"
if vim.fn.filereadable(custom_servers_path) == 1 then
  local custom_servers = dofile(custom_servers_path)
  if type(custom_servers) == "table" then
    for _, server_name in ipairs(custom_servers) do
      vim.lsp.enable(server_name)
    end
  end
end
-- }}>
