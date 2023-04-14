
return {
  {'windwp/nvim-autopairs', config = true},
  {'windwp/nvim-ts-autotag', config = true},
  {'nmac427/guess-indent.nvim', config = true},
  {'mg979/vim-visual-multi', branch = "master"},
  {'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
    end
  },
  {"folke/zen-mode.nvim", 
    lazy = true,
    keys = {
      {'<leader>z', '<cmd>ZenMode<cr>'}
    },
    config = function()
      require("zen-mode").setup({
        window = {
          width = .55
        }
      })
    end
  }
}
