{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.rust;

in

{
  options = with lib; {
    my.modules.rust = {
      enable = mkEnableOption ''
        Whether to enable rust module
      '';
    };
  };

  config = with lib;
    mkIf cfg.enable {
      my = {
        env = {
          RUSTUP_DIST_SERVER = "https://rsproxy.cn";
          RUSTUP_UPDATE_ROOT = "https://rsproxy.cn/rustup";
          RUSTUP_HOME = "$XDG_DATA_HOME/rustup";
          CARGO_HOME = "$XDG_DATA_HOME/cargo";
        };
        user = {
          packages = with pkgs; [
            (rust-bin.stable.latest.default.override { extensions = ["rust-src"]; })
            carnix
            rust-analyzer
            rls
            #rust-analyzer-unwrapped
            # rustup rustc cargo
          ];
        };
      };

    };
}
