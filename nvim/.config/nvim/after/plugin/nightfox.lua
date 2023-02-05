require('nightfox').setup({
	options = {
		transparent = false,
	}
})

function SetColorScheme(color)
	color = color or 'nightfox'
	vim.cmd.colorscheme(color)
end

SetColorScheme()

