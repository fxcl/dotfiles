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
        env = {
          GOPATH = "/Users/kelvin/workspace/go";
          GOBIN = "/Users/kelvin/workspace/go/bin";
        };
        user.packages = with pkgs; [
          go_1_18 gopls gore
          gotools
          gopls
          go-outline
          delve
        ];
        #goPath = "Golang";
        #goBin = "Golang/bin";
        #goPath = "${builtins.getEnv "HOME"}/workspace/go";
        #goBin = "${builtins.getEnv "HOME"}/workspace/go/bin";

        # add delve to system packages
      };
    };
}
