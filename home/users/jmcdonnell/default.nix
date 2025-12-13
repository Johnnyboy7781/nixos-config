{ pkgs, ... }:
{
    imports = [
        ../shared-programs
        ./programs/git
    ];

    home.username = "jmcdonnell";
    home.homeDirectory = "/home/jmcdonnell";

    home.packages = with pkgs; [
        kitty
    ];

    home.stateVersion = "25.11";
}
