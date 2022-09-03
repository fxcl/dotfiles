{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.mysql;
in

{
  options = with lib; {
    my.modules.mysql = {
      enable = mkEnableOption ''
        Whether to enable mysql module
      '';
    };
  };
  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        extraConfig = ''
          brew "mysql", restart_service: true, link: true, conflicts_with: ['mysql']
          brew "redis", restart_service: true
          brew "lrzsz"
          '';
      };
    };
}
