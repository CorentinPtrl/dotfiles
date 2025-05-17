{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      # icon fonts
      material-symbols
      # normal fonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      roboto
      
      jetbrains-mono

      maple-mono.CN
      maple-mono.NF
      maple-mono.NF-CN
#      maple-mono-NF
#      maple-mono-SC-NF

      lexend
      nerd-fonts.symbols-only
      #(nerdfonts.override {fonts = ["NerdFontsSymbolsOnly"];})
    ];

    # causes more issues than it solves
    enableDefaultPackages = false;

    # user defined fonts
    # the reason there's Noto Color Emoji everywhere is to override DejaVu's
    # B&W emojis that would sometimes show instead of some Color emojis
    fontconfig.defaultFonts = {
      serif = ["Lexend"];
      sansSerif = ["Lexend"];
      monospace = ["Maple Mono SC NF"];
      # emoji = ["Noto Color Emoji"];
    };
  };
}
