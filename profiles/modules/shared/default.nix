{ pkgs, lib, config, options, ... }:

{

  imports = [
    ./settings.nix
    ./nix.nix
    ./shells.nix
    ./sudoers.nix
    ./fonts.nix
    ./gui.nix
    ./git.nix
    ./gpg.nix
    ./java.nix
    ./node.nix
    ./rust.nix
    ./go.nix
    ./mysql.nix
    ./cc.nix
    ./kube.nix
    ./python.nix
    ./tools.nix
  ];

  my.modules = {
    nix.enable = lib.mkDefault true;
    shells.enable = lib.mkDefault true;
    sudoers.enable = lib.mkDefault true;
    fonts.enable = lib.mkDefault true;
    tools.enable = lib.mkDefault true;
    gui.enable = lib.mkDefault true;
    git.enable = lib.mkDefault true;
    gpg.enable = lib.mkDefault true;
    java.enable = lib.mkDefault true;
    node.enable = lib.mkDefault true;
    rust.enable = lib.mkDefault true;
    go.enable = lib.mkDefault true;
    mysql.enable = lib.mkDefault true;
    cc.enable = lib.mkDefault true;
    kube.enable = lib.mkDefault true;
    python.enable = lib.mkDefault false;
  };
}
