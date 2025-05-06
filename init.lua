require("config.lazy")
require("config.lsp")

vim.keymap.set("n", "<leader>at", ":!go test ./...<CR>", { desc = "Run all Go tests" })
vim.keymap.set("c", "%%", function()
  return vim.fn.expand("%:p:h")
end, { expr = true })

vim.cmd.colorscheme "catppuccin"

