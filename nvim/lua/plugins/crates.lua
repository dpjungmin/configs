-- https://github.com/Saecki/crates.nvim

return {
  "saecki/crates.nvim",
  tag = "stable",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = { "BufRead Cargo.toml" },
  config = function()
    require("crates").setup({
      text = {
        loading = "    Loading",
        version = "    %s",
        prerelease = "    %s",
        yanked = "    %s",
        nomatch = "    No match",
        upgrade = "    %s",
        error = "    Error fetching crate",
      },
    })

    local crates = require("crates")
    local opts = { silent = true }

    vim.keymap.set("n", "<leader>ct", crates.toggle, opts)
    vim.keymap.set("n", "<leader>cr", crates.reload, opts)

    vim.keymap.set("n", "<leader>cv", crates.show_versions_popup, opts)
    vim.keymap.set("n", "<leader>cf", crates.show_features_popup, opts)
    vim.keymap.set("n", "<leader>cd", crates.show_dependencies_popup, opts)

    vim.keymap.set("n", "<leader>cu", crates.update_crate, opts)
    vim.keymap.set("v", "<leader>cu", crates.update_crates, opts)
    vim.keymap.set("n", "<leader>ca", crates.update_all_crates, opts)
    vim.keymap.set("n", "<leader>cU", crates.upgrade_crate, opts)
    vim.keymap.set("v", "<leader>cU", crates.upgrade_crates, opts)
    vim.keymap.set("n", "<leader>cA", crates.upgrade_all_crates, opts)

    vim.keymap.set("n", "<leader>ce", crates.expand_plain_crate_to_inline_table, opts)
    vim.keymap.set("n", "<leader>cE", crates.extract_crate_into_table, opts)

    vim.keymap.set("n", "<leader>cH", crates.open_homepage, opts)
    vim.keymap.set("n", "<leader>cR", crates.open_repository, opts)
    vim.keymap.set("n", "<leader>cD", crates.open_documentation, opts)
    vim.keymap.set("n", "<leader>cC", crates.open_crates_io, opts)
  end,
}
