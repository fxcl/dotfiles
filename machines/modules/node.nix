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
          NPM_CONFIG_USERCONFIG = "$XDG_CONFIG_HOME/npm/config";
          NPM_CONFIG_TMP = "$XDG_RUNTIME_DIR/npm";
          NPM_CONFIG_CACHE = "$XDG_CACHE_HOME/npm";
          NPM_CONFIG_PREFIX = "$XDG_CACHE_HOME/npm";
          NODE_REPL_HISTORY = "$XDG_CACHE_HOME/node/repl_history";
          PATH = [ "$(yarn global bin)" ];
        };
        user = {
          packages = with pkgs; [
            nodejs
            yarn
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
