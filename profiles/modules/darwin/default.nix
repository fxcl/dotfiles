{ pkgs, lib, config, options, ... }:

{
  homebrew.enable = true;
  homebrew.autoUpdate = true;
  homebrew.cleanup = "zap";
  homebrew.global.brewfile = true;
  homebrew.global.noLock = true;

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
