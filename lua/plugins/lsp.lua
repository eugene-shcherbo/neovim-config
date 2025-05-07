return {{
    "neovim/nvim-lspconfig",
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

				vim.lsp.config('gopls', {
					capabilities = capabilities,
					settings = {
						['gopls'] = {
							gofumpt = true,
						}
					}
				})

				vim.lsp.enable('gopls')

				vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, { desc = "LSP: Rename Symbol" })
    end
}}
