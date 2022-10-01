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
          GOROOT = "${pkgs.go_1_17}/share/go";
          GOPROXY = https://goproxy.cn,direct";
          GO111MODULE = "on";
          #GOSUMDB = "goproxy.cn/sumdb/sum.golang.org";
          #GOSUMDB = "off";
        };
        user.packages = with pkgs; [
          go_1_17
          #gotests
          #gomodifytags
          #go-migrate
          gotools
          gopls
          #go-outline
          #gopkgs
          gocode-gomod
          godef
          golint
          delve
        ];
      };
    };
}
