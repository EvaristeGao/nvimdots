local bind = require("keymap.bind")
local map_cmd = bind.map_cmd

local builtins = {
	["i|<C-f>"] = map_cmd("<Right>"):with_noremap():with_desc("edit: Move cursor to right"),
	["i|<C-a>"] = map_cmd("<C-[>^i"):with_noremap():with_desc("edit: Move cursor to line start"),
	["i|<C-e>"] = map_cmd("<C-[>A"):with_noremap():with_desc("edit: Move cursor to line end"),
	["i|<C-s>"] = map_cmd("<C-[>:w<CR>"):with_noremap():with_desc("edit: Save file"),
	["i|<C-q>"] = map_cmd("<C-[>:wq<CR>"):with_noremap():with_desc("edit: Save file and quit"),
}

local plugins = {
	-- Plugin: comment.nvim, disable them since we setup the keymaps of this plugin
	-- at user.plugins.editor.lua, when setting up it; see https://github.com/numToStr/Comment.nvim
	["n|gcc"] = "",
	["n|gbc"] = "",
	["n|gc"] = "",
	["n|gb"] = "",
	["x|gc"] = "",
	["x|gb"] = "",
}

return vim.tbl_extend("force", builtins, plugins)
