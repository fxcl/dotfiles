{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.git;

in

{
  options = with lib; {
    my.modules.git = {
      enable = mkEnableOption ''
        Whether to enable git module
      '';
    };
  };

  config = with lib;
    mkIf cfg.enable {
      home-manager.users."${config.my.username}" = { config, ... }: {
        programs.git = {
          enable = true;
          package = with pkgs; (if stdenv.isDarwin then git else gitFull);
          userName = "fxcl";
          userEmail = "me@gnux.cn";

          signing = {
            key = "7D403DD25CCB0C0C";
            signByDefault = true;
          };

          aliases = {
            ci = "commit";
            di = "diff";
            st = "status";
            co = "checkout";
            br = "branch";
            pu = "push";
            pl = "pull";
            cat = "cat-file -p";
            rc = "rebase --continue";
            rs = "rebase --skip";

            unstage = "reset HEAD";
            uncommit = "reset --soft HEAD^";
            stag = "tag -s";
            tags = "tag -l";
            branches = "branch -a";
            remotes = "remote -v";
            fap = "fetch --all --prune";
            hist = "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short";
            amend = "commit --amend -C HEAD";
            assume = "!git update-index --assume-unchanged";
            unassume = "!git update-index --no-assume-unchanged";
            assumed = "!git ls-files -v | grep ^h | cut -c 3-";
            snapshot = "!git stash save \"snapshot: $(date)\" && git stash apply \"stash@{0}\"";
            snapshots = "!git stash list --grep snapshot";
            conflicts = "!git ls-files -u | awk '{print $4}' | sort -u";
            resolve = "!git conflicts | xargs git add";
          };

          ignores = [
            ".DS_Store"
            ".AppleDouble"
            ".LSOverride"
            ".envrc"
            ".vscode"
            "._*"
            ".DocumentRevisions-V100"
            ".fseventsd"
            ".Spotlight-V100"
            ".TemporaryItems"
            ".Trashes"
            ".VolumeIcon.icns"
            ".com.apple.timemachine.donotpresent"
            ".AppleDB"
            ".AppleDesktop"
            "Network Trash Folder"
            "Temporary Items"
            ".apdisk"
          ];

          extraConfig = {
            core.quotepath = false;
            init.defaultBranch = "main";
            commit.gpgsign = true;
            push.default = "current";
            fetch.prune = true;
            pull.rebase = true;
            github.user = "fxcl";
            pager.branch = false;
            format.signoff = true;
          };

          lfs = {
            enable = true;
          };
        };
      };
    };
}