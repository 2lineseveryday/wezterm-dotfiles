local wezterm = require('wezterm')
local config = wezterm.config_builder()

config.font = wezterm.font('D2KodingLigature Nerd Font')
config.font_size = 16
config.color_scheme = 'Catppuccin Mocha'

local is_windows = wezterm.target_triple:find('windows')
local is_macos = wezterm.target_triple:find('darwin')
local is_linux = wezterm.target_triple:find('linux')

config.default_domain = 'local'

if is_windows then
    config.default_prog = { 'pwsh.exe', '-NoLogo' }
elseif is_macos then
    -- config.default_prog = { 'pwsh.exe', '-NoLogo' }
elseif is_linux then
    -- config.default_prog = { 'pwsh.exe', '-NoLogo' }
end

config.window_decorations = 'RESIZE'

-- config.window_frame = {
--     inactive_titlebar_bg = '#353535',
--     active_titlebar_bg = '#2b2042',
--     inactive_titlebar_fg = '#cccccc',
--     active_titlebar_fg = '#ffffff',
--     inactive_titlebar_border_bottom = '#2b2042',
--     active_titlebar_border_bottom = '#2b2042',
--     button_fg = '#cccccc',
--     button_bg = '#2b2042',
--     button_hover_fg = '#ffffff',
--     button_hover_bg = '#3b3052',
-- }
--

return config
