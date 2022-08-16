require('base')
require('keymaps')
require('plugins')

-- enable syntax
vim.cmd('syntax on')

-- setup colorscheme
vim.cmd('colorscheme monokai')

local has = function(x)
    return vim.fn.has(x) == 1
end

local is_mac = has 'macunix'

if is_mac then
    require('macos')
end
