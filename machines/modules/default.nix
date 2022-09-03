{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./settings.nix
    ./nix.nix
    ./shells.nix
    ./sudoers.nix
    ./tools.nix
    ./cc.nix
    ./python.nix
    ./kube.nix
  ];

  my.modules = {
    nix.enable = true;
    shells.enable = true;
    sudoers.enable = true;
    tools.enable = true;
    cc.enable = true;
    python.enable = true;
    kube.enable = false;
  };
}
