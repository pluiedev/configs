return function()
    require('lualine').setup {
        options = {
            theme = 'powerline',
        },
        sections = {
            lualine_a = {'mode', 'paste'},
            lualine_b = {'buffers'},
            lualine_c = {},
            lualine_x = {'encoding', 'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'},
        }
    }
end
