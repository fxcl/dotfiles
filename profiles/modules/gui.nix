{ pkgs, lib, config, options, ... }:

let

  cfg = config.my.modules.gui;

in
{
  options = with lib; {
    my.modules.gui = {
      enable = mkEnableOption ''
        Whether to enable gui module
      '';
    };
  };

  config = with lib;
    mkIf cfg.enable (mkMerge [
      (if (builtins.hasAttr "homebrew" options) then {
        # TODO: (automate) Requires homebrew to be installed
        homebrew.taps = [ "homebrew/cask" "homebrew/cask-fonts" "homebrew/cask-versions" ];
        homebrew.casks = [
          "bitwarden"
          #"hammerspoon"
          "appcleaner"
          #"adobe-acrobat-reader"
          #"authy"
          #"bartender"
          #"battle-net"
          "google-chrome"
          #"deezer"
          #"discord"
          #"lima"
          #"element"
          "balenaetcher"
          "eul"
          "iterm2"
          "notunes"
          "keepingyouawake"
          #"jabra-direct"
          #"lastpass"
          #"lens"
          #"macdown"
          #"mattermost"
          #"multipass"
          #"owncloud"
          "raycast"
          "rectangle"
          #"signal"
          #"slack"
          #"steam"
          #"microsoft-teams"
          #"zoom"
          #"franz"
          #"firefox"

          #"anki"
          #"corelocationcli"
          #"db-browser-for-sqlite"
          #"figma"
          #"brave-browser"
          #"imageoptim"
          #"kap"
          #"launchcontrol"
          #"obsidian"
          #"sync"
          # "visual-studio-code"
          # "logseq"
          # "vscodium"
        ];

        # my.hm.file = {
        #   ".hammerspoon" = {
        #     recursive = true;
        #     source = ../../../config/.hammerspoon;
        #   };
        # };

        my.hm.file = {
          ".config/mpv" = {
            recursive = true;
            source = ../../config/mpv;
          };
        };

      } else {
        my.user = {
          packages = with pkgs; [
            ngrok
            mpv
            anki
            brave
            firefox
            obsidian
            logseq
            zoom-us
            signal-desktop
            vscodium
            slack
            #docker
            # sqlitebrowser
            # virtualbox
          ];
        };
      })
    ]);
}
