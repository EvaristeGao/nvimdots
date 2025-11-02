local secret_key = require("core.settings").chat_api_key

return {
	opts = {
		chat_lang = "Chinese",
	},
	strategies = {
		chat = {
			opts = {
				---@param ctx CodeCompanion.SystemPrompt.Context
				---@return string
				system_prompt = function(ctx)
					return ctx.default_system_prompt
						.. string.format(
							[[Additional context:
所有非代码文本必须以中文语言回复.
当前日期是 %s.
用户的 Neovim 版本是 %s.
用户正在 %s 机器上工作. 如果适用，请使用特定系统命令进行响应.
用户使用的各种软件和库的版本很新，请不要再说用户的某某库很旧了.
]],
							ctx.date,
							ctx.nvim_version,
							ctx.os
						)
				end,
			},
		},
	},
	adapters = {
		http = {
			openrouter = function()
				return require("codecompanion.adapters").extend("openai_compatible", {
					env = {
						url = "https://ark.cn-beijing.volces.com/api",
						api_key = secret_key,
						chat_url = "/v3/chat/completions",
					},
					schema = {
						model = {
							default = vim.g.current_chat_model,
						},
					},
				})
			end,
		},
	},
}
