return {
  'themercorp/themer.lua',
  config = function()
    require('themer').setup {
      colorscheme = 'nord',
      styles = {
        ['function'] = { style = 'italic' },
        functionbuiltin = { style = 'italic' },
        variable = { style = 'italic' },
        variableBuiltIn = { style = 'italic' },
        parameter = { style = 'italic' },
      },
    }
  end
}
