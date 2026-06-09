{ config, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
    settings = {
      # Tokyo Night theme
      foreground = "#c0caf5";
      background = "#1a1b26";
      selection_foreground = "#c0caf5";
      selection_background = "#283457";

      # Transparency
      background_opacity = "0.85";
      dynamic_background_opacity = true;

      # Cursor
      cursor = "#c0caf5";
      cursor_text_color = "#1a1b26";
      cursor_shape = "beam";
      cursor_blink_interval = "0.5";

      # Window
      window_padding_width = 8;
      hide_window_decorations = true;

      # Tabs
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      active_tab_foreground = "#1a1b26";
      active_tab_background = "#7aa2f7";
      inactive_tab_foreground = "#545c7e";
      inactive_tab_background = "#1a1b26";

      # URL handling
      open_url_with = "default";
      url_style = "curly";
      detect_urls = true;

      # Mouse
      copy_on_select = true;

      # Scrollback
      scrollback_lines = 10000;
      scrollback_pager = "less --chop-long-lines --RAW-CONTROL-CHARS +INPUT_LINE_NUMBER";

      # Bell
      enable_audio_bell = false;

      # Performance
      repaint_delay = 10;
      input_delay = 3;
      sync_to_monitor = true;

      # 16 colors
      color0 = "#15161e";
      color1 = "#f7768e";
      color2 = "#9ece6a";
      color3 = "#e0af68";
      color4 = "#7aa2f7";
      color5 = "#bb9af7";
      color6 = "#7dcfff";
      color7 = "#a9b1d6";
      color8 = "#414868";
      color9 = "#f7768e";
      color10 = "#9ece6a";
      color11 = "#e0af68";
      color12 = "#7aa2f7";
      color13 = "#bb9af7";
      color14 = "#7dcfff";
      color15 = "#c0caf5";
    };
    keybindings = {
      "ctrl+shift+t" = "new_tab";
      "ctrl+shift+enter" = "new_window";
      "ctrl+shift+]" = "next_tab";
      "ctrl+shift+[" = "previous_tab";
      "ctrl+shift+k" = "scroll_to_prompt -1";
      "ctrl+shift+j" = "scroll_to_prompt 1";
    };
  };
}
