{ pkgs, ... }:
{
    imports = [
        ./zsh
        ./nvim
        ./gh
        ./zellij
    ];

    home.packages = with pkgs; [
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

        # language support
        nodejs
        nodePackages."@angular/cli"
        curl
        jdt-language-server
        jdk
        maven
        rustc
        cargo
        gcc
        rust-analyzer
        nix-zsh-completions

        # TUIs
        lazygit
        lazydocker
        k9s
        posting

        # misc
        glow
        kubectl
        nodePackages.prettier
        age
        sops
        awscli2
        neofetch
        nnn
    ];

    home.stateVersion = "25.11";
}
