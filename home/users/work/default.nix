{ pkgs, config, ... }:
{
  imports = [
  	./programs/zsh
	./programs/nvim
  ];

  home.username = "nixos";
  home.homeDirectory = "/home/nixos";

  sops = {
    age.keyFile = "/home/nixos/.config/sops/age/keys.txt";
    defaultSopsFile = ./secrets/kinsale.yaml;
    defaultSymlinkPath = "/run/user/1000/secrets";
    defaultSecretsMountPoint = "/run/user/1000/secrets.d";

    secrets.api_key = {
        path = "${config.sops.defaultSymlinkPath}/api_key";
    };
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
    nodejs
    nodePackages."@angular/cli"
    curl
    jdt-language-server
    jdk
    maven
    aws-azure-login
    kubectl
    nodePackages.prettier
    ggshield
    lazygit
    age
    sops
    nix-zsh-completions
    
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
