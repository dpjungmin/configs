-- https://github.com/ggandor/leap.nvim

return {
  "ggandor/leap.nvim",
  dependencies = {
    "tpope/vim-repeat",
  },
  config = function()
    -- Until neovim/neovim#20793 (https://github.com/neovim/neovim/issues/20793) is fixed:
    -- Hide the (real) cursor when leaping, and restore it afterwards.
    vim.api.nvim_create_autocmd("User", {
      pattern = "LeapEnter",
      callback = function()
        vim.cmd.hi("Cursor", "blend=100")
        vim.opt.guicursor:append({ "a:Cursor/lCursor" })
      end,
    })
    vim.api.nvim_create_autocmd("User", {
      pattern = "LeapLeave",
      callback = function()
        vim.cmd.hi("Cursor", "blend=0")
        vim.opt.guicursor:remove({ "a:Cursor/lCursor" })
      end,
    })
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        require("leap").init_highlight(true)
      end,
    })

    local leap = require("leap")

    leap.opts.case_sensitive = false
    leap.opts.equivalence_classes = { " \t\r\n" }
    leap.opts.max_phase_one_targets = nil
    leap.opts.highlight_unlabeled_phase_one_targets = false
    leap.opts.max_highlighted_traversal_targets = 10
    leap.opts.substitute_chars = {}
    leap.opts.safe_labels = "sfnut/SFNLHMUGTZ?"
    leap.opts.labels = "sfnjklhodweimbuyvrgtaqpcxz/SFNJKLHODWEIMBUYVRGTAQPCXZ?"
    leap.opts.special_keys = {
      next_target = "<tab>",
      prev_target = "<s-tab>",
      next_group = "<space>",
      prev_group = "<tab>",
    }

    -- keymaps
    vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
    vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
    vim.keymap.set({ "n", "x", "o" }, "J", "<Plug>(leap-from-window)")
    vim.keymap.set({ "x", "o" }, "x", "<Plug>(leap-forward-till)")
    vim.keymap.set({ "x", "o" }, "X", "<Plug>(leap-backward-till)")

    leap.add_repeat_mappings(";", ",", {
      -- False by default. If set to true, the keys will work like the
      -- native semicolon/comma, i.e., forward/backward is understood in
      -- relation to the last motion.
      relative_directions = true,
      -- By default, all modes are included.
      modes = { "n", "x", "o" },
    })

    -- highlights
    vim.api.nvim_set_hl(0, "LeapBackdrop", { fg = "grey" })
    vim.api.nvim_set_hl(0, "LeapMatch", { fg = "white", bold = true, nocombine = true })
    vim.api.nvim_set_hl(0, "LeapLabelPrimary", { fg = "red", bold = true, nocombine = true })
    vim.api.nvim_set_hl(0, "LeapLabelSecondary", { fg = "blue", bold = true, nocombine = true })
  end,
}
