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

            M2_HOME = "$XDG_CACHE_HOME/maven";
            NIX_PAGER = "less --RAW-CONTROL-CHARS --quit-if-one-screen";

            HOMEBREW_BREW_GIT_REMOTE = "https://mirrors.ustc.edu.cn/brew.git";
            HOMEBREW_CORE_GIT_REMOTE = "https://mirrors.ustc.edu.cn/homebrew-core.git";
            HOMEBREW_BOTTLE_DOMAIN = "https://mirrors.ustc.edu.cn/homebrew-bottles";
            HOMEBREW_INSTALL_CLEANUP = "1";
            HOMEBREW_NO_INSECURE_REDIRECT = "1";
            HOMEBREW_NO_ANALYTICS = "1";
            # # HOMEBREW_CASK_OPTS=--require-sha
            # HOMEBREW_CASK_OPTS = "";
            # HOMEBREW_INSTALL_BADGE = "🍵";
            # RUST_SRC_PATH = "$(rustc - -print sysroot) /lib/rustlib/src/rust/library";

            # https://github.blog/2022-04-12-git-security-vulnerability-announced/
            GIT_CEILING_DIRECTORIES = builtins.dirOf home;
          };
          systemPackages = with pkgs;
            (if stdenv.isDarwin then darwinPackages else nixosPackages) ++ [
              curl
              wget
              cachix
              # htop
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
              # fd
              # ripgrep
              # pastel
              # vivid
              # hyperfine
              jq
              # grc
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
              # rename
              # glow
              # buku
              # graph-easy
              # graphviz
              # nodePackages.mermaid-cli
              # difftastic
              # vale
              entr
              ffmpeg
            ];
          };

          hm.file = with config.my;
            let

              # glow_config = ''
              #   # ${nix_managed}
              #   # style name or JSON path (default "auto")
              #   style: "auto"
              #   # show local files only; no network (TUI-mode only)
              #   local: true
              #   # mouse support (TUI-mode only)
              #   mouse: false
              #   # use pager to display markdown
              #   pager: true
              #   # word-wrap at width
              #   width: 80'';
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
        };
      }
    ]);
}
