-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
}
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use("nvim-treesitter/playground")
    use("theprimeagen/harpoon")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use 'nvim-tree/nvim-web-devicons'
    use "williamboman/mason.nvim"
    use 'mfussenegger/nvim-jdtls'





    ---LuaLine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    --troubleshooting
    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                {
                    position = "bottom",                        -- position of the list can be: bottom, top, left, right
                    height = 10,                                -- height of the trouble list when position is top or bottom
                    width = 50,                                 -- width of the list when position is left or right
                    icons = true,                               -- use devicons for filenames
                    mode = "workspace_diagnostics",             -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
                    fold_open = "",                          -- icon used for open folds
                    fold_closed = "",                        -- icon used for closed folds
                    group = true,                               -- group results by file
                    padding = true,                             -- add an extra new line on top of the list
                    action_keys = {
                                                                -- key mappings for actions in the trouble list
                        -- map to {} to remove a mapping, for example:
                        -- close = {},
                        close = "q",                         -- close the list
                        cancel = "<esc>",                    -- cancel the preview and get back to your last window / buffer / cursor
                        refresh = "r",                       -- manually refresh
                        jump = { "<cr>", "<tab>" },          -- jump to the diagnostic or open / close folds
                        open_split = { "<c-x>" },            -- open buffer in new split
                        open_vsplit = { "<c-v>" },           -- open buffer in new vsplit
                        open_tab = { "<c-t>" },              -- open buffer in new tab
                        jump_close = { "o" },                -- jump to the diagnostic and close the list
                        toggle_mode = "m",                   -- toggle between "workspace" and "document" diagnostics mode
                        toggle_preview = "P",                -- toggle auto_preview
                        preview = "p",                       -- preview the diagnostic location
                        close_folds = { "zM", "zm" },        -- close all folds
                        open_folds = { "zR", "zr" },         -- open all folds
                        toggle_fold = { "zA", "za" },        -- toggle fold of current file
                        previous = "k",                      -- previous item
                        next = "j"                           -- next item
                    },
                    indent_lines = true,                     -- add an indent guide below the fold icons
                    auto_open = false,                       -- automatically open the list when you have diagnostics
                    auto_close = false,                      -- automatically close the list when you have no diagnostics
                    auto_preview = true,                     -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
                    auto_fold = false,                       -- automatically fold a file trouble list at creation
                    auto_jump = { "lsp_definitions" },       -- for the given modes, automatically jump if there is only a single result
                    signs = {
                        -- icons / text used for a diagnostic
                        error = "",
                        warning = "",
                        hint = "",
                        information = "",
                        other = "﫠"
                    },
                    use_diagnostic_signs = true         -- enabling this will use the signs defined in your lsp client
                } }
        end
    }
    --                use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    -- packer
    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }
    -- Lua completion
    use 'nvim-lua/plenary.nvim'
    --Snippets plugin
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }
    --Dashboard plugin
    use {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
            }
        end,
        requires = { 'nvim-tree/nvim-web-devicons' }
    }

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use { "ellisonleao/gruvbox.nvim" }
    use "folke/neodev.nvim"
    use { "windwp/nvim-ts-autotag" }


    use({
        "glepnir/lspsaga.nvim",
        opt = true,
        branch = "main",
        event = "LspAttach",
        config = function()
            require("lspsaga").setup({})
        end,
        requires = {
            { "nvim-tree/nvim-web-devicons" },
            --Please make sure you install markdown and markdown_inline parser
            { "nvim-treesitter/nvim-treesitter" }
        }
    })
end)
