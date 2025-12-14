{ lib, ... }:
{
    programs.kitty = lib.mkForce {
        enable = true;
        settings = {
            window_padding_with = "0 4";
            background_image_layout = "centered";
            background_image = "/home/jmcdonnell/Pictures/terminal-background.jpg";
        };
    };
}
