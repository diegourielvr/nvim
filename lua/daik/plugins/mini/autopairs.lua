return {
	"echasnovski/mini.pairs", -- Autocompletar llaves {} '' "" [] 
	event = "VeryLazy",
	config = function(_, opts)
	  require("mini.pairs").setup(opts)
	end,
}
