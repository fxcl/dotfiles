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
          GOROOT = "${pkgs.go_1_18}/share/go";
        };
        user.packages = with pkgs; [
          go_1_18
          gopls
          gore
          #gocode
          #gotests
          #gomodifytags
          #go-migrate
          gotools
          go-outline
          delve
        ];
      };
    };
}
