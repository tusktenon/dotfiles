-- LSP client
return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    -- Enable logging only when needed
    -- Log file: ~/.local/state/nvim/lsp.log
    vim.lsp.set_log_level 'off'

    local keymap = vim.keymap.set -- Sets `noremap` by default

    -- Global Mappings
    -- See `:help vim.diagnostic.*` for documentation on any of the functions below
    keymap('n', 'gl', vim.diagnostic.open_float, { desc = 'Show diagnostics' })
    keymap('n', '<leader>lq', vim.diagnostic.setloclist, { desc = 'List diagnostics' })

    -- Buffer-Local Mappings
    -- Use the LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer.
    -- See `:help vim.lsp.*` for documentation on any of the functions below.
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        opts.desc = 'Hover documentation'
        keymap('n', 'K', vim.lsp.buf.hover, opts)

        opts.desc = 'Go to declaration'
        keymap('n', 'gD', vim.lsp.buf.declaration, opts)

        opts.desc = 'Go to definition'
        keymap('n', 'gd', vim.lsp.buf.definition, opts)

        opts.desc = 'Go to type definition'
        keymap('n', '<leader>lD', vim.lsp.buf.type_definition, opts)

        opts.desc = 'Go to implementation'
        keymap('n', 'gi', vim.lsp.buf.implementation, opts)

        opts.desc = 'List references'
        keymap('n', 'gr', vim.lsp.buf.references, opts)
        -- keymap('n', 'gr', require'telescope.builtin'.lsp_references, opts)

        opts.desc = 'List document symbols'
        keymap('n', '<leader>fs', require('telescope.builtin').lsp_document_symbols)

        opts.desc = 'Code action'
        keymap({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action, opts)

        opts.desc = 'Format buffer'
        keymap('n', '<leader>lf', function() vim.lsp.buf.format { async = true } end)

        opts.desc = 'Rename'
        keymap('n', '<leader>lr', vim.lsp.buf.rename, opts)

        opts.desc = 'Signature help'
        keymap('n', '<leader>ls', vim.lsp.buf.signature_help, opts)

        opts.desc = 'Add folder'
        keymap('n', '<leader>lwa', vim.lsp.buf.add_workspace_folder, opts)

        opts.desc = 'Remove folder'
        keymap('n', '<leader>lwr', vim.lsp.buf.remove_workspace_folder, opts)

        opts.desc = 'List folders'
        keymap(
          'n',
          '<leader>lwl',
          function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end
        )
      end,
    })

    -- UI Customization
    vim.diagnostic.config {
      virtual_lines = { current_line = true },
      virtual_text = false,
      signs = true,
      underline = false,
      update_in_insert = false,
      severity_sort = true,
    }

    -- Customize the diagnostic symbols used in the sign column
    -- local signs = { Error = '󰯸 ', Warn = '󰰮 ', Hint = '󰰁 ', Info = '󰰄 ' }
    -- local signs = { Error = '󰅚 ', Warn = '󰀪 ', Hint = '󰌶 ', Info = ' ' }
    local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl })
      -- Also highlight the line number using the diagnostic color:
      -- vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    -- Show a border in floating windows
    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or 'rounded'
      return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end

    -- Also add a border to the floating window of`:LSPInfo`
    require('lspconfig.ui.windows').default_options.border = 'rounded'

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    -- --Enable (broadcasting) snippet capability for completion:
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    -- Add additional capabilities supported by nvim-cmp:
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    local lspconfig = require 'lspconfig'

    -- C/C++
    lspconfig.clangd.setup {
      capabilities = capabilities,
    }

    -- C#
    lspconfig.omnisharp.setup {
      capabilities = capabilities,
      cmd = {
        'dotnet',
        '/Users/dan/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll',
      },
      settings = {
        FormattingOptions = {
          -- Enables support for reading code style, naming convention and analyzer
          -- settings from .editorconfig.
          EnableEditorConfigSupport = true,
          -- Specifies whether 'using' directives should be grouped and sorted during
          -- document formatting.
          OrganizeImports = true,
        },
        MsBuild = {
          -- If true, MSBuild project system will only load projects for files that
          -- were opened in the editor. This setting is useful for big C# codebases
          -- and allows for faster initialization of code navigation features only
          -- for projects that are relevant to code that is being edited. With this
          -- setting enabled OmniSharp may load fewer projects and may thus display
          -- incomplete reference lists for symbols.
          LoadProjectsOnDemand = nil,
        },
        RoslynExtensionsOptions = {
          -- Enables support for roslyn analyzers, code fixes and rulesets.
          EnableAnalyzersSupport = true,
          -- Enables support for showing unimported types and unimported extension
          -- methods in completion lists. When committed, the appropriate using
          -- directive will be added at the top of the current file. This option can
          -- have a negative impact on initial completion responsiveness,
          -- particularly for the first few completion sessions after opening a
          -- solution.
          EnableImportCompletion = true,
          -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
          -- true
          AnalyzeOpenDocumentsOnly = nil,
        },
        Sdk = {
          -- Specifies whether to include preview versions of the .NET SDK when
          -- determining which version to use for project loading.
          IncludePrereleases = true,
        },
      },
    }

    -- Go
    lspconfig.gopls.setup {
      capabilities = capabilities,
      settings = {
        gopls = {
          gofumpt = true,
        },
      },
    }

    -- Haskell
    -- use 'mrcjkb/haskell-tools.nvim'

    -- HTML
    lspconfig.html.setup {
      capabilities = capabilities,
    }

    -- JavaScript/TypeScript
    lspconfig.ts_ls.setup {
      capabilities = capabilities,
    }

    -- Lua
    lspconfig.lua_ls.setup {
      capabilities = capabilities,
      settings = {
        Lua = {
          completion = {
            callSnippet = 'Replace',
          },
          diagnostics = {
            globals = { 'vim' }, -- Recognize `vim` as a global variable
          },
          runtime = {
            version = 'LuaJIT', -- Use 'LuaJIT' for Neovim
          },
          workspace = {
            -- See https://github.com/LunarVim/LunarVim/issues/4049:
            checkThirdParty = false,
            -- Get completion and context from the Neovim runtime files:
            library = vim.api.nvim_get_runtime_file('', true),
          },
          telemetry = {
            enable = true,
          },
        },
      },
    }

    -- Python
    -- There are several python language servers;
    -- Pyright provides the `PyrightOrganizeImports` command
    lspconfig.pyright.setup {
      capabilities = capabilities,
    }

    -- Rust
    -- use 'mrcjkb/rustaceanvim'

    -- XML
    lspconfig.lemminx.setup {
      capabilities = capabilities,
    }
  end,
}
