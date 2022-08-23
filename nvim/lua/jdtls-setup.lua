local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = '/Users/thomasmalitz/Documents/ccc/eclipse.jdtls.workspace/' .. project_name
local eclipse_jdtls_dir = '/Users/thomasmalitz/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/'

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

  settings = {
    java = {
      signatureHelp = { enabled = true };
      configuration = {
        import = {
          maven = { enabled = true };
        },
        maven = {
          userSettings = "/Users/thomasmalitz/.m2/settings.xml"
        },
        runtimes = {
          {
            name = "JavaSE-1.8",
            path = "/Library/Java/JavaVirtualMachines/jdk1.8.0_281.jdk/Contents/Home/bin"
          }
        }
      };
    }
  },

  init_options = {
    bundles = {}
  },
}

require('jdtls').start_or_attach(config)
