{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.eul;

in

{
  options = with lib; {
    my = {
      modules = {
        eul = {
          enable = mkEnableOption ''
            Whether to enable eul module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "eul"
        ];
      };
    };
}
