vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'fatih/vim-go'
    use { 'sago35/tinygo.vim' }
    use { 'sebdah/vim-delve' }
	use 'junegunn/fzf'
	use 'junegunn/fzf.vim'
	use 'SirVer/ultisnips'
	use 'honza/vim-snippets'
	use 'nvim-lua/plenary.nvim'
	use 'ThePrimeagen/harpoon'
	use 'preservim/nerdtree'
	use 'tpope/vim-commentary'
	use 'tpope/vim-fugitive'
	use {
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		wants = { "nvim-lsp-installer" },
		config = function()
			require("config.lsp").setup()
		end,
		requires = {
			"williamboman/nvim-lsp-installer",
		},
	}

	-- Better UI than native LSP dialogs
    use 'glepnir/lspsaga.nvim'
    use 'folke/tokyonight.nvim'
    use {
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use ('prettier/vim-prettier')
    use { 'sbdchd/neoformat' }
    use {'dcampos/nvim-snippy'}
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use {'jparise/vim-graphql'}

end)

