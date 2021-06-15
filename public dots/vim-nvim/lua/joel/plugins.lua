-- @TODUA: migrate the rest of legacy plugin config
vim.cmd([[
call plug#begin('~/.vim/plugged')
" Plugins
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'pbrisbin/vim-mkdir'
Plug 'vim-test/vim-test'
Plug 'mbbill/undotree'
Plug 'ruanyl/coverage.vim'
Plug 'moll/vim-node'
Plug 'rust-lang/rust.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'chrisbra/Colorizer'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'voldikss/vim-floaterm'
call plug#end()
]])

return require("packer").startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'neovim/nvim-lspconfig'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-github.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use 'andymass/vim-matchup'
    use 'windwp/nvim-autopairs'
    use 'nvim-lua/lsp_extensions.nvim'
    use 'p00f/nvim-ts-rainbow'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/lsp-status.nvim'
    use 'folke/lua-dev.nvim'
    use 'andrejlevkovitch/vim-lua-format'
    use 'tamago324/compe-zsh'
    -- use 'mfussenegger/nvim-dap'

    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        config = function() require 'joel.statusline' end,
        requires = {'kyazdani42/nvim-web-devicons'}
    }
    use {
        'w0rp/ale',
        ft = {'javascript'},
        cmd = 'ALEEnable',
        config = 'vim.cmd[[ALEEnable]]'
    }

    -- @TODUA: move to completion.lua
    use {
        'hrsh7th/nvim-compe',
        requires = {{'hrsh7th/vim-vsnip'}},
        config = function()
            require'compe'.setup {
                enabled = true,
                autocomplete = true,
                debug = false,
                min_length = 1,
                preselect = 'enable',
                throttle_time = 80,
                source_timeout = 200,
                incomplete_delay = 400,
                max_abbr_width = 100,
                max_kind_width = 100,
                max_menu_width = 100,
                documentation = true,
                source = {
                    buffer = true,
                    calc = true,
                    nvim_lsp = true,
                    nvim_lua = true,
                    path = true,
                    snippets_nvim = true,
                    spell = true,
                    tags = true,
                    treesitter = true,
                    vsnip = true,
                    zsh = true
                }
            }
        end
    }

    -- Local plugins
    use '~/vim-dev/plugins/codesmell_dark.vim'
    use '~/vim-dev/plugins/fzf-gh.vim'

    use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'}

    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function()
            require('gitsigns').setup {
                signs = {
                    add = {
                        hl = 'DiffAdd',
                        text = '│',
                        numhl = 'GitSignsAddNr'
                    },
                    change = {
                        hl = 'DiffChange',
                        text = '│',
                        numhl = 'GitSignsChangeNr'
                    },
                    delete = {
                        hl = 'DiffDelete',
                        text = '_',
                        numhl = 'GitSignsDeleteNr'
                    },
                    topdelete = {
                        hl = 'DiffDelete',
                        text = '‾',
                        numhl = 'GitSignsDeleteNr'
                    },
                    changedelete = {
                        hl = 'DiffChange',
                        text = '~',
                        numhl = 'GitSignsChangeNr'
                    }
                }
            }
        end
    }

    require'nvim-web-devicons'.setup {
        override = {zsh = {icon = '', color = '#428850', name = 'Zsh'}},
        default = true
    }

    require'lspconfig'.tsserver.setup {}
    require'lspconfig'.graphql.setup {}
    require'lspconfig'.clangd.setup {}
    -- VimL (full circle!)
    require'lspconfig'.vimls.setup {}
    -- nvim-autopairs
    require('nvim-autopairs').setup()
    -- nvim_lsp object
    local nvim_lsp = require 'lspconfig'

    -- snippet support
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    -- Enable rust_analyzer
    nvim_lsp.rust_analyzer.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            ['rust-analyzer'] = {
                cargo = {loadOutDirsFromCheck = true},
                procMacro = {enable = true}
            }
        }
    })
end)
