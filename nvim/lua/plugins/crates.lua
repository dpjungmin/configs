return {
  "saecki/crates.nvim",
  tag = "v0.3.0",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = { "BufRead Cargo.toml" },
  keys = {
    {
      "<leader>cd",
      "<cmd>lua require('crates').open_documentation()<cr>",
      desc = "Open the documentation page of the crate on the current line",
    },
  },
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
  end,
}
