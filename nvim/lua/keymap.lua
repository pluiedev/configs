vim.keymap.set('', '<C-q>', ':confirm qall<cr>')
-- Quick save
vim.keymap.set('n', '<leader>w', ':w<cr>', { remap = true })

-- Search results centered please
for _, b in ipairs { 'n', 'N', '*', '#', 'g*' } do
    vim.keymap.set('n', b, b..'zz', { silent = true })
end

-- Very magic by default (all special characters we can get)
vim.keymap.set('n', '?', '?\\v')
vim.keymap.set('n', '/', '/\\v')
vim.keymap.set('n', '%s/', '%sm/')

-- Don't interfere witth my tmux prefix, please
vim.keymap.set('n', '<leader>a', '<C-a>')

vim.keymap.set('n', '<leader>sv', function()
    vim.cmd.source('~/.config/nvim/init.lua')
end)

vim.keymap.set('n', ';', ':') -- ; as :
-- Ctrl+h to stop searching
vim.keymap.set({'v', 'n'}, '<C-h>', vim.cmd.nohlsearch)
-- Ctrl+f to suspend
vim.keymap.set({'v', 'n', 'i'}, '<C-f>', vim.cmd.sus)

-- Jump to start and end of line using home row keys
vim.keymap.set('', 'H', '^', { remap = true })
vim.keymap.set('', 'L', '$', { remap = true })

-- Neat X rlipboard integration
-- <leader>p will past clipboard into buffer
-- <leader>c will copy entire buffer into clipboard
vim.keymap.set('', '<leader>p', ':r !xsel --clipboard --output<cr>') 
vim.keymap.set('', '<leader>c', ':w !xsel -ib<cr><cr>') 

vim.keymap.set('', '<leader>o', ':e <C-R>=expand("%:p:h") . "/"<cr>')

-- NO ARROW KEYS, FOLKS!!
vim.keymap.set({'n', 'i'}, '<up>', '<nop>')
vim.keymap.set({'n', 'i'}, '<down>', '<nop>')
vim.keymap.set('i', '<left>', '<nop>')
vim.keymap.set('i', '<right>', '<nop>')

-- Left and right switch between buffers
vim.keymap.set('n', '<left>', vim.cmd.bp)
vim.keymap.set('n', '<right>', vim.cmd.bn)

-- Move by line
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- <leader><leader> toggles between buffers
vim.keymap.set('n', '<leader><leader>', '<C-^>')

-- <leader>, shows/hides hidden characters
vim.keymap.set('n', '<leader>,', ':set invlist<cr>')

-- <leader>q shows stats
vim.keymap.set('n', '<leader>q', 'g<C-g>')

-- Keymap for replacing up to next _ or -
vim.keymap.set('', '<leader>m', 'ct_')

-- I know :help exists, thanks
vim.keymap.set('', '<F1>', '<nop>')
