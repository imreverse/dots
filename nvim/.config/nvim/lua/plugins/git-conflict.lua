require 'git-conflict'.setup {
    default_mappings = false
}
map('n', '<Leader>gy', '<Plug>(git-conflict-list-qf)')
map('n', 'co', '<Plug>(git-conflict-ours)')
map('n', 'ct', '<Plug>(git-conflict-theirs)')
map('n', 'cb', '<Plug>(git-conflict-both)')
map('n', 'c0', '<Plug>(git-conflict-none)')
map('n', ']x', '<Plug>(git-conflict-prev-conflict)')
map('n', '[x', '<Plug>(git-conflict-next-conflict)')
