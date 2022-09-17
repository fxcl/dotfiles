{ pkgs, lib, config, options, ... }:

{
  homebrew.enable = true;
  #homebrew.autoUpdate = true;
  #homebrew.cleanup = "zap"; # "none" "uninstall" "zap"
  homebrew.onActivation.cleanup = "zap"; # Uninstall all programs not declared
  homebrew.onActivation.autoUpdate = false;  # Don't update during rebuild
  homebrew.onActivation.upgrade = true;
  homebrew.global.brewfile = true; # Run brew bundle from anywhere
  homebrew.global.lockfiles = false; # Don't save lockfile (since running from anywhere)

  imports = [
    ./macos.nix
    ./dock.nix
    ./finder.nix
  ];

  my.modules = {
    macos.enable = lib.mkDefault true;
    # dock.enable = lib.mkDefault false;
    finder.enable = lib.mkDefault false;
  };
}
