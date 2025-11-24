{ ... }:
{
    programs.git = {
        enable = true;
        userName = "Jonathan McDonnell";
        userEmail = "jonathan.mcdonnell@kinsaleins.com";
        ignores = [
            "**/work/**/shells/"
        ];
        extraConfig = {
            push = { autoSetupRemote = true; };
            init.defaultBranch = "main";
        };
        hooks = {
            pre-commit = ./pre-commit;
        };
    };
}
