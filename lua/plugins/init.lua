return {{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {"go", "lua", "vim"},
            sync_install = false,
            highlight = {
                enable = true
            },
            auto_install = true,
            indent = {
                enable = true
            }
        })
    end
}, {
    "hrsh7th/nvim-cmp",
    dependencies = {"hrsh7th/cmp-nvim-lsp"},
    config = function()
        local cmp = require("cmp")

        cmp.setup({
            snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body)
                end
            },
            window = {
                completion = cmp.config.window.bordered()
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({
                    select = true
                })
            }),
            sources = cmp.config.sources({{
                name = "nvim_lsp"
            }}, {
                name = "buffer"
            })
        })

        vim.keymap.set({"i", "s"}, "<Tab>", function()
            if vim.snippet.active({ direction = 1}) then
                return "<Cmd>lua vim.snippet.jump(1)<CR>"
            else
                return "<Tab>"
            end
        end, { noremap = true, expr = true })

        vim.keymap.set({"i", "s"}, "<S-Tab>", function()
            if vim.snippet.active({ direction = -1}) then
                return "<Cmd>lua vim.snippet.jump(-1)<CR>"
            else
                return "<S-Tab>"
            end
        end, { noremap = true, expr = true })
    end
}, {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {'nvim-lua/plenary.nvim'},
    config = function()
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>ff', builtin.find_files, {
            desc = 'Telescope find files'
        })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {
            desc = 'Telescope live grep'
        })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {
            desc = 'Telescope buffers'
        })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {
            desc = 'Telescope help tags'
        })
    end
}, {
    'rmagatti/auto-session',
    lazy = false,
    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
		keys = {
			{ '<leader>wr', '<cmd>SessionSearch<CR>', desc = 'Session search' },
		},
    opts = {
        suppressed_dirs = {'~/', '~/Projects', '~/Downloads', '/'}
        -- log_level = 'debug',
    }
}, { 
		"catppuccin/nvim", 
		name = "catppuccin", 
		priority = 1000
}}
