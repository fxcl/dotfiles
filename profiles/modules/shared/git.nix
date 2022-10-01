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
            a = "add";
            br = "branch";
            st = "status";
            ss = "status --short";
            ci = "commit";
            di = "diff";
            dc = "diff --cached";
            dt = "difftool";
            co = "checkout";
            pu = "push";
            pl = "pull";
            cat = "cat-file -p";
            rc = "rebase --continue";
            rs = "rebase --skip";
            cp = "cherry-pick";
            l = "log";
            mt = "mergetool";
            sub = "submodule";

            w = "whatchanged";
            vimdiff = "difftool --tool=vimdiff -y";
            vd = "difftool --tool=vimdiff -y";
            od = "difftool --tool=opendiff -y";
            lol = "log --oneline --graph --decorate";
            hist = "log --all --graph --pretty='[%C(cyan)%h%Creset]%C(bold cyan)%d%Creset %s'";
            showdiff = "!sh -c 'git difftool --tool=vimdiff -y $1^ $1' -";
            lg = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
            wl = "walklog";

            unstage = "reset HEAD";
            uncommit = "reset --soft HEAD^";
            stag = "tag -s";
            tags = "tag -l";
            branches = "branch -a";
            remotes = "remote -v";
            fap = "fetch --all --prune";
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
            core.editor = "nvim";
            core.preloadingindex = true;
            core.autocrlf = false;
            core.eol = "lf";

            color.diff = "auto";
            color.status = "auto";
            color.branch = "auto";
            color.interactive = "auto";
            color.ui = true;
            color.pager = true;


            init.defaultBranch = "main";
            commit.gpgsign = true;
            push.default = "current";
            fetch.prune = true;
            pull.rebase = true;
            github.user = "fxcl";
            format.signoff = true;

            pull.ff = "only";
            advice.detachedHead = false;

            diff.external = "${pkgs.difftastic}/bin/difft";
            diff.tool = "vimdiff";
            difftool.prompt = false;
            diff.wsErrorHighlight = "all";
            diff.colorMoved = true;
            diff.colorMovedWS = "allow-indentation-change";

            merge.tool = "vimdiff";
            merge.conflictstyle = "diff3";
            mergetool.prompt = false;

            core.pager = "less";
            pager.branch = "less --quit-if-one-screen";
            pager.stash = "less --quit-if-one-screen";

            log.date = "local";
            rebase.autosquash = true;
            stash.showPath = true;
            tag.sort = "version:refname";
          };

          lfs = {
            enable = true;
          };
        };
      };
    };
}
