map('n', '<A-e>', ":NvimTreeToggle<CR>:NvimTreeRefresh<CR>", nosil)
map('n', '<Leader>el', ":NvimTreeFindFile<CR>:NvimTreeRefresh<CR>", nosil)
map('n', '<Leader>ec', ":NvimTreeCollapse<CR>", nosil)

-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require 'nvim-tree'.setup {
	renderer            = {
		highlight_opened_files = '3',
		icons           = {
			glyphs      = {
				default = ""
			}
		}
	},
	update_focused_file = {
		enable      = true,
		update_cwd  = false,
		ignore_list = {}
	},
	filters             = {
		dotfiles = false,
		custom = {}
	},
	view                = {
		width = 30,
		hide_root_folder = false,
		side = 'left',
		number = false,
		relativenumber = false,
		signcolumn = "yes"
	},
	trash               = {
		cmd = "trash",
		require_confirm = true
	}
}
