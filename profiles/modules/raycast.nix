{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.raycast;

in

{
  options = with lib; {
    my.modules.raycast = {
      enable = mkEnableOption ''
        Whether to enable raycast module
      '';
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "raycast"
        ];
      };
    };
}
