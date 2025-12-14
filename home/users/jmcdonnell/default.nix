{ pkgs, ... }:
{
    imports = [
        ../shared-programs
        ./programs/git
        ./programs/kitty
    ];

    home.username = "jmcdonnell";
    home.homeDirectory = "/home/jmcdonnell";

    home.packages = with pkgs; [
        kitty
        obsidian
        discord
    ];

    home.stateVersion = "25.11";
}
