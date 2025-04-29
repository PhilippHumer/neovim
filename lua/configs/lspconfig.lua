-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = {
  "html",
  "cssls",
  "ts_ls",
  "clangd",
  "jdtls",
  "phpactor",
  "lemminx",
  "cmake",
  "pyright",
}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.jdtls.setup {
    filetypes = {'java', 'pom.xml'},
    cmd = {'/home/philipp/eclipse-jdtls/bin/jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
--require('jdtls').start_or_attach(config)
--lspconfig.jdtls.setup{}

lspconfig.clangd.setup {
  filetypes = {'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto'}
}


lspconfig.phpactor.setup {
  root_dir = function(_)
    return vim.loop.cwd()
  end,
  init_options = {
    ["language_server.diagnostics_on_update"] = false,
    ["language_server.diagnostics_on_open"] = false,
    ["language_server.diagnostics_on_save"] = false,
    ["language_server_phpstan.enabled"] = false,
    ["language_server_psalm.enabled"] = false,
  }
}

lspconfig.pyright.setup {
    filetypes = {'py'}
}

--configuring single server, example: typescript
lspconfig.ts_ls.setup {
  filetypes = {'js', 'ts'},
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}
