-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = '/home/chillwalker/.local/share/eclipse/' .. project_name

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	}

local handler = require('lsp_handler')

local config = {
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
		'-javaagent:/home/chillwalker/jdtlsdir/lombok.jar',
    '-jar', '/home/chillwalker/jdtlsdir/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
    '-configuration', '/home/chillwalker/jdtlsdir/config_linux',
    '-data', workspace_dir
  },

  -- :skull:
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
		java = {
			                    trace = {
                        server = "message",
                    },
                    signatureHelp = {
                        enabled = false
                    },
                    referenceCodeLens = {
                        enabled = true
                    },
                    format = {
                        enabled = true,
                        settings = {
                            profile = "GoogleStyle",
                            url = "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml"
                        },
                    },
                    saveActions = {
                        organizeImports = true
                    },
                    completion = {
                        importOrder = {
                            "javax",
                            "java",
                            "com",
                            "org"
                        }
                    },
                    codeGeneration = {
                        tostring = {
                            listArrayContents = true,
                            skipNullValues = true,
                            template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
                        },
                        useBlocks = true,
                        hashCodeEquals = {
                            useInstanceof = true,
                            useJava7Objects = true
                        },
                        generateComments = true,
                        insertLocation = true
                    },
                    autobuild = {
                        enabled = true
                    },
                    progressReports = {
                        enabled = false
                    },
                    eclipse = {
                        downloadSources = true
                    },
                    maven = {
                        downloadSources = true,
                        updateSnapshots = true
                    }

		}
  },

  capabilities = capabilities,
  on_attach = handler.on_attach,

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {}
  },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
