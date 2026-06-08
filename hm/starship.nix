{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.starship = {
    enable = true;
    # enableBashIntegration = true is automatic when programs.bash.enable = true
    settings = {
      # The format is the order modules appear in your prompt
      format = lib.concatStrings [
        "[](fg:#1a1b26)"
        "$os"
        "$directory"
        "$git_branch"
        "$git_status"
        "$nodejs"
        "$lua"
        "$nix_shell"
        "$cmd_duration"
        "[ ](fg:#1a1b26)"
        "$line_break"
        "$character"
      ];

      # How long a command has to run before its duration shows
      cmd_duration = {
        min_time = 2000;
        format = " [ $duration]($style) ";
        style = "fg:#e0af68";
      };

      directory = {
        style = "fg:#7aa2f7 bold";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncate_to_repo = false;
      };

      git_branch = {
        symbol = " ";
        style = "fg:#bb9af7";
        format = "[ $symbol$branch ]($style)";
      };

      git_status = {
        style = "fg:#f7768e";
        format = "[$all_status$ahead_behind ]($style)";
      };

      nodejs = {
        symbol = " ";
        style = "fg:#9ece6a";
        format = "[ $symbol$version ]($style)";
      };

      lua = {
        symbol = " ";
        style = "fg:#7aa2f7";
        format = "[ $symbol$version ]($style)";
      };

      nix_shell = {
        symbol = " ";
        style = "fg:#7dcfff";
        format = "[ $symbol$state ]($style)";
        # This shows when you're inside a nix develop shell — very useful
        impure_msg = "impure";
        pure_msg = "pure";
      };

      character = {
        success_symbol = "[❯](fg:#9ece6a bold)";
        error_symbol = "[❯](fg:#f7768e bold)";
      };

      os = {
        disabled = false;
        style = "fg:#7aa2f7";
      };

      os.symbols.NixOS = " ";
    };
  };
}
