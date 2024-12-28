return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	version = "*",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons", -- optional dependency
	},
	opts = {
		symbols = {
			modified = "●", ---Modification indicator.
			ellipsis = " ", ---Truncation indicator.
			separator = "", ---Entry separator.
		},
		kinds = {
			File = "",
			Module = "",
			Namespace = "",
			Package = "",
			Class = "",
			Method = "",
			Property = "",
			Field = "",
			Constructor = "",
			Enum = "",
			Interface = "",
			Function = "",
			Variable = "",
			Constant = "",
			String = "",
			Number = "",
			Boolean = "",
			Array = "",
			Object = "",
			Key = "",
			Null = "",
			EnumMember = "",
			Struct = "",
			Event = "",
			Operator = "",
			TypeParameter = "",
		},
	},
}
