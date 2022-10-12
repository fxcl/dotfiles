{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.shells;
  inherit (config.my.user) home;

  darwinPackages = with pkgs; [ openssl gawk gnused coreutils findutils ];
  nixosPackages = with pkgs; [ dwm dmenu xclip ];

in

{
  options = with lib; {
    my.modules.shells = {
      enable = mkEnableOption ''
        Whether to enable shells module
      '';
    };
  };

    config = with lib;
    mkIf cfg.enable (mkMerge [
      {

        # List packages installed in system profile. To search by name, run:
        # $ nix-env -qaP | grep wget
        environment = {
          shells = [ pkgs.bashInteractive pkgs.zsh ];
          variables = {
            # NOTE: Darwin doesn't set them by default, unlike NixOS. So we have to set them.
            XDG_CACHE_HOME = "${home}/.cache";
            XDG_CONFIG_HOME = "${home}/.config";
            XDG_DATA_HOME = "${home}/.local/share";
            XDG_STATE_HOME = "${home}/.local/state";
            XDG_BIN_HOME = "${home}/.local/bin";
            XDG_RUNTIME_DIR = "${home}/.local/run";

            NPM_CONFIG_USERCONFIG = "$XDG_CONFIG_HOME/npm/config";
            NPM_CONFIG_TMP = "$XDG_RUNTIME_DIR/npm";
            NPM_CONFIG_CACHE = "$XDG_CACHE_HOME/npm";
            NPM_CONFIG_PREFIX = "$XDG_CACHE_HOME/npm";
            NODE_REPL_HISTORY = "$XDG_CACHE_HOME/node/repl_history";

            IPYTHONDIR = "$XDG_CONFIG_HOME/ipython";
            PIP_CONFIG_FILE = "$XDG_CONFIG_HOME/pip/pip.conf";
            PYLINTRC = "$XDG_CONFIG_HOME/pylint/pylintrc";
            PYTHONSTARTUP = "$XDG_CONFIG_HOME/python/pythonrc";
            JUPYTER_CONFIG_DIR = "$XDG_CONFIG_HOME/jupyter";
            PIP_LOG_FILE = "$XDG_DATA_HOME/pip/log";
            PYLINTHOME = "$XDG_DATA_HOME/pylint";
            PYTHON_EGG_CACHE = "$XDG_CACHE_HOME/python-eggs";
            RUSTUP_HOME = "$XDG_DATA_HOME/rustup";
            CARGO_HOME = "$XDG_DATA_HOME/cargo";

            M2_HOME = "$XDG_CACHE_HOME/maven";
            NIX_PAGER = "less --RAW-CONTROL-CHARS --quit-if-one-screen";

            # https://github.blog/2022-04-12-git-security-vulnerability-announced/
            GIT_CEILING_DIRECTORIES = builtins.dirOf home;
          };
          systemPackages = with pkgs;
            (if stdenv.isDarwin then darwinPackages else nixosPackages) ++ [
              curl
              wget
              cachix
              htop
              fzf
              direnv
              nix-zsh-completions
              zsh
              # zoxide
              # rsync
            ];
        };

        my = {
          user = {
            shell = if pkgs.stdenv.isDarwin then [ pkgs.zsh ] else pkgs.zsh;
            packages = with pkgs; [
              tealdeer # rust implementation of `tldr`
              ncdu
              bat
              fd
              ripgrep
              pastel
              # vivid
              # hyperfine
              jq
              grc
              # pure-prompt
              exa
              shellcheck
              shfmt # Doesn't work with zsh, only sh & bash
              lnav # System Log file navigator
              # pandoc
              # scc
              # tokei
              # _1password # CLI
              # docker
              rename
              glow
              # buku
              # graph-easy
              # graphviz
              # nodePackages.mermaid-cli
              difftastic
              # vale
              entr
              ffmpeg
            ];
          };

          hm.file = with config.my;
            let

              glow_config = ''
                # ${nix_managed}
                # style name or JSON path (default "auto")
                style: "auto"
                # show local files only; no network (TUI-mode only)
                local: true
                # mouse support (TUI-mode only)
                mouse: false
                # use pager to display markdown
                pager: true
                # word-wrap at width
                width: 80'';
            in

            lib.mkMerge [
              {
                # ".terminfo" = {
                #   recursive = true;
                #   source = ../../../config/.terminfo;
                # };
              }
            ];

          env =
            # ====================================================
            # This list gets set in alphabetical order.
            # So care needs to be taken if two env vars depend on each other
            # ====================================================
            rec {
              BROWSER = if pkgs.stdenv.isDarwin then "open" else "xdg-open";
              GITHUB_USER = config.my.github_username;

              VIM_FZF_LOG = ''
                "$(${pkgs.git}/bin/git config --get alias.l 2>/dev/null | awk '{$1=""; print $0;}' | tr -d '\r')"'';

              FZF_DEFAULT_COMMAND = "${FZF_CTRL_T_COMMAND} --type f";
              # https://github.com/sharkdp/bat/issues/634#issuecomment-524525661
              FZF_PREVIEW_COMMAND =
                "COLORTERM=truecolor ${pkgs.bat}/bin/bat --style=changes --wrap never --color always {} || cat {} || (${pkgs.exa}/bin/exa --tree --group-directories-first {} || ${pkgs.tree}/bin/tree -C {})";
              FZF_CTRL_T_COMMAND =
                "${pkgs.fd}/bin/fd --hidden --follow --no-ignore-vcs";
              FZF_ALT_C_COMMAND = "${FZF_CTRL_T_COMMAND} --type d .";
              FZF_DEFAULT_OPTS =
                "--prompt='» ' --pointer='▶' --marker='✓ ' --reverse --tabstop 2 --multi --color=bg+:-1,marker:010 --bind '?:toggle-preview'";
              FZF_CTRL_T_OPTS =
                "--preview '(${FZF_PREVIEW_COMMAND}) 2> /dev/null' --preview-window down:60%:noborder";
              FZF_CTRL_R_OPTS =
                "--preview 'echo {}' --preview-window down:3:wrap:hidden --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort' --header 'Press CTRL-Y to copy command into clipboard'";
              FZF_ALT_C_OPTS =
                "--preview '(${pkgs.exa}/bin/exa --tree --group-directories-first {} || ${pkgs.tree}/bin/tree -C {}) 2> /dev/null'";
            };

        };

        # TODO: look at this later, because it's ugly
        # system.activationScripts.postUserActivation.text = ''
        #   echo ":: -> Running shell activationScript..."
        #   # Creating needed folders
        #   if [ ! -e "${local_zshrc}" ]; then
        #     echo '# vim:ft=zsh:' > ${local_zshrc}
        #     echo '[[ -z "$GITHUB_TOKEN" ]] && echo "⚠ GITHUB_TOKEN is not set"' >> ${local_zshrc}
        #     echo '[[ -z "$HOMEBREW_GITHUB_API_TOKEN" ]] && echo "⚠ HOMEBREW_GITHUB_API_TOKEN is not set"' >> ${local_zshrc}
        #     echo '[[ -z "$WEECHAT_PASSPHRASE" ]] && echo "⚠ WEECHAT_PASSPHRASE is not set"' >> ${local_zshrc}
        #     echo '[[ -z "$NPM_REGISTRY_TOKEN" ]] && echo "⚠ NPM_REGISTRY_TOKEN is not set"' >> ${local_zshrc}
        #     echo '[[ -z "$GITHUB_REGISTRY_TOKEN" ]] && echo "⚠ GITHUB_REGISTRY_TOKEN is not set"' >> ${local_zshrc}
        #     echo '[[ -z "$GH_PASS" ]] && echo "⚠ GH_PASS is not set"' >> ${local_zshrc}
        #     echo 'exit 1' >> ${local_zshrc}
        #   fi
        # '';

        programs.zsh = {
          enable = true;
          enableCompletion = true;
          # enableAutosuggestions = true;
          # enableSyntaxHighlighting = true;

          ########################################################################
          # Instead of sourcing, I can read the files & save startiup time instead
          ########################################################################

          # zshenv
          # shellInit = lib.concatStringsSep "\n"
          #   (map builtins.readFile [
          #     ../../../config/zsh.d/.zshenv
          #   ]);


          # zshrc
          # interactiveShellInit = lib.concatStringsSep "\n"
          #   (map builtins.readFile [
          #     ../../../config/zsh.d/zsh/config/options.zsh
          #     ../../../config/zsh.d/zsh/config/input.zsh
          #     ../../../config/zsh.d/zsh/config/completion.zsh
          #     ../../../config/zsh.d/zsh/config/utility.zsh
          #     ../../../config/zsh.d/zsh/config/aliases.zsh
          #     "${pkgs.grc}/etc/grc.zsh"
          #     "${pkgs.fzf}/share/fzf/completion.zsh"
          #     "${pkgs.fzf}/share/fzf/key-bindings.zsh"
          #     ../../../config/zsh.d/.zshrc
          #   ]);


          # promptInit = "autoload -U promptinit; promptinit; prompt pure";

        #   history = {
        #   size = 10000000;
        #   save = 10000000;
        #   extended = true;
        #   ignorePatterns = [
        #     "ls"
        #     "cd"
        #     "cd -"
        #     "pwd"
        #     "exit"
        #     "date"
        #     "* --help"
        #     "man *"
        #     "zstyle *"
        #   ];
        # };

        # shellAliases = {
        #   # Reload
        #   "reshell!" = "exec $SHELL -l";
        #   ".." = "cd ..";
        #   "..." = "cd ../..";

        #   gs = "git status";
        #   gc = "git commit";
        #   gp = "git push";
        #   gl = "git pull";

        #   status = "git status";
        #   commit = "git commit";
        #   push = "git push";
        #   pull = "git pull";

        #   mvnag = "mvn archetype:generate";

        #   k = "kubectl";
        #   kaf = "kubectl apply -f";
        #   kgns = "kubectl get namespaces";
        #   kgs = "kubectl get svc";
        #   kgsa = "kubectl get svc --all-namespaces";
        #   kgi = "kubectl get ingress";
        #   kgia = "kubectl get ingress --all-namespaces";
        #   kgcm = "kubectl get configmaps";
        #   kgcma = "kubectl get configmaps --all-namespaces";
        #   kgsec = "kubectl get secret";
        #   kgseca = "kubectl get secret --all-namespaces";
        #   kgd = "kubectl get deployment";
        #   kgda = "kubectl get deployment --all-namespaces";
        #   kgss = "kubectl get statefulset";
        #   kgssa = "kubectl get statefulset --all-namespaces";
        #   kgpvc = "kubectl get pvc";
        #   kgpvca = "kubectl get pvc --all-namespaces";
        #   kgds = "kubectl get daemonset";
        #   kgdsw = "kgds --watch";
        #   kgall = "kubectl get all --all-namespaces";
        #   kunusedrs = "kubectl get replicaset -o jsonpath=\"{ .items[?(@.spec.replicas==0)].metadata.name }\"";
        #   wemacs = "/Applications/Emacs.app/Contents/MacOS/Emacs $*";

        #   rgrep = "grep -Rn";
        #   hgrep = "fc -El 0 | grep";
        #   history = "fc -l 1";
        #   sha256sum = "shasum -a 256";

        #   emptytrash = "sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'";
        #   nix-cleanup = "nix-collect-garbage -d --delete-older-than 30d";
        #   nixupgrade = "nix-channel --update && nix-env -u && nix-collect-garbage -d";
        #   subl="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'";
        # };

        # envExtra = ''
        #   export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
        #   export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
        #   export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"
        #   export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
        #   export HOMEBREW_INSTALL_CLEANUP=1
        #   export HOMEBREW_NO_INSECURE_REDIRECT=1
        #   export HOMEBREW_NO_ANALYTICS=1
        #   #export HOMEBREW_CASK_OPTS=--require-sha
        #   export HOMEBREW_CASK_OPTS=""
        #   export HOMEBREW_INSTALL_BADGE="🍵"
        #   export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/library
        # '';

        # initExtra = ''
        #   extract () {
        #     if [ -f $1 ] ; then
        #       case $1 in
        #         *.tar.bz2)   tar xvjf $1    ;;
        #         *.tar.gz)    tar xvzf $1    ;;
        #         *.bz2)       bunzip2 $1     ;;
        #         *.rar)       unrar x $1       ;;
        #         *.gz)        gunzip $1      ;;
        #         *.tar)       tar xvf $1     ;;
        #         *.tbz2)      tar xvjf $1    ;;
        #         *.tgz)       tar xvzf $1    ;;
        #         *.zip)       unzip $1       ;;
        #         *.Z)         uncompress $1  ;;
        #         *.7z)        7z x $1        ;;
        #         *)           echo "don't know how to extract '$1'..." ;;
        #       esac
        #     else
        #       echo "'$1' is not a valid file!"
        #     fi
        #   }

        #   # PROXY="http://127.0.0.1:1080/pac"
        #   function proxy_on(){
        #     #PROXY="http://$(cat /etc/resolv.conf|grep nameserver|awk '{print $2}'):17890"
        #     PROXY="http://127.0.0.1:17890"
        #     export all_proxy=$PROXY
        #     export http_proxy=$PROXY
        #     export https_proxy=$PROXY
        #     echo $PROXY
        #   }
        #   function proxy_off(){
        #     unset all_proxy
        #     unset http_proxy
        #     unset https_proxy
        #     echo ‘取消http代理成功!’
        #   }

        # '';
        };
        # oh-my-zsh = {
        #   enable = true;

        #   plugins = [
        #     # "systemd"
        #     "sudo"
        #     "history-substring-search"
        #     "encode64"
        #     "rsync"
        #     "tmux"
        #   ];
        # };
      }
    ]);
}
