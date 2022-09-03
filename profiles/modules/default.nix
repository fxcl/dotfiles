{ pkgs, lib, config, options, ... }:

{
  homebrew.enable = true;
  homebrew.autoUpdate = true;
  homebrew.cleanup = "zap";
  homebrew.global.brewfile = true;
  homebrew.global.noLock = true;

  imports = [
    ./settings.nix
    ./macos.nix
    ./dock.nix
    ./finder.nix
    ./fonts.nix
    ./gui.nix
    ./git.nix
    ./gpg.nix
    ./java.nix
    ./node.nix
    ./rust.nix
    ./go.nix
    ./mysql.nix
  ];

  my.modules = {
    macos.enable = lib.mkDefault true;
    # dock.enable = lib.mkDefault false;
    finder.enable = lib.mkDefault false;
    fonts.enable = lib.mkDefault true;
    gui.enable = lib.mkDefault true;
    git.enable = lib.mkDefault true;
    gpg.enable = lib.mkDefault true;
    java.enable = lib.mkDefault true;
    node.enable = lib.mkDefault true;
    rust.enable = lib.mkDefault true;
    go.enable = lib.mkDefault true;
    mysql.enable = lib.mkDefault true;
  };
}
