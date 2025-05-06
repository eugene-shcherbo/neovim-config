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

				vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, { desc = "LSP: Rename Symbol" })
    end
}}
