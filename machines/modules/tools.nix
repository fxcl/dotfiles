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
          nmap
          p7zip
          pwgen
          shellcheck
          tmux
          tree
          vim
          wget
          yq
          # GNU > BSD :)
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
          nix-index # locate files of nix packages
        ];
      };
    };
}
