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
      };

      environment = {
        systemPackages = [
          pkgs.idea-community-app
        ];
        shellInit = ''
          test -e ${pkgs.graalvm17-ce}/nix-support/setup-hook && source ${pkgs.graalvm17-ce}/nix-support/setup-hook
        '';
        variables = {
          LANG = "en_US.UTF-8";
          LC_TIME = "en_GB.UTF-8";
          JAVA_HOME = ''${pkgs.graalvm17-ce.home}'';
          JAVA_CPPFLAGS = ''-I${pkgs.graalvm17-ce}/include/'';
        };
      };
    };
}
