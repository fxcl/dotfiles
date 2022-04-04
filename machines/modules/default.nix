{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./settings.nix
    ./homebrew.nix
    ./nix.nix
    ./shells.nix
    ./sudoers.nix
    ./tools.nix
    ./fonts.nix
    ./cc.nix
    ./python.nix
    ./kube.nix
  ];

  my.modules = {
    homebrew.enable = true;
    nix.enable = true;
    shells.enable = true;
    sudoers.enable = true;
    tools.enable = true;
    fonts.enable = true;
    cc.enable = true;
    python.enable = true;
    kube.enable = false;
  };
}
