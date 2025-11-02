local bind = require("keymap.bind")
local map_callback = bind.map_callback

local builtins = {}

local plugins = {
	["nv|<M-=>"] = map_callback(function()
			require("edgy").toggle("right")
		end)
		:with_noremap()
		:with_silent()
		:with_desc("tool: Toggle CodeCompanion"),
}

return vim.tbl_extend("force", builtins, plugins)
