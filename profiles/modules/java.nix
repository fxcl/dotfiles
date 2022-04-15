{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.java;

in

{
  options = with lib; {
    my.modules.java = {
      enable = mkEnableOption ''
        Whether to enable java module
      '';
    };
  };

  config = with lib;
    mkIf cfg.enable {
      my = {
        user.packages = with pkgs; [
          graalvm17-ce
          gradle
          maven
          java-language-server
          # replitPackages.jdt-language-server
          # replitPackages.java-debug
          #vagrant
        ];
      environment = {
        shellInit =  ''
          test -e ${pkgs.graalvm17-ce}/nix-support/setup-hook && source ${pkgs.graalvm17-ce}/nix-support/setup-hook
        '';
      };
    };
}
