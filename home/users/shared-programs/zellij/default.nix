{ ... }:
{
    programs.zellij = {
        enable = true;
        enableZshIntegration = true;
        exitShellOnExit = true;
        settings = {
            theme = "ao";
            show_startup_tips = false;
            pane_frames = false;
            # default_layout = "compact";
            ui.pane_frames = {
                rounded_corners = true;
                hide_session_name = true;
            };
            layout = {
                _children = [
                    {
                        swap_floating_layout = {
                            _children = [
                                {
                                    floating_panes = {
                                        max_panes = 1;
                                        pane = {};
                                    };
                                }
                                {
                                    floating_panes = {
                                        max_panes = 2;
                                        _children = [
                                            {
                                                pane = {
                                                    x = 0;
                                                };
                                            }
                                            {
                                                pane = {
                                                    x = "50%";
                                                };
                                            }
                                        ];
                                    };
                                }
                            ];
                        };
                    }
                ];
            };
        };
    };
}
