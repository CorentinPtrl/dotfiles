{config, ...}: {
  home.sessionVariables.STARSHIP_CACHE = "${config.xdg.cacheHome}/starship";

  programs.starship = {
    enable = true;
    settings = {
      right_format = "$time";
      line_break.disabled = true;
      azure = {
         disabled = false;
         format = "on [$symbol($username)]($style) ";
         symbol = "ﴃ ";
         style = "blue bold";
      };
      username = {
         #style_user = "bold dimmed blue";
         show_always = true;
      };
      hostname = {
         ssh_only = false;
      };

      character = {
        success_symbol = "[›](bold green)";
        error_symbol = "[›](bold red)";
      };

      git_status = {
        deleted = "✗";
        modified = "✶";
        staged = "✓";
        stashed = "≡";
      };

      nix_shell = {
        symbol = " ";
        heuristic = true;
      };
    };
  };
}
