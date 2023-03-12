return {
	"ray-x/lsp_signature.nvim",
	opts = { -- opts: https://github.com/ray-x/lsp_signature.nvim#full-configuration-with-default-values
		bind = true,                             -- This is mandatory, otherwise border config won't get registered.
		-- close_timeout = 1000,                    -- close floating window after ms when laster parameter is entered
		fix_pos = true,                         -- set to true, the floating window will not auto-close until finish all parameters
		floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
		hint_enable = true,                      -- virtual hint enable
		hint_prefix = "󱦟 ",                   -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
		hint_scheme = "String",
		hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
		handler_opts = {
			border = "rounded"
		}
	},
}
