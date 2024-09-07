local M = {}


local config = require("color_modes.config")

debugPrint = function(msg)
    print(msg)
end

user_colors = config.default_colors

local verbose = false

-- function M.setup(_usr_config)
--     user_colors = vim.tbl_deep_extend("force", config.default_colors, _usr_config or {})
-- end

---so this is a black magic to a degree - we need to wait before execution, cause some jumps take time - 20ms should be UwU
function changeColour()
    vim.defer_fn(function()
        local mode = vim.api.nvim_get_mode().mode
        local color = user_colors.cursor[mode] or "none"

        if color == "none" then 
           return
        end

        vim.api.nvim_command("hi! cursorline guifg=none guibg=" .. color)

        if user_colors.column_marker and user_colors.column_marker.use then
            vim.api.nvim_command(":set colorcolumn=" .. user_colors.column_marker.number)
            vim.api.nvim_command("hi! ColorColumn guifg=none guibg=" .. user_colors.column_marker.colour)
        end

        vim.api.nvim_command(":highlight CursorColumn guibg=" .. color)

         if verbose == true then
            debugPrint("colour changed")
         end

    end, 20)
end

-- Function to deep merge user config into default config
local function deep_merge(defaults, user_config)
    if type(user_config) ~= "table" then
        return user_config
    end

    for k, v in pairs(user_config) do
        if type(v) == "table" and type(defaults[k]) == "table" then
            defaults[k] = deep_merge(defaults[k], v)
        else
            defaults[k] = v
        end
    end

    return defaults
end

-- Setup function to allow user customization
function M.setup(user_config, verbose)
    verbose = verbose or "false"

    if not user_config then return end
    -- Merge user configuration with default configuration
    user_colors = deep_merge(config.default_colors, user_config)
end


M.setup({
   cursor = {
      i = config.colors.red,
   },
   background = {
      i = config.colors.red,
   },
   column_marker = {

   },
})

vim.api.nvim_command([[autocmd ModeChanged * lua changeColour()]])   

changeColour() -- initial invoke

M.COLOR_CONSTANTS = config.colors   --- helps interfacing

return M

