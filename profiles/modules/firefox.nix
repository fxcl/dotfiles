# { pkgs, lib, config, options, ... }:

# let
#   cfg = config.my.modules.firefox;
# in

# {
#   options = with lib; {
#     my.modules.firefox = {
#       enable = mkEnableOption ''
#         Whether to enable firefox module
#       '';
#     };
#   };

#   config = with lib;
#     mkIf cfg.enable {
#       programs.firefox = {
#         enable = true;
#         package = if pkgs.stdenv.isDarwin then
#           pkgs.runCommand "firefox-0.0.0" { } "mkdir $out"
#         else
#           pkgs.firefox-bin;
#         # extensions = with pkgs.nur.repos.rycee.firefox-addons; [
#         #   ublock-origin
#         #   onepassword-password-manager
#         # ];
#         # profiles =
#         #   let defaultSettings = {
#         #     "app.update.auto" = false;
#         #     "browser.startup.homepage" = "about:blank";
#         #     # *snip* no need to splurge all my settings, you get the idea...
#         #     # "identity.fxaccounts.account.device.name" = config.networking.hostName;
#         #     "signon.rememberSignons" = false;
#         #   };
#         #   in
#         #   {
#         #     default = {
#         #       isDefault = true;
#         #       settings = {
#         #         "signon.rememberSignons" = false;
#         #       };
#         #     };
#         #   };
#       };
#     };
# }
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
      # my = {
      #   user.packages = with pkgs; [
      #     firefox-mac
      #   ];
      # };
      environment = {
        systemPackages = [
          pkgs.firefox-mac
        ];
      };
    };
}
