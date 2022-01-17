-- PLUGIN MAPPINGS
cmd('cnoreabbrev PC PackerClean')
cmd('cnoreabbrev PI PackerInstall')
cmd('cnoreabbrev PS PackerSync')

vim.g.mapleader = " "

-- Function{} code fold
map('n', 'zc', 'zfa{', { noremap = true })

-- Undo till last save (Better use undoTree instead)
-- map('n', 'U', ':earlier 1f<CR>', { noremap = true, silent = true })

-- Unmap shift+J
map('n', '<S-j>', '<NOP>', { noremap = true })
map('v', '<S-j>', '<NOP>', { noremap = true })

-- TODO: Add a reason as to why I had to enter two <CR> here
-- Because a single CR also works fine. If I find a usecase for
-- two CRs, try to use the col number and line number to get cursor back
map('n', '<ESC>', ':noh<CR>', nosil)

-- Search for visually highlighted word
map('v', '*', ":<c-u>let temp_variable=@\"<CR>gvy:<c-u>let @/='\\V<C-R>=escape(@\",'/\\')<CR>'<CR>:let @\"=temp_variable<CR>:<c-u>set hlsearch<CR>", nosil)

-- Don't save change,delete to clipboard
map('v', 'd', '\"_d', { noremap = true })
map('n', 'd', '\"_d', { noremap = true })
map('v', 'p', '\"_dP', { noremap = true })
map('v', 'c', '\"_c', { noremap = true })
map('n', 'c', '\"_c', { noremap = true })

-- Select All
map('n', '<C-a>', 'ggVG', { noremap = true })
map('i', '<C-a>', '<ESC>ggVG', { noremap = true })

-- Move b/w splits -- Better use CTRL-W instead (meeh)
map('n', '<Leader>h', '<C-w>h', { noremap = true })
map('n', '<Leader>j', '<C-w>j', { noremap = true })
map('n', '<Leader>k', '<C-w>k', { noremap = true })
map('n', '<Leader>l', '<C-w>l', { noremap = true })

-- Resize Splits
map('n', '<A-h>', ':vert resize -2<CR>', { noremap = true, silent = true })
map('n', '<A-l>', ':vert resize +2<CR>', { noremap = true, silent = true })
map('n', '<A-j>', ':resize -1<CR>', { noremap = true, silent = true })
map('n', '<A-k>', ':resize +1<CR>', { noremap = true, silent = true })

-- Change working directory to current file's directory
-- map('n', '<Leader>da', ':cd %:p:h<CR>', { noremap = true })
-- map('n', '<Leader>cd', ':lcd %:p:h | NERDTreeCWD<CR>', { noremap = true })
-- Unnecessary
-- map('n', '<Leader>vv', ':e $HOME/.config/nvim/init.lua<CR>', { noremap = true })

cmd('cnoreabbrev H vert h')
-- cnoreabbrev H vert h

-- Session Management
map('n', '<Leader>ss', ':source $XDG_DATA_HOME/nvim/session/', { noremap = true })
map('n', '<Leader>sv', ':!mkdir $XDG_DATA_HOME/nvim/session/ -p<CR> :mksession! $XDG_DATA_HOME/nvim/session/', { noremap = true })
-- To save session with updated vimrc settings
-- Try ':set sessionoptions-=options', reload your session
-- then restore it with ':set sessionoptions+=options'.
-- Hack for removing a file from buffer completely
-- This is because when session is rewritten, file
-- isn't removed from the session [Only for vim maybe]
-- cnoreabbrev bd bd <bar> argd*
