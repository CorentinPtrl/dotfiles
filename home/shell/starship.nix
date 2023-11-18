{ config, pkgs, user, ... }:

{
  programs.starship = {
    enable = true;
    # Configuration written to ~/.config/starship.toml
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
      package.disabled = true;
    };
  };
}
