{ pkgs, ... }:

{
  enable = true;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;
  withNodeJs = true;
  withPython3 = true;
  withRuby = true;

  plugins = with pkgs.vimPlugins; [
    dracula-vim
    nerdtree
  ];

  coc = {
    enable = true;
  };

  extraPackages = with pkgs; [
    # gopls
    # shfmt
  ];

  extraConfig = builtins.readFile ../../.vimrc;
}
