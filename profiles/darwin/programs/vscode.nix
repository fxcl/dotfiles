{ pkgs, ... }:

{
  enable = true;
  package = pkgs.vscode;

  # Notes:
  # - Does not unistall extensions once removed.
  # - Update using the following: export temp=$(mktemp) && curl -s https://raw.githubusercontent.com/NixOS/nixpkgs/master/pkgs/misc/vscode-extensions/update_installed_exts.sh > $temp && chmod +x $temp && $temp $(whereis codium)
  extensions = with pkgs.vscode-extensions; [
    scalameta.metals # Scala Language Server
    scala-lang.scala # Scala Language
    #bbenoist.Nix        # Nix
  ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
      name = "nixfmt-vscode";
      publisher = "brettm12345";
      version = "0.0.1";
      sha256 = "07w35c69vk1l6vipnq3qfack36qcszqxn8j3v332bl0w6m02aa7k";
    }
    {
      name = "elm-ls-vscode";
      publisher = "Elmtooling";
      version = "1.2.0";
      sha256 = "0sp2nb2awb332hbmccljhwspv78lq2zfh63dkva29sh6ylzw9la5";
    }
    {
      name = "darwin";
      publisher = "chriskseidel";
      version = "1.5.1";
      sha256 = "025vh14pr7pj91q2hvs59kgv0596sfzzclym8qc1qssfjs2f7dcv";
    }
    {
      name = "trailing-spaces";
      publisher = "shardulm94";
      version = "0.3.1";
      sha256 = "0h30zmg5rq7cv7kjdr5yzqkkc1bs20d72yz9rjqag32gwf46s8b8";
    }
    {
      name = "Nix";
      publisher = "bbenoist";
      version = "1.0.1";
      sha256 = "0zd0n9f5z1f0ckzfjr38xw2zzmcxg1gjrava7yahg5cvdcw6l35b";
    }
    {
      name = "better-comments";
      publisher = "aaron-bond";
      version = "2.1.0";
      sha256 = "0kmmk6bpsdrvbb7dqf0d3annpg41n9g6ljzc1dh0akjzpbchdcwp";
    }
    {
      name = "better-toml";
      publisher = "bungcip";
      version = "0.3.2";
      sha256 = "08lhzhrn6p0xwi0hcyp6lj9bvpfj87vr99klzsiy8ji7621dzql3";
    }
    {
      name = "search-crates-io";
      publisher = "belfz";
      version = "1.2.1";
      sha256 = "1nqlm76kgzmvpbh1dis010z1yga4yz9ia3hphqph9gpsf4wghq9b";
    }
    {
      name = "crates";
      publisher = "serayuzgur";
      version = "0.5.10";
      sha256 = "sha256-bY/dphiEPPgTg1zMjvxx4b0Ska2XggRucnZxtbppcLU=";
    }
    {
      publisher = "karunamurti";
      name = "tera";
      version = "0.0.9";
      sha256 = "sha256-e72lZXg//vCZwoggRrpJlYiNUMxID3rkDLLBtV1b098=";
    }
    # rust
    {
      name = "debug";
      publisher = "webfreak";
      version = "0.25.0";
      sha256 = "0qm2jgkj17a0ca5z21xbqzfjpi0hzxw4h8y2hm8c4kk2bnw02sh1";
    }
    {
      publisher = "matklad";
      name = "rust-analyzer";
      version = "0.2.853";
      sha256 = "sha256-HYq8PuzchMwx0wd3SInitGzhNQe2biw2Njl+xdNuWjk=";
    }
    {
      name = "prettier-vscode";
      publisher = "esbenp";
      version = "4.7.0";
      sha256 = "1rqp4vhx89kxcjjmmd1sqk72mmf7smp8008bxc4hvc66gv557gqi";
    }
    {
      name = "debugger-for-chrome";
      publisher = "msjsdiag";
      version = "4.12.6";
      sha256 = "1dlplz72830shqbi7zkgg7pb45ijwajwhkmapx4lmlw13z41jw1g";
    }
    # {
    #   name = "vscode-direnv";
    #   publisher = "cab404";
    #   version = "1.0.0";
    #   sha256 = "0xikkhbzb5cd0a96smj5mr1sz5zxrmryhw56m0139sbg7zwwfwps";
    # }
    # {
    #   name = "nix-ide";
    #   publisher = "jnoortheen";
    #   version = "0.1.16";
    #   sha256 = "04ky1mzyjjr1mrwv3sxz4mgjcq5ylh6n01lvhb19h3fmwafkdxbp";
    # }
    # {
    #   name = "nix-extension-pack";
    #   publisher = "pinage404";
    #   version = "1.0.0";
    #   sha256 = "10hi9ydx50zd9jhscfjiwlz3k0v4dfi0j8p58x8421rk5dspi98x";
    # }
    {
      name = "markdown-all-in-one";
      publisher = "yzhang";
      version = "3.4.0";
      sha256 = "0ihfrsg2sc8d441a2lkc453zbw1jcpadmmkbkaf42x9b9cipd5qb";
    }
    {
      name = "vscode-markdown-notes";
      publisher = "kortina";
      version = "0.0.24";
      sha256 = "0x433slvgnqislcrhdq9zy6fmznk0mqkqq4yjs4mbzrq1l40z4dg";
    }
    {
      name = "vscode-paste-image";
      publisher = "mushan";
      version = "1.0.4";
      sha256 = "1wkplvrn31vly5gw35hlgpjpxgq3dzb16hz64xcf77bwcqfnpakb";
    }
    {
      name = "foam-vscode";
      publisher = "foam";
      version = "0.15.4";
      sha256 = "1qs6dhm8xydxvifnmv8wcx96mrx23mnbyvfbd41l8cn9mqslhwm0";
    }
    {
      name = "spellright";
      publisher = "ban";
      version = "3.0.60";
      sha256 = "1p4zd917n0za6sf8xl3bl76xnmyb0d09n8kzrip4zq4k8ca8lp30";
    }
  ];

  userSettings = {
    "update.mode" = "none";
    "editor.minimap.enabled" = false;
    "editor.fontLigatures" = true;
    "editor.tabSize" = 2; # Because I prefer smaller tab sizes.
    "editor.formatOnPaste" = false; # Do not mess with my code by default. Will trust automatic rules language by language.
    "editor.formatOnSave" = false; # Do not mess with my code by default. Will trust automatic rules language by language.
    "workbench.editorAssociations" = {
      "*.ipynb" = "jupyter.notebook.ipynb";
    };

    "window.title" = "\${activeEditorLong}\${separator}\${rootName}"; # Let me use the free space!
    "explorer.confirmDragAndDrop" = false; # Don't bother me when I want to drag-and-drop files.
    "files.trimFinalNewlines" = true; # Keep files trimmed.
    "files.insertFinalNewline" = true; # Because POSIX compliance (todo: read why is that really important, maybe to identify the last line?)
    "files.autoSave" = "onFocusChange"; # Because I am lazy and I often source control the files.
    "workbench.editor.highlightModifiedTabs" = true; # Better highlight on modified tabs.
    "workbench.editor.enablePreview" = false; # I often prefer small files therefore I thank the extra space.
    "window.zoomLevel" = 0;
    "workbench.statusBar.feedback.visible" = false;
    "rust-analyzer.checkOnSave.command" = "clippy";
    "rust-analyzer.lens.methodReferences" = true;
    "rust-analyzer.lens.references" = true;
    "rust-analyzer.trace.extension" = true;
    "rust-analyzer.cargo.allFeatures" = true;
    "rust-analyzer.procMacro.enable" = true;
    "rust-analyzer.server.path" = "${pkgs.rust-analyzer}/bin/rust-analyzer";
    # Markdown
    "markdown.preview.scrollEditorWithPreview" = true; # Syncronize editor with preview.
    "markdown.preview.scrollPreviewWithEditor" = true; # Syncronize preview with editor.editor with preview.

    # bracket
    # "editor.guides.bracketPairs" = true;
    # "editor.guides.bracketPairsHorizontal" = "active";
    # "editor.guides.highlightActiveIndentation" = true;
    # "editor.bracketPairColorization.enabled" = true;

    "workbench.colorCustomizations" = {
      "editorBracketHighlight.foreground1" = "#FFD700";
      "editorBracketHighlight.foreground2" = "#DA70D6";
      "editorBracketHighlight.foreground3" = "#87CEFA";
      "editorBracketHighlight.foreground4" = "#FA8072";
      "editorBracketHighlight.foreground5" = "#7CFC00";
      "editorBracketHighlight.foreground6" = "#FF8C00";
    };

    "[nix]" = {
      "editor.defaultFormatter" = "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt";
    };

  };

  keybindings = [
    { key = "cmd+g"; command = "workbench.scm.focus"; }
    { key = "cmd+b"; command = "workbench.files.action.focusFilesExplorer"; }
    { key = "cmd+escape"; command = "workbench.action.closeSidebar"; }
    {
      key = "Enter";
      command = "rust-analyzer.onEnter";
      when = "editorTextFocus && !suggestWidgetVisible && editorLangId == rust";
    }
  ];
}
