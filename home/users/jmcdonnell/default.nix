{ pkgs, inputs, ... }:
{
    imports = [
        ./programs/zsh
        ./programs/nvim
        ./programs/git
        ./programs/gh
        ./programs/zellij
        inputs.zen-browser.homeModules.beta
    ];

    home.username = "jmcdonnell";
    home.homeDirectory = "/home/jmcdonnell";

    home.packages = with pkgs; [
        ripgrep
        neofetch
        kitty
        git
        zellij
    ];

    programs.zen-browser.enable = true;

    home.stateVersion = "25.11";
}
