local colors = {
  black        = '#282828',
  white        = '#d4d4d4',
  red          = '#ce9178',
  green        = '#4ec9b0',
  blue         = '#5396cd',
  yellow       = '#dcdcaa',
  gray         = '#333333',
  darkgray     = '#252526',
  lightgray    = '#45494e',
  lightergray  = '#626262',
  inactivegray = '#323233',
}
local lualine_theme = {
  normal = {
    a = {bg = colors.lightergray, fg = colors.white, gui = 'bold'},
    b = {bg = colors.lightgray, fg = colors.white},
    c = {bg = colors.inactivegray, fg = colors.white}
  },
  insert = {
    a = {bg = colors.green, fg = colors.black, gui = 'bold'},
    b = {bg = colors.lightgray, fg = colors.white},
    c = {bg = colors.inactivegray, fg = colors.white}
  },
  visual = {
    a = {bg = colors.yellow, fg = colors.black, gui = 'bold'},
    b = {bg = colors.lightgray, fg = colors.white},
    c = {bg = colors.inactivegray, fg = colors.white}
  },
  replace = {
    a = {bg = colors.red, fg = colors.black, gui = 'bold'},
    b = {bg = colors.lightgray, fg = colors.white},
    c = {bg = colors.inactivegray, fg = colors.white}
  },
  command = {
    a = {bg = colors.blue, fg = colors.black, gui = 'bold'},
    b = {bg = colors.lightgray, fg = colors.white},
    c = {bg = colors.inactivegray, fg = colors.white}
  },
  inactive = {
    a = {bg = colors.darkgray, fg = colors.white, gui = 'bold'},
    b = {bg = colors.darkgray, fg = colors.white},
    c = {bg = colors.darkgray, fg = colors.white}
  }
}

return {
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup({
        options = {
          theme = lualine_theme
        },
        -- sections = {
        --   lualine_a = { 
        --     {
        --       'mode',
        --       color = {
        --         bg = '#252526'
        --       }
        --     }
        --   }
        -- }
      })
    end
  },
}
