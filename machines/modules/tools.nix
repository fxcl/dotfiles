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
          #gnumake
          #ipcalc
          #minio-client
          #ngrok
          #python
          #s3cmd
          reflex
          nmap
          p7zip
          pwgen
          #rsync

          shellcheck
          #sops
          terraform
          tmux
          tree
          upx
          vim
          wget
          yq
          coreutils

          vale # Prose linter
          ripgrep # grep
          exa # ls
          fd # find
          bat # bat
          httpie # curl
          curlie # curl
          tealdeer # TLDR
          du-dust # du
          htop # top
          procs # ps
          dogdns # dig
          gping # ping with a graph
          shfmt
          toilet
          zola # static site generator # lieber in flake ?
          himalaya # cli email client
          nix-index # locate files of nix packages
        ];
      };
    };
}
