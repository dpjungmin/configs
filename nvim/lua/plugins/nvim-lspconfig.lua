return {
  "neovim/nvim-lspconfig",
  lazy = false,
  priority = 1000,
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "p00f/clangd_extensions.nvim",
    "nvim-lua/plenary.nvim",
    "mfussenegger/nvim-dap",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    -- stylua: ignore start
    vim.fn.sign_define("DiagnosticSignError", { text = "E", texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = "W", texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInformation", { text = "I", texthl = "DiagnosticSignInformation" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "H", texthl = "DiagnosticSignHint" })
    -- stylua: ignore end

    vim.diagnostic.config({
      virtual_text = { spacing = 0, prefix = "" },
      signs = true,
      float = {
        wrap = true,
        pad_top = 0,
        pad_bottom = 0,
        focusable = true,
        style = "minimal",
        border = "single",
        source = "always",
        header = "",
        prefix = "",
        format = function(diagnostic)
          local sev = diagnostic.severity
          local msg = diagnostic.message
          if sev == vim.diagnostic.severity.ERROR then
            msg = ("[e] " .. msg)
          elseif sev == vim.diagnostic.severity.WARN then
            msg = ("[w] " .. msg)
          elseif sev == vim.diagnostic.severity.INFO then
            msg = ("[i] " .. msg)
          elseif sev == vim.diagnostic.severity.HINT then
            msg = ("[h] " .. msg)
          end
          return msg
        end,
      },
      severity_sort = true,
      underline = false,
      update_in_insert = false,
    })

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- using LspSaga for this
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "\\\\f", function()
          vim.lsp.buf.format({ async = true })
        end, opts)
        vim.keymap.set("n", "<leader>li", function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end, { desc = "Toggle inlay hints" })

        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        client.server_capabilities.semanticTokensProvider = nil
      end,
    })

    vim.lsp.handlers["textDocument/hover"] =
      vim.lsp.with(vim.lsp.handlers.hover, { border = "single", focusable = true })
    vim.lsp.handlers["textDocument/signatureHelp"] =
      vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single", focusable = true })

    -- keymaps
    vim.keymap.set("n", "<leader>B", "<cmd>DapToggleBreakpoint<cr>", {})
    vim.keymap.set("n", "\\\\S", "<cmd>LspStart<cr>", {})
    vim.keymap.set("n", "\\\\s", "<cmd>LspStop<cr>", {})
    vim.keymap.set("n", "\\h", "<cmd>ClangdSwitchSourceHeader<cr>", {})
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {})
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})

    -- language servers

    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require("lspconfig")

    -- bash
    lspconfig.bashls.setup({
      capabilities = capabilities,
      flags = { debounce_text_changes = 150 },
      cmd = { "bash-language-server", "start" },
      filetypes = { "sh" },
      single_file_support = true,
    })

    -- lua
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      flags = { debounce_text_changes = 150 },
      filetypes = { "lua" },
      log_level = 2,
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim" } },
          workspace = { library = vim.api.nvim_get_runtime_file("", true) },
          telemetry = { enable = false },
        },
      },
      single_file_support = true,
    })

    -- python
    lspconfig.pyright.setup({
      capabilities = capabilities,
      flags = { debounce_text_changes = 150 },
      cmd = { "pyright-langserver", "--stdio" },
      filetypes = { "python" },
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            diagnosticMode = "workspace",
            useLibraryCodeForTypes = true,
          },
        },
      },
    })

    -- typescript
    lspconfig.ts_ls.setup({
      capabilities = capabilities,
      flags = { debounce_text_changes = 150 },
      cmd = { "typescript-language-server", "--stdio" },
      filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
      },
      init_options = { "hostInfo", "neovim" },
      root_dir = require("lspconfig.util").root_pattern(
        "package.json",
        "tsconfig.json",
        "jsconfig.json",
        ".git"
      ),
    })

    -- astro
    lspconfig.astro.setup({
      capabilities = capabilities,
      flags = { debounce_text_changes = 150 },
      cmd = { "astro-ls", "--stdio" },
      filetypes = { "astro" },
      init_options = { typescript = {} },
      root_dir = require("lspconfig.util").root_pattern(
        "package.json",
        "tsconfig.json",
        "jsconfig.json",
        ".git"
      ),
    })

    -- c/c++
    lspconfig.clangd.setup({
      capabilities = capabilities,
      flags = { debounce_text_changes = 150 },
      cmd = { "clangd" },
      filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto", "cc" },
      root_dir = require("lspconfig.util").root_pattern(
        ".clangd",
        ".clang-tidy",
        ".clang-format",
        "compile_commands.json",
        "compile_flags.txt",
        ".git"
      ),
      single_file_support = true,
    })
  end,
}
