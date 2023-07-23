function SetColorsForVim(color)
	color = color or "catppuccin"
	vim.cmd.colorscheme(color)

end

SetColorsForVim()
