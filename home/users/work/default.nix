{ pkgs, config, lib, ... }:
{
    imports = [
        ./programs/zsh
        ./programs/nvim
        ./programs/git
        ./programs/gh
        ./programs/zellij
    ];

    home.username = "nixos";
    home.homeDirectory = "/home/nixos";

    sops = {
        age.keyFile = "/home/nixos/.config/sops/age/keys.txt";
        defaultSopsFile = ./secrets/kinsale.yaml;
        defaultSymlinkPath = "/run/user/1000/secrets";
        defaultSecretsMountPoint = "/run/user/1000/secrets.d";

        secrets.NPM_PUBLISH_TOKEN = {
            path = "${config.sops.defaultSymlinkPath}/NPM_PUBLISH_TOKEN";
        };
    };

    home.file.".npmrc".text = lib.generators.toINIWithGlobalSection {} {
        globalSection = {
            prefix = "~/.npm";
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
        rustc
        rustup
        gcc

        # misc
        glow # markdown previewer
    ];

    home.stateVersion = "25.05";
}
