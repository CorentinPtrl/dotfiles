{ config, pkgs, user, ... }:

{
    programs = {
        zsh = {
            enable = true;
            oh-my-zsh = {
                enable = false;
                theme = "robbyrussel";
                plugins = [
                    "git"
                ];
            };

            enableAutosuggestions = true;
            enableCompletion = true;
            enableSyntaxHighlighting = true;
        };
	starship = {
    	    enable = true;
            # Configuration written to ~/.config/starship.toml
            settings = {
            add_newline = false;
            line_break.disabled = true;
	    
            azure = {
                disabled = false;
                format = "on [$symbol($username)]($style) ";
                symbol = "ﴃ ";
		style = "blue bold";
            };
            
            # character = {
            #   success_symbol = "[➜](bold green)";
            #   error_symbol = "[➜](bold red)";
            # };
            
            # package.disabled = true;
            };
        };
    };
home.file.".zshrc".text = ''
export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
#export ZSH="$HOME/.oh-my-zsh"

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

ZSH_THEME="robbyrussel"
#REFINED_CHAR_SYMBOL="⚡"

# Rofi
export PATH=$HOME/.config/rofi/scripts:$PATH

alias ssh="kitty +kitten ssh"
    '';
}
