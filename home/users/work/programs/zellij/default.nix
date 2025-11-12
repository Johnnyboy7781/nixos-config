{ ... }:
{
    programs.zellij = {
        enable = true;
        enableZshIntegration = true;
        settings = {
            theme = "ao";
            show_startup_tips = false;
            pane_frames = false;
            default_layout = "compact";
            ui.pane_frames = {
                rounded_corners = true;
                hide_session_name = true;
            };
        };
    };
}
