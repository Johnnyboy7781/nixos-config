{ pkgs, lib, ... }:
let
    kmiCacertPath = "/home/nixos/cacerts/trusted.kmi.lan.pem";
    joshPkg = pkgs.josh.system."x86_64-linux".josh;
in
{
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    time.timeZone = "America/New_York";

    wsl.enable = true;
    wsl.defaultUser = "nixos";

    systemd.services.wsl-vpnkit = {
        enable = true;
        description = "WSL VPNKit Service";
        after = ["network.target"];
        serviceConfig = {
            ExecStart = "${pkgs.wsl-vpnkit}/bin/wsl-vpnkit";
            Restart = "always";
            KillMode = "mixed";
        };
    };

    environment.systemPackages = with pkgs; [
        git
        wget
        fd
    ];

    environment.shells = with pkgs; [ zsh joshPkg ];
    programs.zsh.enable = true;

    users.users.nixos = {
        isNormalUser = true;
        name = "nixos";
        home = "/home/nixos";
        shell = joshPkg;
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

