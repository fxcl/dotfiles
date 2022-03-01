{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.go;

in

{
  options = with lib; {
    my.modules.go = {
      enable = mkEnableOption ''
        Whether to enable go module
      '';
    };
  };

  config = with lib;
    mkIf cfg.enable {
      my = {
        user.packages = with pkgs; [
          go_1_17 gopls gore
        ];
        #goPath = "Golang";
        #goBin = "Golang/bin";
        #goPath = "${builtins.getEnv "HOME"}/workspace/go";
        #goBin = "${builtins.getEnv "HOME"}/workspace/go/bin";

        # add delve to system packages
      };

    };
}
