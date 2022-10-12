{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.tools;

  # python = pkgs.python39.withPackages (p: with p; [
  #   ansible-core
  #   requests
  #   passlib
  #   # pkgs.ansible-later
  # ]);
in

{
  options = with lib; {
    my.modules.tools = {
      enable = mkEnableOption ''
        Whether to enable tools module
      '';
    };
  };

  config = with lib;
    mkIf cfg.enable {
      environment = {
        systemPackages = with pkgs; [
          git
          # jq
          nmap
          p7zip
          pwgen
          # shellcheck
          tmux
          #alejandra
          tree
          yq
          # ffmpeg
          # GNU > BSD :)
          # coreutils
          # ripgrep # grep
          # exa # ls
          # fd # find
          # tealdeer # TLDR
          du-dust # du
          # procs # ps
          dogdns # dig
          # shfmt
          nix-index # locate files of nix packages
          # nix-output-monitor
          global
          # Perl Language Server
          # perlPackages.PLS
          nixpkgs-fmt
          # Nix Language Server
          rnix-lsp
          # lsp-nil
        ] ++ (if stdenv.isDarwin then [ vim-darwin ] else [ vimHugeX ]);
      };
    };
}
