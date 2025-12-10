{ pkgs, config, lib, ... }:
{
    imports = [
        ../shared-programs
        ./programs/git
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
            ***REMOVED***
            auth-type = "legacy";
            ***REMOVED***
            ***REMOVED***
        };
    };

    home.packages = with pkgs; [
        aws-azure-login
        ggshield
    ];

    home.stateVersion = "25.11";
}
