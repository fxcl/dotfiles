{ pkgs, ... }:

{
  enable = true;

  matchBlocks = {
    "bous" = {
      hostname = "bous.kleister.tech";
      port = 22022;
      user = "root";
      forwardAgent = true;
    };
  };
}
