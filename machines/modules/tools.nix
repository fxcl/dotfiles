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
          hub
          jq
          # htop # top
          # gnumake
          # ipcalc
          # minio-client
          # ngrok
          # python
          # s3cmd
          # sops
          # terraform
          # rsync
          # upx
          # httpie # curl
          # curlie # curl
          # vale # Prose linter
          # gping # ping with a graph
          reflex
          nmap
          p7zip
          pwgen
          shellcheck
          tmux
          tree
          vim
          wget
          yq
          coreutils
          ripgrep # grep
          exa # ls
          fd # find
          bat # bat
          tealdeer # TLDR
          du-dust # du

          procs # ps
          dogdns # dig
          shfmt
          toilet
          zola # static site generator # lieber in flake ?
          himalaya # cli email client
          nix-index # locate files of nix packages
        ];
      };
    };
}
