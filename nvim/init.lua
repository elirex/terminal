require('base')
require('keymaps')
require('plugins')

-- enable syntax
vim.cmd('syntax on')

-- setup colorscheme
-- vim.cmd('colorscheme monokai')
vim.cmd('colorscheme gruvbox')

local has = function(x)
    return vim.fn.has(x) == 1
end

local is_mac = has 'macunix'

if is_mac then
    require('macos')
end
