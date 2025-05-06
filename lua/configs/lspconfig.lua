-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = {
    "html",
    "cssls",
    "ts_ls",
    "clangd",
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

lspconfig.lemminx.setup = {
    cmd = { 'lemminx' },
    filetypes = { 'xml', 'xsd', 'xsl', 'xslt', 'svg' },
}


local java_bundles = {
    vim.fn.glob("/home/philipp/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar",
        true),
}
vim.list_extend(java_bundles, vim.split(vim.fn.glob("/home/philipp/vscode-java-test/server/*.jar", true), "\n"))

local ws_root_dir = vim.fs.root(0, { ".git", "settings.gradle" })
print(ws_root_dir)

--local jdtls_config = {
lspconfig.jdtls.setup {
    filetypes = { 'java', 'pom.xml' },
    on_attach = function()
        require('jdtls.dap').setup_dap_main_class_configs()
    end,

    --cmd = {'/home/philipp/eclipse-jdtls/bin/jdtls'},
    --root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),

    cmd = {
        -- 'sudo -S',
        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        -- '-javaagent:', '/home/philipp/java/lombok.jar',
        '-jar', '/home/philipp/eclipse-jdtls/plugins/org.eclipse.equinox.launcher_1.6.1000.v20250131-0606.jar',
        '-configuration', '/home/philipp/eclipse-jdtls/config_linux',
        '-data', ws_root_dir
    },

    -- vim.fs.root requires Neovim 0.10.
    -- If you're using an earlier version, use: require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
    root_dir = ws_root_dir,

    -- Here you can configure eclipse.jdt.ls specific settings
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    -- for a list of options
    settings = {
        java = {
        }
    },

    -- Language server `initializationOptions`
    -- You need to extend the `bundles` with paths to jar files
    -- if you want to use additional eclipse.jdt.ls plugins.
    --
    -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
    --
    -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
    init_options = {
        bundles = java_bundles
    },
}
--require('jdtls').start_or_attach(jdtls_config)
--lspconfig.jdtls.setup{}

lspconfig.clangd.setup {
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' }
    
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
    filetypes = { 'py' }
}

--configuring single server, example: typescript
lspconfig.ts_ls.setup {
    filetypes = { 'js', 'ts' },
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
}
