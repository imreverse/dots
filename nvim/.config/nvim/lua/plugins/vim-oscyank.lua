-- au({ "TextYankPost" }, {
--     pattern = '*',
--     command = "if v:event.operator is 'y' && v:event.regname is '+' execute 'OSCYankRegister +' endif "
-- })
-- vim.cmd[[
-- 	autocmd TextYankPost *
-- 	    \ if v:event.operator is 'y' && v:event.regname is '+' |
-- 	    \ execute 'OSCYankRegister +' |
-- 	    \ endif
-- ]]
vim.keymap.set('n', 'y', require('osc52').copy_operator, {expr = true})
vim.keymap.set('n', 'yy', '<leader>c_', {remap = true})
vim.keymap.set('v', 'y', require('osc52').copy_visual)
-- function copy()
--   if vim.v.event.operator == 'y' then
--     require('osc52').copy_operator()
--   end
-- end

-- vim.api.nvim_create_autocmd('TextYankPost', {callback = copy})
