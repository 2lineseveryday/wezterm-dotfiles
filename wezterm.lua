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
    config.unix_domains = { { name = 'wezterm-uds' } }
    config.default_gui_startup_args = { 'connect', 'wezterm-uds' };
    config.default_domain = 'wezterm-uds'
    config.default_prog = { '/usr/bin/fish' }
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

wezterm.on('update-status', function(window, pane)
    -- 현재 pane의 도메인 이름을 가져옵니다.
    local domain_name = pane:get_domain_name()

    -- 상태바에 텍스트 반영
    window:set_right_status(wezterm.format({
        { Background = { Color = '#333333' } },
        { Foreground = { Color = '#ffffff' } },
        { Text = ' Domain: ' .. domain_name .. '   ' },
    }))
end)

return config
