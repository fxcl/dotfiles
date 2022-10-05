{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.python;

in

{
  options = with lib; {
    my.modules.python = {
      enable = mkEnableOption ''
        Whether to enable python module
      '';
    };
  };

  config = with lib;
    mkIf cfg.enable {
      my = {
        env = { };
        user.packages = with pkgs; [
          python39
          python39Packages.pip
          python39Packages.ipython
          python39Packages.black # Code formatter
          python39Packages.setuptools
          python39Packages.pylint # Linter
          python39Packages.poetry # Better package manager
          python39Packages.python-lsp-server
          python39Packages.virtualenv
          python39Packages.flake8
          python39Packages.black
        ];
      };
    };
}
