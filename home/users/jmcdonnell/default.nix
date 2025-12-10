{ pkgs, inputs, ... }:
{
    imports = [
        ../shared-programs
        ./programs/git
        inputs.zen-browser.homeModules.beta
    ];

    home.username = "jmcdonnell";
    home.homeDirectory = "/home/jmcdonnell";

    home.packages = with pkgs; [
        kitty
    ];

    programs.zen-browser.enable = true;

    home.stateVersion = "25.11";
}
