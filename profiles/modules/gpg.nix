{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.gpg;

in

{
  options = with lib; {
    my.modules.gpg = {
      enable = mkEnableOption ''
        Whether to enable gpg module
      '';
    };
  };

  config = with lib;
    mkIf cfg.enable {
      environment = {
        systemPackages = with pkgs; [
          # GPG pinentry
          pinentry_mac
        ];
      };

      home-manager.users."${config.my.username}" = { config, ... }: {
        programs = {
          gpg.enable = true;
        };
      };
      # pinentry-program ${pkgs.pinentry_mac}/Applications/pinentry-mac.app/Contents/MacOS/pinentry-mac
      my.hm.file = {
        ".gnupg/gpg-agent.conf" = {
          text = "pinentry-program ${pkgs.pinentry_mac}/${pkgs.pinentry_mac.passthru.binaryPath}";
        };
      };

      programs = {
        gnupg = {
          agent = {
            enable = true;
            enableSSHSupport = true;
          };

        };
      };
    };
}
