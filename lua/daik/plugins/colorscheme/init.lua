local colorscheme = "solarized-osaka" -- 'default' | 'darcula' | 'solarized-osaka' | 'nightfly' 

if colorscheme == 'default' then
	return {}
end
return {
	require('daik.plugins.colorscheme.' .. colorscheme)
}
