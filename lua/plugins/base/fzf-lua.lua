local colors = require("catppuccin.palettes").get_palette("mocha")
return {
  "ibhagwan/fzf-lua",
  dependencies = { "echasnovski/mini.icons" },
  opts = {
    winopts = {
      height = 0.85,
      width = 0.80,
      row = 0.35,
      col = 0.50,
      border = "rounded",
      title = " Find Files ",
      title_pos = "center",
      fullscreen = false,
    },
    fzf_opts = {
      -- ["--layout"] = "reverse-list",
      ["--layout"] = "reverse", -- matches Telescope's feel
      ["--info"] = "inline",
      ["--prompt"] = "   ",
    },
    previewers = {
      builtin = {
        syntax = true,
        scrollbar = true,
      },
    },
    fzf_colors = {
      true,
      ["fg+"] = { "fg", { "Comment", "Normal" }, "bold", "underline" },
    },
  },
  config = function(_, opts)
    require("fzf-lua").setup(opts)

    -- Optional: remap keys to use fzf-lua instead of Telescope
    local map = vim.keymap.set
    map("n", "<leader>ff", "<cmd>FzfLua files<CR>", { desc = "Find Files (fzf-lua)" })
    map("n", "<leader>fg", "<cmd>FzfLua live_grep<CR>", { desc = "Live Grep (fzf-lua)" })
    map("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", { desc = "Buffers (fzf-lua)" })
    map("n", "<leader>fh", "<cmd>FzfLua help_tags<CR>", { desc = "Help Tags (fzf-lua)" })

    -- Apply Telescope-style highlights
    vim.cmd([[
      hi! link FzfLuaBorder TelescopeBorder
      hi! link FzfLuaTitle TelescopeTitle
      hi! link FzfLuaPreviewBorder TelescopePreviewBorder
      hi! link FzfLuaCursorLine TelescopeSelection
    ]])
  end,
}
