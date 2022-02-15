{ pkgs, ... }:

{
  enable = true;
  serverAliveInterval = 20;

  matchBlocks = {
    "bous" = {
      hostname = "bous.kleister.tech";
      port = 22022;
      user = "root";
      forwardAgent = true;
    };
  };
}
