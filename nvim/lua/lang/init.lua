-- Define sign names
-- stylua: ignore start
vim.fn.sign_define("DiagnosticSignError", { text = "E", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "W", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInformation", { text = "I", texthl = "DiagnosticSignInformation" })
vim.fn.sign_define("DiagnosticSignHint", { text = "H", texthl = "DiagnosticSignHint" })
-- stylua: ignore end

--  Configure diagnostic options
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
        msg = ("[E] " .. msg)
      elseif sev == vim.diagnostic.severity.WARN then
        msg = ("[W] " .. msg)
      elseif sev == vim.diagnostic.severity.INFO then
        msg = ("[I] " .. msg)
      elseif sev == vim.diagnostic.severity.HINT then
        msg = ("[H] " .. msg)
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
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<space>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})

-- vim.lsp.set_log_level 'debug'
vim.lsp.handlers["textDocument/hover"] =
  vim.lsp.with(vim.lsp.handlers.hover, { border = "single", focusable = false })
vim.lsp.handlers["textDocument/signatureHelp"] =
  vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single", focusable = false })

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

lspconfig["bashls"].setup({
  capabilities = capabilities,
  flags = { debounce_text_changes = 150 },
  cmd = { "bash-language-server", "start" },
  filetypes = { "sh" },
  single_file_support = true,
})

lspconfig["cmake"].setup({
  capabilities = capabilities,
  flags = { debounce_text_changes = 150 },
  cmd = { "cmake-language-server" },
  filetypes = { "cmake" },
  init_options = { buildDirectory = "build" },
})

lspconfig["lua_ls"].setup({
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

lspconfig["pyright"].setup({
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

lspconfig["tsserver"].setup({
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

lspconfig["vimls"].setup({
  capabilities = capabilities,
  flags = { debounce_text_changes = 150 },
  cmd = { "vim-language-server", "--stdio" },
  filetypes = { "vim" },
  init_options = {
    diagnostic = { enable = true },
    indexes = {
      count = 3,
      gap = 100,
      projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
      runtimepath = true,
    },
    isNeovim = true,
    iskeyword = "@,48-57,_,192-255,-#",
    runtimepath = "",
    suggest = { fromRuntimepath = true, fromVimruntime = true },
    vimruntime = "",
  },
  single_file_support = true,
})

lspconfig["astro"].setup({
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

require("lang.clang")
require("lang.rust")
