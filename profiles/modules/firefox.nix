{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.firefox;

in
{
  options = with lib; {
    my.modules.firefox = {
      enable = mkEnableOption ''
        Whether to enable firefox module
      '';
    };
  };

  config = with lib;
    mkIf cfg.enable {
      my = {
        user.packages = with pkgs; [
          firefox-mac
        ];
        # Wire up Tridactyl native for macOS.
        hm.file."Library/Application Support/Mozilla/NativeMessagingHosts" = {
        source =
          "${pkgs.tridactyl-native}/lib/mozilla/native-messaging-hosts";
          recursive = true;
        };
      };
      environment = {
        systemPackages = [
          pkgs.firefox-mac
        ];
      };
    };
}
