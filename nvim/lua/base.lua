vim.cmd('autocmd!')

-- encoding
vim.scriptencoding = 'uft-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- enable line number
vim.opt.number = true

-- enable mouse support
vim.opt.mouse = a

-- enable highlight current line
vim.opt.cursorline = true

-- enable highlight search
-- enable ignore case
-- enable smart case
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- tabstop: width of tab character
-- softtabstop: fine tunes the amount of whitespace to be added
-- shiftwidth: determines the amount of whitespace to add in normal mode
-- expandtab: when on use space instead of tab
-- textwidth: text wrap width
-- autoindent: autoindent in new line
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.textwidth = 79
vim.opt.expandtab = true
vim.opt.autoindent = true

-- enable highlight the matching part of pairs [], {}, and ()
vim.opt.showmatch = true

-- set the max length of column
vim.opt.colorcolumn = '80'

-- enable always dispaly status bar
vim.opt.laststatus = 2

-- enable always display tab
vim.opt.showtabline = 2

-- setup backspace
vim.opt.backspace = { 'start', 'eol', 'indent' }

-- setup backupskip
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }

vim.opt.listchars = { eol = '↲', tab = '▸ ', space = '·' }
vim.keymap.set('n', '<F3>', ':set invlist <CR>')
vim.keymap.set('i', '<F3>', '<ESC> :set invlist <CR> a')
