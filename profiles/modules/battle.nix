{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.battle;

in

{
  options = with lib; {
    my.modules.battle = {
      enable = mkEnableOption ''
        Whether to enable battle module
      '';
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "battle-net"
        ];
      };
    };
}
