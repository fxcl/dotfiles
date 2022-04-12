{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.mysql;
in

{
  options = with lib; {
    my.modules.mysql = {
      enable = mkEnableOption ''
        Whether to enable mysql module
      '';
    };
  };
  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        extraConfig = ''
          brew "mysql@8.0", restart_service: true, link: true, conflicts_with: ['mysql']
          brew "redis", restart_service: true
          '';
      };
    };
      # services = {
      #   mysql = {
      #     enable = true;
      #     package = pkgs.mysql80;
      #     dataDir = "/var/db/mysql/";
      #     settings = {
      #       client = { default-character-set = "utf8mb4"; };
      #       mysql = { default-character-set = "utf8mb4"; };
      #       mysqld = {
      #         character-set-client-handshake = "FALSE";
      #         character-set-server = "utf8mb4";
      #         collation-server = "utf8mb4_unicode_ci";
      #         init_connect = "'SET NAMES utf8mb4'";
      #       };
      #     };
      #     ensureDatabases = [ "platform" "mydb" "onedev" ];
      #     ensureUsers = [
      #       {
      #         name = "platform";
      #         ensurePermissions = { "platform.*" = "ALL PRIVILEGES"; };
      #       }
      #       {
      #         name = "onedev";
      #         ensurePermissions = { "onedev.*" = "ALL PRIVILEGES"; };
      #       }
      #       {
      #         name = "backup";
      #         ensurePermissions = { "*.*" = "SELECT, LOCK TABLES"; };
      #       }
      #     ];
      #     # ensureUsers = [ { ensurePermissions = { "*.*" = "ALL PRIVILEGES"; }; name = "root"; } ];
      #     extraOptions = ''
      #       max_allowed_packet=16M
      #       character_set_server=utf8mb3
      #       collation_server=utf8mb3_general_ci
      #       default_storage_engine=innodb
      #     '';
      #   };
      #   mysqlBackup = {
      #     enable = true;
      #     #user = "root";
      #     databases = [ "platform" "mydb" "onedev" ]; # put databases to back up here
      #   };
      # };
}
