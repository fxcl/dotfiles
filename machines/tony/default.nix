{ config, lib, pkgs, ... }:

{
  imports = [
    ../modules
  ];

  networking = {
    hostName = "0x746f6e79";
    computerName = "0x746f6e79";
  };

  system = {
    stateVersion = 4;
  };
}
