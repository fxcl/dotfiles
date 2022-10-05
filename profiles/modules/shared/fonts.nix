{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.fonts;

in

{
  options = with lib; {
    my.modules.fonts = {
      enable = mkEnableOption ''
        Whether to enable fonts module
      '';
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        brews = [
          # Only needed to install font-source-code-pro. Safe to delete after font installed.
          "svn"
        ];

        taps = [
          "homebrew/cask-fonts"
        ];

        casks = [
          "font-source-code-pro"
          # "font-fontawesome"
          # "font-fira-code"
          # "font-fira-code-nerd-font"
        ];
      };
    };
}
