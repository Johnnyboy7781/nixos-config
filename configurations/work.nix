{ pkgs, lib, ... }:
let
    kmiCacertPath = "/home/nixos/cacerts/trusted.kmi.lan.pem";
in
{
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    wsl.enable = true;
    wsl.defaultUser = "nixos";

    environment.systemPackages = with pkgs; [
        git
        wget
        fd
    ];

    environment.shells = with pkgs; [ zsh ];
    programs.zsh.enable = true;

    users.users.nixos = {
        isNormalUser = true;
        name = "nixos";
        home = "/home/nixos";
        shell = pkgs.zsh;
    };

    security.pki.certificates = lib.mkIf (builtins.pathExists kmiCacertPath) [
        (builtins.readFile /home/nixos/cacerts/trusted.kmi.lan.pem)
    ];

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It's perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "25.05"; # Did you read the comment?
}

