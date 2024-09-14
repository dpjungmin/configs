-- https://github.com/lewis6991/gitsigns.nvim

local function on_attach(_)
  local gs = package.loaded.gitsigns

  vim.keymap.set("n", "<leader>tgd", gs.toggle_deleted, { desc = "toggle git deleted" })
  vim.keymap.set("n", "<leader>tgs", gs.toggle_signs, { desc = "toggle git signs" })
  vim.keymap.set({ "o", "x" }, "ih", ":<c-u>Gitsigns select_hunk<cr>")

  vim.keymap.set(
    { "n", "v" },
    "\\gs",
    gs.stage_hunk,
    { noremap = true, silent = true, desc = "stage the hunk at the cursor position" }
  )
  vim.keymap.set(
    { "n", "v" },
    "\\gr",
    gs.reset_hunk,
    { noremap = true, silent = true, desc = "reset the lines of the hunk at the cursor position" }
  )
  vim.keymap.set(
    "n",
    "\\gS",
    gs.stage_buffer,
    { noremap = true, silent = true, desc = "stage all hunks in current buffer" }
  )
  vim.keymap.set(
    "n",
    "\\gu",
    gs.undo_stage_hunk,
    { noremap = true, silent = true, desc = "undo the last stage_hunk()" }
  )
  vim.keymap.set(
    "n",
    "\\gR",
    gs.reset_buffer,
    { noremap = true, silent = true, desc = "reset the lines of all hunks in the buffer" }
  )
  vim.keymap.set(
    "n",
    "<leader>p",
    gs.preview_hunk,
    { noremap = true, silent = true, desc = "preview the hunk at the cursor position" }
  )
  vim.keymap.set(
    "n",
    "<leader>tgb",
    gs.toggle_current_line_blame,
    { noremap = true, silent = true, desc = "toggle current-line git blame" }
  )

  vim.keymap.set("n", "\\gb", function()
    gs.blame_line({ full = true })
  end, { noremap = true, silent = true, desc = "run git blame on the current line" })
  vim.keymap.set("n", "]g", function()
    if vim.wo.diff then
      return "]c"
    end
    vim.schedule(gs.next_hunk)
    return "<Ignore>"
  end, { noremap = true, silent = true, expr = true, desc = "jump to the next hunk" })
  vim.keymap.set("n", "[g", function()
    if vim.wo.diff then
      return "[c"
    end
    vim.schedule(gs.prev_hunk)
    return "<Ignore>"
  end, { noremap = true, silent = true, expr = true, desc = "jump to the previous hunk" })
end

return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      signs_staged = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      signs_staged_enable = true,
      signcolumn = true,
      numhl = false,
      linehl = false,
      word_diff = false,
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 500,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil,
      max_file_length = 40000,
      preview_config = {
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
      on_attach = on_attach,
      current_line_blame = false,
    })

    -- highlights
    vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { fg = "#2ecc71" })

    vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#46954a" })
    vim.api.nvim_set_hl(0, "GitSignsStagedAdd", { fg = "#025106" })
    vim.api.nvim_set_hl(0, "GitSignsAddInline", { fg = "#ffffff", bg = "#46954a" })
    vim.api.nvim_set_hl(0, "GitSignsAddLnInline", { link = "GitSignsAddInline" })
    vim.api.nvim_set_hl(0, "GitSignsAddLnVirtLnInline", { link = "GitSignsAddInline" })

    vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#ae7c14" })
    vim.api.nvim_set_hl(0, "GitSignsStagedChange", { fg = "#6a3900" })
    vim.api.nvim_set_hl(0, "GitSignsChangeInline", { fg = "#ffffff", bg = "#ae7c14" })
    vim.api.nvim_set_hl(0, "GitSignsChangeLnInline", { link = "GitSignsChangeInline" })
    vim.api.nvim_set_hl(0, "GitSignsChangeLnVirtLnInline", { link = "GitSignsChangeInline" })

    vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#e5534b" })
    vim.api.nvim_set_hl(0, "GitSignsStagedDelete", { fg = "#a11007" })
    vim.api.nvim_set_hl(0, "GitSignsDeleteInline", { fg = "#ffffff", bg = "#e5534b" })
    vim.api.nvim_set_hl(0, "GitSignsDeleteLnInline", { link = "GitSignsDeleteInline" })
    vim.api.nvim_set_hl(0, "GitSignsDeleteLnVirtLnInline", { link = "GitSignsDeleteInline" })
  end,
}
