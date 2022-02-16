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
    name = "better-comments";
    publisher = "aaron-bond";
    version = "2.1.0";
    sha256 = "0kmmk6bpsdrvbb7dqf0d3annpg41n9g6ljzc1dh0akjzpbchdcwp";
  }
  {
    name = "spellright";
    publisher = "ban";
    version = "3.0.60";
    sha256 = "1p4zd917n0za6sf8xl3bl76xnmyb0d09n8kzrip4zq4k8ca8lp30";
  }
  {
    name = "Nix";
    publisher = "bbenoist";
    version = "1.0.1";
    sha256 = "0zd0n9f5z1f0ckzfjr38xw2zzmcxg1gjrava7yahg5cvdcw6l35b";
  }
  {
    name = "search-crates-io";
    publisher = "belfz";
    version = "1.2.1";
    sha256 = "1nqlm76kgzmvpbh1dis010z1yga4yz9ia3hphqph9gpsf4wghq9b";
  }
  {
    name = "nixfmt-vscode";
    publisher = "brettm12345";
    version = "0.0.1";
    sha256 = "07w35c69vk1l6vipnq3qfack36qcszqxn8j3v332bl0w6m02aa7k";
  }
  {
    name = "better-toml";
    publisher = "bungcip";
    version = "0.3.2";
    sha256 = "08lhzhrn6p0xwi0hcyp6lj9bvpfj87vr99klzsiy8ji7621dzql3";
  }
  {
    name = "darwin";
    publisher = "chriskseidel";
    version = "1.5.1";
    sha256 = "025vh14pr7pj91q2hvs59kgv0596sfzzclym8qc1qssfjs2f7dcv";
  }
  # {
  #   name = "elm-ls-vscode";
  #   publisher = "elmTooling";
  #   version = "2.4.1";
  #   sha256 = "1idhsrl9w8sc0qk58dvmyyjbmfznk3f4gz2zl6s9ksyz9d06vfrd";
  # }
  {
    name = "prettier-vscode";
    publisher = "esbenp";
    version = "9.2.0";
    sha256 = "1ci17xm6mpxsbdazh0qgqk8c7h2v8ajy45d2mcslcc8gcgbkgqj4";
  }
  {
    name = "foam-vscode";
    publisher = "foam";
    version = "0.17.4";
    sha256 = "11jhx4hm10i3drap7n2v24j1y0r5ihzvb8dd5s802nfc49i1fg3k";
  }
  {
    name = "auto-close-tag";
    publisher = "formulahendry";
    version = "0.5.14";
    sha256 = "1k4ld30fyslj89bvjh2ihwgycb0i11mn266misccbjqkci5hg1jx";
  }
  {
    name = "shell-format";
    publisher = "foxundermoon";
    version = "7.2.2";
    sha256 = "00wc0y2wpdjs2pbxm6wj9ghhfsvxyzhw1vjvrnn1jfyl4wh3krvi";
  }
  {
    name = "go";
    publisher = "golang";
    version = "0.31.1";
    sha256 = "1x25x2dxcmi7h1q19qjxgnvdfzhsicq6sf6qig8jc0wg98g0gxry";
  }
  {
    name = "easy-icons";
    publisher = "jamesmaj";
    version = "0.3.1";
    sha256 = "09k3d0ww47yc1y3qvf813w1sqg03sq1y5kdnhlixigsvngslm9a4";
  }
  {
    name = "c-cpp-flylint";
    publisher = "jbenden";
    version = "1.11.0";
    sha256 = "0jyksvqz0c9819a8s2nnam0s59jd6dyb4y399d8ran5mdfy5hh56";
  }
  {
    name = "tera";
    publisher = "karunamurti";
    version = "0.0.9";
    sha256 = "1pykbdfvbhdj1kj7l3s8ri88v24m96x4c848qacz1zizg1jsbgbv";
  }
  {
    name = "vscode-markdown-notes";
    publisher = "kortina";
    version = "0.0.24";
    sha256 = "0x433slvgnqislcrhdq9zy6fmznk0mqkqq4yjs4mbzrq1l40z4dg";
  }
  {
    name = "rust-analyzer";
    publisher = "matklad";
    version = "0.3.939";
    sha256 = "0pxi055nb7j6vscv1lp0b58zq6pwm4n732p83y96w3v413b5hhfl";
  }
  {
    name = "fluent-icons";
    publisher = "miguelsolorio";
    version = "0.0.16";
    sha256 = "01ph7nf4z1j81ccgkwgbhy4r27qsvxrd36lyymixrdxg28asi3pj";
  }
  {
    name = "vscode-language-pack-zh-hans";
    publisher = "MS-CEINTL";
    version = "1.64.6";
    sha256 = "09xkz20yk8hkvf29hkdq8lr94cpwb5iwsnny2667kkc0qyvl5dmc";
  }
  {
    name = "debugger-for-chrome";
    publisher = "msjsdiag";
    version = "4.13.0";
    sha256 = "0r6l804dyinqfk012bmaynv73f07kgnvvxf74nc83pw61vvk5jk9";
  }
  {
    name = "vscode-paste-image";
    publisher = "mushan";
    version = "1.0.4";
    sha256 = "1wkplvrn31vly5gw35hlgpjpxgq3dzb16hz64xcf77bwcqfnpakb";
  }
  {
    name = "vetur";
    publisher = "octref";
    version = "0.35.0";
    sha256 = "1l1w83yix8ya7si2g3w64mczh0m992c0cp2q0262qp3y0gspnm2j";
  }
  {
    name = "theme-quietlight-vsc";
    publisher = "onecrayon";
    version = "1.1.0";
    sha256 = "0z8h8ym3px2381wkq0lpr9lwwgmqqfz7bgcddrcwxnlkxb65qi1n";
  }
  {
    name = "LiveServer";
    publisher = "ritwickdey";
    version = "5.7.4";
    sha256 = "18xggd12fq6yyfd5827c0a73j4mq8fd7npbv3ycdf9cr3gbgljby";
  }
  {
    name = "scala";
    publisher = "scala-lang";
    version = "0.5.5";
    sha256 = "1gqgamm97sq09za8iyb06jf7hpqa2mlkycbx6zpqwvlwd3a92qr1";
  }
  {
    name = "metals";
    publisher = "scalameta";
    version = "1.12.23";
    sha256 = "0r592gqsz9ijvgfifn5g5xc3x87gk6zkmcns12kplbvfvdjid9x0";
  }
  {
    name = "crates";
    publisher = "serayuzgur";
    version = "0.5.10";
    sha256 = "1dbhd6xbawbnf9p090lpmn8i5gg1f7y8xk2whc9zhg4432kdv3vd";
  }
  {
    name = "trailing-spaces";
    publisher = "shardulm94";
    version = "0.3.1";
    sha256 = "0h30zmg5rq7cv7kjdr5yzqkkc1bs20d72yz9rjqag32gwf46s8b8";
  }
  {
    name = "even-better-toml";
    publisher = "tamasfe";
    version = "0.14.2";
    sha256 = "17djwa2bnjfga21nvyz8wwmgnjllr4a7nvrsqvzm02hzlpwaskcl";
  }
  {
    name = "vscode-lldb";
    publisher = "vadimcn";
    version = "1.6.10";
    sha256 = "1q3d99l57spkln4cgwx28300d9711kc77mkyp4y968g3zyrmar88";
  }
  {
    name = "debug";
    publisher = "webfreak";
    version = "0.25.1";
    sha256 = "1l01sv6kwh8dlv3kygkkd0z9m37hahflzd5bx1wwij5p61jg7np9";
  }
  {
    name = "markdown-all-in-one";
    publisher = "yzhang";
    version = "3.4.0";
    sha256 = "0ihfrsg2sc8d441a2lkc453zbw1jcpadmmkbkaf42x9b9cipd5qb";
  }
  {
    name = "uncrustify";
    publisher = "zachflower";
    version = "3.2.0";
    sha256 = "0arzyrg0ch19bahy9nham9136qns0qxqczj736rsdz4yg299zgz1";
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
    "deno.enable" = true;
    "deno.lint" = true;
    "deno.unstable" = true;
    "deno.path" = "${pkgs.deno}/bin/deno";
    "deno.suggest.imports.hosts" = {
      "https://deno.land" = false;
    };
    "[typescript]" = {
      "editor.defaultFormatter" = "denoland.vscode-deno";
      "editor.formatOnSave" = true;
    };
    "nix.enableLanguageServer" = true;
    "nix.formatterPath" = "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt";
    "nix.serverPath" = "${pkgs.rnix-lsp}/bin/rnix-lsp";
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
