{ ... }:
{
    programs.git = {
        enable = true;
        ignores = [
            "/shells/"
        ];
        settings = {
            push = { autoSetupRemote = true; };
            init.defaultBranch = "main";
            user.name = "Jonathan McDonnell";
            user.email = "jonathan.mcdonnell@kinsaleins.com";
        };
        hooks = {
            pre-commit = ./pre-commit;
        };
    };
}
