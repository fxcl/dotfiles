{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.node;

in

{
  options = with lib; {
    my.modules.node = {
      enable = mkEnableOption ''
        Whether to enable nodejs module
      '';
    };
  };

  config = with lib;
    mkIf cfg.enable {
      my = {
        env = {
          #PATH = [ "$(yarn global bin)" ];
        };
        user = {
          packages = with pkgs; [
            nodejs
            yarn
            nodePackages.npm-check-updates
          ];
        };
        hm = {
          file."npmrc".text = "
          registry=https://registry.npmmirror.com
          ELECTRON_MIRROR=https://npm.taobao.org/mirrors/electron/
          ELECTRON_CUSTOM_DIR=16.0.5
          disturl=https://npmmirror.com/dist/
          ";
        };
      };

    };
}
