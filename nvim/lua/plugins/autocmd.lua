local util = require "util"
local api = vim.api

-- Prevent accidental writes to buffers that shouldn't be edited
api.nvim_create_autocmd('BufRead', {
    pattern = { '*.orig', '*.pacnew', '*.lock' },
    command = 'set readonly',
})

-- Leave paste mode when leaving insert mode
api.nvim_create_autocmd('InsertLeave', {
    pattern = '*', 
    command = 'set nopaste',
})

-- Jump to last edit position on opening filee
-- https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
api.nvim_create_autocmd('BufReadPost', {
    pattern = '*', 
    command = [[if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]],
})

api.nvim_create_autocmd('Filetype', {
    pattern = 'rust',
    callback = function()
        vim.o.colorcolumn = 100
    end,
})
api.nvim_create_autocmd('Filetype', {
    pattern = 'html,xml,xsl,php,xhtml,svg',
    callback = function()
        vim.cmd.source("~/.config/nvim/scripts/closetag.vim")
    end,
})

-- Help filetype detection
for ext, ft in ipairs {
    plot = 'gnuplot',
    md = 'markdown',
    lds = 'ld',
    tex = 'tex',
    trm = 'c',
    ['xlsx.axlsx'] = 'ruby',
} do
    api.nvim_create_autocmd('BufRead', {
        pattern = '*.'..ext,
        callback = function() vim.o.filetype = ft end
    })
end

    

