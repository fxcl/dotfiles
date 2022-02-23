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
        env = {
          IPYTHONDIR = "$XDG_CONFIG_HOME/ipython";
          PIP_CONFIG_FILE = "$XDG_CONFIG_HOME/pip/pip.conf";
          PYLINTRC = "$XDG_CONFIG_HOME/pylint/pylintrc";
          PYTHONSTARTUP = "$XDG_CONFIG_HOME/python/pythonrc";
          JUPYTER_CONFIG_DIR = "$XDG_CONFIG_HOME/jupyter";
          PIP_LOG_FILE = "$XDG_DATA_HOME/pip/log";
          PYLINTHOME = "$XDG_DATA_HOME/pylint";
          PYTHON_EGG_CACHE = "$XDG_CACHE_HOME/python-eggs";
         
        };
        user = {
          packages = with pkgs; [
            python39
            python39Packages.pip
            python39Packages.ipython
            python39Packages.black # Code formatter
            python39Packages.setuptools
            python39Packages.pylint # Linter
            python39Packages.poetry # Better package manager
          ];
        };

      };

    };
}
