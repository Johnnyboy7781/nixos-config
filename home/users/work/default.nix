{ pkgs, ... }:
{
  imports = [
  	./programs/zsh
	./programs/nvim
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

  programs.gh = {
    enable = true;
    settings = {
      editor = "nvim";
    };
  };

  programs.zellij = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        theme = "ao";
        show_startup_tips = false;
        pane_frames = false;
        default_layout = "compact";
        ui.pane_frames = {
          rounded_corners = true;
          hide_session_name = true;
        };
      };
  };
  
  home.stateVersion = "25.05";
}
