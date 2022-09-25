{ config, pkgs, lib, home-manager, options, ... }:

with lib;

let
  mkOptStr = value:
    mkOption {
      type = with types; uniq str;
      default = value;
    };

  mkSecret = description: default:
    mkOption {
      inherit description default;
      type = with types; either str (listOf str);
    };

  mkOpt = type: default:
    mkOption { inherit type default; };

  mkOpt' = type: default: description:
    mkOption { inherit type default description; };

in
{
  options = with types; {
    my = {
      fullname = mkOptStr "Kelvin Zhao";
      timezone = mkOptStr "Asia/Shanghai ";
      username = mkOptStr "kelvin";
      website = mkOptStr "https://gabri.me";
      github_username = mkOptStr "fxcl";
      email = mkOptStr "me@zxf.me";
      terminal = mkOptStr "kitty";
      nix_managed = mkOptStr
        "vim: set nomodifiable : Nix managed - DO NOT EDIT - see source inside ~/.dotfiles or use `:set modifiable` to force.";
      user = mkOption { type = options.users.users.type.functor.wrapped; };
      hm = {
        file = mkOpt' attrs { } "Files to place directly in $HOME";
        configFile = mkOpt' attrs { } "Files to place in $XDG_CONFIG_HOME";
        dataFile = mkOpt' attrs { } "Files to place in $XDG_DATA_HOME";
      };

      env = mkOption {
        type = attrsOf (either (either str path) (listOf (either str path)));
        apply = mapAttrs (n: v:
          if isList v then
            concatMapStringsSep ":" (x: toString x) v
          else
            (toString v));
        default = { };
        description = "Environment variables to be set";
      };

      init = mkOption {
        type = types.lines;
        description = ''
          An init script that runs after the environment has been rebuilt or
          booted. Anything done here should be idempotent and inexpensive.
        '';
      };

      modules = { };
    };
  };

  config = {
    # let nix manage home-manager profiles and use global nixpkgs
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "backup";

    };
    my.user = {
      home =
        if pkgs.stdenv.isDarwin then
          "/Users/${config.my.username}"
        else
          "/home/${config.my.username}";
      description = "Primary user account";
    };

    # PATH should always start with its old value
    # must already begin with pre-existing PATH. Also, can't use binDir here,
    # because it contains a nix store path.
    # my.env.PATH  = [ <bin> "$PATH" ];
    my.env.PATH = [ "$NODE_HOME/bin" "/Users/kelvin/.local/share/cargo/bin" "/Users/kelvin/.cache/npm/bin" ./bin "$XDG_BIN_HOME" "$PATH" ];

    users.users."${config.my.username}" = mkAliasDefinitions options.my.user;
    # I only need a subset of home-manager's capabilities. That is, access to
    # its home.file, home.xdg.configFile and home.xdg.dataFile so I can deploy
    # files easily to my $HOME, but 'home-manager.users.${config.my.username}.home.file.*'
    # is much too long and harder to maintain, so I've made aliases in:
    #   my.hm -> home-manager.users.<primary user>
    #   my.hm.file        ->  home-manager.users.zxfstd.home.file
    #   my.hm.configFile  ->  home-manager.users.zxfstd.home.xdg.configFile
    #   my.hm.dataFile    ->  home-manager.users.zxfstd.home.xdg.dataFile
    home-manager.users."${config.my.username}" = {
      xdg = {
        enable = true;
        configFile = mkAliasDefinitions options.my.hm.configFile;
        dataFile = mkAliasDefinitions options.my.hm.dataFile;
      };

      home = {
        # Necessary for home-manager to work with flakes, otherwise it will
        # look for a nixpkgs channel.
        stateVersion =
          if pkgs.stdenv.isDarwin then "22.05" else config.system.stateVersion;
        inherit (config.my) username;
        file = mkAliasDefinitions options.my.hm.file;
      };

      programs = {
        # Let Home Manager install and manage itself.
        home-manager.enable = true;
      };
    };

    environment.extraInit =
      let exportLines = mapAttrsToList (n: v: "export ${n}=\"${v}\"") config.my.env;
      in
      ''
        # export XAUTHORITY=/tmp/Xauthority
        # [ -e ~/.Xauthority ] && mv -f ~/.Xauthority "$XAUTHORITY"
        ${concatStringsSep "\n" exportLines}
      '';

  };
}
