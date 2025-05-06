return {{
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        lspconfig.gopls.setup({
            capabilities = capabilities,
            settings = {
                gopls = {
                    gofumpt = true,
                    usePlaceholders = true
                }
            }
        })

			vim.lsp.config('omnisharp', {
				capabilities = capabilities
			})	

			vim.lsp.enable('omnisharp')

				vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, { desc = "LSP: Rename Symbol" })
    end
},
	{
		"OmniSharp/omnisharp-vim",
		init = function()
			vim.g.OmniSharp_server_use_net6 = 1
		end
	}
}
