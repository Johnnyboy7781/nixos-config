{ conig, pkgs, ... }:
{
  imports = [
  	./programs/zsh.nix
  ];

  home.username = "nixos";
  home.homeDirectory = "/home/nixos";

  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  home.packages = with pkgs; [
    neofetch
    nnn

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep
    jq
    yq-go
    eza
    fzf
    
    # misc
    glow # markdown previewer
  ];

  programs.git = {
    enable = true;
    userName = "Jonathan McDonnell";
    userEmail = "jonathan.mcdonnell@kinsaleins.com";
  };
  
  home.stateVersion = "25.05";
}
