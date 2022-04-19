-- install packer automatically on new system
-- https://github.com/wbthomason/packer.nvim#bootstrapping
local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
end

-- sync plugins on write/save
vim.api.nvim_create_augroup("SyncPackerPlugins", {})
vim.api.nvim_create_autocmd(
  "BufWritePost",
  { command = "source <afile> | PackerSync", pattern = "plugins.lua", group = "SyncPackerPlugins" }
)

-- Plugins via Packer
return require("packer").startup {
  function(use)
    -- use "antoinemadec/FixCursorHold.nvim"
    -- tpope
    use "tpope/vim-surround"
    use "tpope/vim-fugitive"
    use "tpope/vim-repeat"
    use "tpope/vim-eunuch"
    use "tpope/vim-unimpaired"
    use "tpope/vim-abolish"
    use "editorconfig/editorconfig-vim"
    -- markdown plugins
    use { "ellisonleao/glow.nvim", cmd = "Glow" }
    use { "iamcco/markdown-preview.nvim", run = "cd app && yarn install" }
    -- json pathing
    use { "mogelbrod/vim-jsonpath", cmd = "JsonPath" }

    use {
      "luukvbaal/stabilize.nvim",
      config = function()
        require("stabilize").setup()
      end,
    }
    use { "stevearc/dressing.nvim" }
    use {
      "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup()
      end,
    }
    -- use "elihunter173/dirbuf.nvim"
    use "pbrisbin/vim-mkdir"
    -- use "vim-test/vim-test"

    use {
      "klen/nvim-test",
      config = function()
        require("nvim-test").setup {
          commands_create = true, -- create commands (TestFile, TestLast, ...)
          silent = false, -- less notifications
          run = true, -- run test commands
          term = "terminal", -- a terminal to run (terminal|toggleterm)
          termOpts = {
            direction = "vertical", -- terminal's direction (horizontal|vertical|float)
            width = 86, -- terminal's width (for vertical|float)
            height = 24, -- terminal's height (for horizontal|float)
            go_back = false, -- return focus to original window after executing
            stopinsert = false, -- exit from insert mode
          },
          runners = { -- setup test runners, only using for JS. Currently, doesn't add value to Rust workflow 17-Feb-2022
            javascript = "nvim-test.runners.jest",
            lua = "nvim-test.runners.busted",
            -- rust = "nvim-test.runners.cargo-test",
          },
        }
      end,
    }
    use {
      "mbbill/undotree",
      cmd = "UndotreeToggle",
      config = [[vim.g.undotree_SetFocusWhenToggle = 1]],
    }
    use "ruanyl/coverage.vim"
    use "moll/vim-node"
    use "rust-lang/rust.vim"
    use "wbthomason/packer.nvim"
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
    -- 🔭telescope
    use "nvim-telescope/telescope.nvim"
    -- Telescope Extensions
    use "cljoly/telescope-repo.nvim"
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use { "nvim-telescope/telescope-ui-select.nvim" }
    use "dhruvmanila/telescope-bookmarks.nvim"
    use "nvim-telescope/telescope-github.nvim"
    -- Trying command palette
    use { "LinArcX/telescope-command-palette.nvim" }
    use {
      "AckslD/nvim-neoclip.lua",
      config = function()
        require("neoclip").setup()
      end,
    }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use "jvgrootveld/telescope-zoxide"

    use "andymass/vim-matchup"
    use "windwp/nvim-autopairs"
    use "nvim-lua/lsp_extensions.nvim"
    use "p00f/nvim-ts-rainbow"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/lsp-status.nvim"
    use "folke/lua-dev.nvim"
    use "onsails/lspkind-nvim"
    use "ray-x/lsp_signature.nvim"
    -- sitting
    use {
      "lewis6991/spellsitter.nvim",
      config = function()
        require("spellsitter").setup()
      end,
    }
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    }
    use "nvim-treesitter/nvim-treesitter-refactor"
    use "nvim-treesitter/playground"
    use "nvim-treesitter/nvim-treesitter-textobjects"
    use "David-Kunz/treesitter-unit"
    use "jose-elias-alvarez/nvim-lsp-ts-utils"
    use "simrat39/rust-tools.nvim"

    use { "chrisbra/Colorizer", cmd = "ColorToggle" }
    use "nvim-lua/plenary.nvim"
    use "kyazdani42/nvim-web-devicons"
    use "lukas-reineke/indent-blankline.nvim"
    use "rcarriga/nvim-notify"

    -- nvim-cmp
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-nvim-lua" },
        { "ray-x/cmp-treesitter" },
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-vsnip" },
        { "hrsh7th/vim-vsnip" },
        { "Saecki/crates.nvim" },
        { "f3fora/cmp-spell" },
        -- { "hrsh7th/cmp-cmdline" },
        { "tamago324/cmp-zsh" },
      },
      config = function()
        require "joel.completion"
      end,
    }

    use {
      "nvim-lualine/lualine.nvim",
      config = function()
        require "joel.statusline"
      end,
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
    }

    use "arkav/lualine-lsp-progress"

    use {
      "lewis6991/gitsigns.nvim",
      requires = { "nvim-lua/plenary.nvim" },
    }

    -- Local plugins
    use "~/vim-dev/plugins/codesmell_dark.vim"
    -- use "~/vim-dev/plugins/telescope.nvim"
    -- when I need some diffent functionality, may put up a PR later
    -- use "~/vim-dev/plugins/telescope-github.nvim"

    -- setup config after cloning packer
    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
  end,
  config = {
    display = {
      open_fn = require("packer.util").float,
    },
  },
}
