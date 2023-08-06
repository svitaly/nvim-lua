function SetColorsForVim(color)
	-- color = color or "catppuccin"
	color = color or "dracula"
	vim.cmd.colorscheme(color)

end

SetColorsForVim()
