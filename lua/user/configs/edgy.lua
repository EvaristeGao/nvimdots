return {
	-- we can't use right = list here, since the `extend_config` function will merge the list, not overwrite
	right = function()
		return {
			{
				ft = "codecompanion",
				pinned = true,
				collapsed = false,
				size = { width = 0.4 },
				open = "CodeCompanionChat Toggle",
			},
		}
	end,

	keys = {
		["<A-h>"] = function(win)
			local win_id = vim.api.nvim_get_current_win()
			local pos = vim.api.nvim_win_get_position(win_id)
			if pos[2] > 0 then -- right
				win:resize("width", 2)
			else
				win:resize("width", -2)
			end
		end,
		["<A-l>"] = function(win)
			local win_id = vim.api.nvim_get_current_win()
			local pos = vim.api.nvim_win_get_position(win_id)
			if pos[2] > 0 then -- right
				win:resize("width", -2)
			else
				win:resize("width", 2)
			end
		end,
	},
}
