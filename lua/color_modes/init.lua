local M = {}

local config = require("color_modes.config")

M.debugPrint = function(msg)
    print(msg)
end

M.user_colors = {}

function M.setup(_usr_config)
    M.user_colors = vim.tbl_deep_extend("force", config.default_colors, _usr_config or {})
end

---so this is a black magic to a degree - we need to wait before execution, cause some jumps take time - 20ms should be UwU
function changeColour()
    vim.defer_fn(function()
        local mode = vim.api.nvim_get_mode().mode
        local color = M.user_colors.cursor_color[mode] or "none"

        vim.api.nvim_command("hi! cursorline guifg=none guibg=" .. color)

        if M.user_colors.column_marker and M.user_colors.column_marker.use then
            vim.api.nvim_command(":set colorcolumn=" .. M.user_colors.column_marker.number)
            vim.api.nvim_command("hi! ColorColumn guifg=none guibg=" .. M.user_colors.column_marker.colour)
        end

        vim.api.nvim_command(":highlight CursorColumn guibg=" .. color)
    end, 20)
end

vim.api.nvim_command([[autocmd ModeChanged * lua changeColour()]])
vim.api.nvim_command([[autocmd CursorMoved * lua changeColour()]])

-- M.debugPrint("Mode-based color changing has been enabled")

return M

