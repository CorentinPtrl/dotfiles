{ config, pkgs, user, ... }:

{
    programs = {
        zsh = {
            enable = true;
            oh-my-zsh = {
                enable = true;
                theme = "robbyrussel";
                plugins = [
                    "git"
                    "thefuck"
                ];
            };
            enableAutosuggestions = true;
            enableCompletion = true;
            syntaxHighlighting.enable = true;
            shellAliases = {
                grep = "grep --color";
                ip = "ip --color";
                l = "eza -l";
                ls = "eza";
                la = "eza -la";
                md = "mkdir -p";
                ppc = "powerprofilesctl";
                pf = "powerprofilesctl launch -p performance";
                us = "systemctl --user";
                rs = "sudo systemctl";
            };
            shellGlobalAliases = {eza = "eza --icons --git";};
        };
    };
}
