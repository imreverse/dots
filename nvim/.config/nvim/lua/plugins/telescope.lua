require('telescope').setup
{
	defaults =
	{
		-- vimgrep_arguments =
		-- {
		-- 	'rg',
		-- 	'--color=never',
		-- 	'--no-heading',
		-- 	'--with-filename',
		-- 	'--line-number',
		-- 	'--column',
		-- 	'--smart-case',
		-- 	'--hidden'
		-- },
		-- prompt_prefix = " ",
		-- selection_caret = "  ",
		-- entry_prefix = "  ",
		-- initial_mode = "insert",
		-- selection_strategy = "reset",
		-- sorting_strategy = "descending",
		-- layout_strategy = "horizontal",
		layout_config =
		{
			-- horizontal =
			-- {
			-- 	mirror = false,
			-- },
			vertical =
			{
				mirror = true
			},
		},
		-- file_sorter =  require'telescope.sorters'.get_fuzzy_file,
		-- file_ignore_patterns =
		-- {
		-- 	"node_modules",
		-- 	".git/.*"
		-- },
		-- generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
		-- winblend = 0,
		-- border = {},
		-- borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
		-- color_devicons = true,
		-- use_less = true,
		-- path_display = { "truncate" },
		-- set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
		-- file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
		-- grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
		-- qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
		-- cache_picker =
		-- {
		-- 	num_pickers = -1
		-- },
		--
		-- -- Developer configurations: Not meant for general override
		-- buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
	},
	pickers = {
		find_files = {
			hidden = true,
			layout_strategy = "vertical",
		},
		buffers = {
			hidden = false,
			layout_strategy = "vertical",
		},
	},
	extensions = {
	}
}

-- Load extensions
require('telescope').load_extension('live_grep_args')

-- Custom Mappings
map('n', '<Leader>ff', '<cmd>Telescope find_files<CR>', nosil)
map('n', '<Leader>fb', '<cmd>Telescope buffers<CR>', nosil)
-- map('n', '<Leader>fg', '<cmd>Telescope live_grep<CR>', nosil)
map('n', '<Leader>fg', '<cmd>Telescope live_grep_args<CR>', nosil)

map('n', '<Leader>fo', '<cmd>Telescope oldfiles<CR>', nosil)
map('n', 'q/', '<cmd>Telescope search_history<CR>', nosil)
map('n', 'q:', '<cmd>Telescope command_history<CR>', nosil)
map('n', '<Leader>fd', '<cmd>Telescope diagnostics<CR>', nosil)
-- map('n', '<Leader>fs', ':Telescope luasnip<CR>', nosil)

-- map('n', '<Leader>gs', '<cmd>Telescope git_status<CR>', nosil)
-- map('n', '<Leader>gc', '<cmd>Telescope git_commits<CR>', nosil)
