local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = '/Users/thomasmalitz/Documents/ccc/eclipse.jdtls.workspace/' .. project_name
local eclipse_jdtls_dir = '/Users/thomasmalitz/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/'

local on_attach = function(client, bufnr)
  require'jdtls.setup'.add_commands()
end

local config = {
  cmd = {
    '/Library/Java/JavaVirtualMachines/jdk-18.0.2.1.jdk/Contents/Home/bin/java',

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    '-jar', eclipse_jdtls_dir .. 'plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
    '-configuration', eclipse_jdtls_dir .. 'config_mac',

    '-data', workspace_dir
  },

  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),

  capabilities = capabilities,

  on_attach = on_attach,

  settings = {
    java = {
      signatureHelp = { enabled = true };
      import = {
        maven = true
      };
 --     maven = {
  --      downloadSources = true
   --   };
      configuration = {
        maven = {
          userSettings = "/Users/thomasmalitz/.m2/settings.xml"
        },
        runtimes = {
          {
            name = "JavaSE-11",
            path = "/Library/Java/JavaVirtualMachines/jdk-11.0.11.jdk/Contents/Home"
          },
          {
            name = "JavaSE-1.8",
            path = "/Library/Java/JavaVirtualMachines/jdk1.8.0_281.jdk/Contents/Home"
          },
          {
            name = "JavaSE-1.7",
            path = "/Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home"
          }
        }
      };
    }
  },
}

require('jdtls').start_or_attach(config)

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
vim.api.nvim_set_keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
vim.api.nvim_set_keymap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>",{ silent = true })
