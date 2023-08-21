-- https://github.com/simrat39/rust-tools.nvim

local function on_attach(_, bufnr)
  local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true, buffer = bufnr }
    if opts then
      options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
  end

  map("n", "K", function()
    ((require("rust-tools")).hover_actions).hover_actions()
  end, { desc = "Display symbol information at the cursor" })

  map("n", "<space>oc", function()
    ((require("rust-tools")).open_cargo_toml).open_cargo_toml()
  end, { desc = "Open Cargo.toml" })

  map("n", "<space>rr", function()
    ((require("rust-tools")).runnables).runnables()
  end, { desc = "Run a Rust runnable" })

  map("n", "<space>M", function()
    ((require("rust-tools")).expand_macro).expand_macro()
  end, { desc = "Expand macros recursively" })
end

require("rust-tools").setup({
  tools = {
    executor = require("rust-tools.executors").termopen,
    on_initialized = nil,
    reload_workspace_from_cargo_toml = true,
    inlay_hints = {
      show_parameter_hints = true,
      parameter_hints_prefix = "",
      other_hints_prefix = "-> ",
      max_len_align_padding = 1,
      right_align_padding = 7,
      highlight = "InlayHints",
      only_current_line = false,
      show_variable_name = false,
      max_len_align = false,
      right_align = false,
    },
    hover_actions = {
      border = "single",
      max_width = nil,
      max_height = nil,
      auto_focus = false,
    },
    crate_graph = {
      backend = "x11",
      output = nil,
      full = true,
      enabled_graphviz_backends = {
        "bmp",
        "cgimage",
        "canon",
        "dot",
        "gv",
        "xdot",
        "xdot1.2",
        "xdot1.4",
        "eps",
        "exr",
        "fig",
        "gd",
        "gd2",
        "gif",
        "gtk",
        "ico",
        "cmap",
        "ismap",
        "imap",
        "cmapx",
        "imap_np",
        "cmapx_np",
        "jpg",
        "jpeg",
        "jpe",
        "jp2",
        "json",
        "json0",
        "dot_json",
        "xdot_json",
        "pdf",
        "pic",
        "pct",
        "pict",
        "plain",
        "plain-ext",
        "png",
        "pov",
        "ps",
        "ps2",
        "psd",
        "sgi",
        "svg",
        "svgz",
        "tga",
        "tiff",
        "tif",
        "tk",
        "vml",
        "vmlz",
        "wbmp",
        "webp",
        "xlib",
        "x11",
      },
    },
  },
  server = {
    on_attach = on_attach,
    standalone = true,
    settings = {
      ["rust-analyzer"] = {},
    },
  },
  dap = {
    adapter = {
      type = "executable",
      command = "lldb-vscode",
      name = "rt_lldb",
    },
  },
})
