{ pkgs, ... }:

{
  enable = true;
  package = pkgs.vscode;

  # Notes:
  # - Does not unistall extensions once removed.
  # - Update using the following: export temp=$(mktemp) && curl -s https://raw.githubusercontent.com/NixOS/nixpkgs/master/pkgs/misc/vscode-extensions/update_installed_exts.sh > $temp && chmod +x $temp && $temp $(whereis codium)
  # https://github.com/NixOS/nixpkgs/blob/master/pkgs/misc/vscode-extensions/default.nix
  extensions = with pkgs.vscode-extensions; [
    # Languages
    scalameta.metals # Scala Language Server
    scala-lang.scala # Scala Language
    bbenoist.nix # Nix
    jnoortheen.nix-ide
    a5huynh.vscode-ron
    antfu.icons-carbon
    #brettm12345.nixfmt-vscode
    dracula-theme.theme-dracula
    elmtooling.elm-ls-vscode
    file-icons.file-icons
    foxundermoon.shell-format
    github.vscode-pull-request-github
    haskell.haskell
    jock.svg
    justusadam.language-haskell
    #ms-azuretools.vscode-docker
    #ms-kubernetes-tools.vscode-kubernetes-tools
    #ms-python.vscode-pylance
    redhat.vscode-yaml
    timonwong.shellcheck
    tomoki1207.pdf
    xaver.clang-format
    #aaron-bond.better-comments
    foam.foam-vscode
    formulahendry.auto-close-tag
    msjsdiag.debugger-for-chrome
    octref.vetur
    shardulm94.trailing-spaces
    golang.go
    hashicorp.terraform
    editorconfig.editorconfig
    james-yu.latex-workshop
    ms-vscode-remote.remote-ssh
    #nash.awesome-flutter-snippets
    formulahendry.code-runner
    #github.vscode-codeql
    adpyke.codesnap
    #ms-vscode.cpptools
    #dzhavat.css-initial-value
    #dart-code.dart-code
    #dart-code.flutter
    #icrawl.discord-vscode
    mikestead.dotenv
    dbaeumer.vscode-eslint
    tamasfe.even-better-toml
    eamodio.gitlens
    #zignd.html-css-class-completion
    #mathiasfrohlich.kotlin
    vadimcn.vscode-lldb
    yzhang.markdown-all-in-one
    #shd101wyy.markdown-preview-enhanced
    zhuangtongfa.material-theme
    pkief.material-icon-theme
    arrterian.nix-env-selector
    #b4dm4n.nixpkgs-fmt
    ibm.output-colorizer
    #alefragnani.pascal
    #alefragnani.pascal-formatter
    #jeroen-meijer.pubspec-assist
    ms-python.python
    #msjsdiag.vscode-react-native
    humao.rest-client
    matklad.rust-analyzer
    xaver.clang-format
    #matklad.rust-analyzer-nightly
    #svelte.svelte-vscode
    bradlc.vscode-tailwindcss
    #pflannery.vscode-versionlens
  ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
      name = "ccls";
      publisher = "ccls-project";
      version = "0.1.29";
      sha256 = "RjMYBLgbi+lgPqaqN7yh8Q8zr9euvQ+YLEoQaV3RDOA=";
    }
    {
      name = "gruvbox-themes";
      publisher = "tomphilbin";
      version = "1.0.0";
      sha256 = "0xykf120j27s0bmbqj8grxc79dzkh4aclgrpp1jz5kkm39400z0f";
    }
    {
      name = "Rewrap";
      publisher = "stkb";
      version = "1.13.0";
      sha256 = "18h42vfxngix8x22nqslvnzwfvfq5kl35xs6fldi211dzwhw905j";
    }

    {
      name = "doxdocgen";
      publisher = "cschlosser";
      version = "1.3.2";
      sha256 = "08dp9bqxsxxqw8pm1sryl14xrvicagqwlxi5cc1vmksjh30dmn1a";
    }
    {
      name = "better-cpp-syntax";
      publisher = "jeff-hykin";
      version = "1.15.6";
      sha256 = "1s7wpglvwisyw6yq5ia720wmb7fhdk3gan9x5xsf2h2z35pz947k";
    }
    {
      name = "remote-containers";
      publisher = "ms-vscode-remote";
      version = "0.183.0";
      sha256 = "12v7037rn46svv6ff2g824hdkk7l95g4gbzrp5zdddwxs0a62jlg";
    }
    {
      name = "cmake-tools";
      publisher = "ms-vscode";
      version = "1.7.3";
      sha256 = "0jisjyk5n5y59f1lbpbg8kmjdpnp1q2bmhzbc1skq7fa8hj54hp9";
    }
    {
      name = "cmake";
      publisher = "twxs";
      version = "0.0.17";
      sha256 = "11hzjd0gxkq37689rrr2aszxng5l9fwpgs9nnglq3zhfa1msyn08";
    }
    # {
    #   publisher = "vscodevim";
    #   name = "vim";
    #   version = "1.18.5";
    #   sha256 = "0cbmmhkbr4f1afk443sgdihp2q5zkzchbr2yhp7bm5qnv7xdv5l4";
    # }
    {
      publisher = "2gua";
      name = "rainbow-brackets";
      version = "0.0.6";
      sha256 = "1m5c7jjxphawh7dmbzmrwf60dz4swn8c31svbzb5nhaazqbnyl2d";
    }
    {
      publisher = "swyphcosmo";
      name = "spellchecker";
      version = "1.2.13";
      sha256 = "1lr33lf01afgi74c1a9gylk92li4hyq24l8bki4l6ggl4z4c2h3w";
    }
    {
      publisher = "asabil";
      name = "meson";
      version = "1.1.1";
      sha256 = "00cc28a2nb325f54bx51wf5q15x1pmsn0j9z6rnxxqxwii1dm5cl";
    }
    {
      publisher = "bungcip";
      name = "better-toml";
      version = "0.3.2";
      sha256 = "08lhzhrn6p0xwi0hcyp6lj9bvpfj87vr99klzsiy8ji7621dzql3";
    }
    {
      publisher = "codezombiech";
      name = "gitignore";
      version = "0.6.0";
      sha256 = "0gnc0691pwkd9s8ldqabmpfvj0236rw7bxvkf0bvmww32kv1ia0b";
    }
    {
      publisher = "DavidAnson";
      name = "vscode-markdownlint";
      version = "0.26.0";
      sha256 = "0g4pssvajn7d8p2547v7313gjyqx4pzs7cbjws2s3v2fk1sw7vbj";
    }
    {
      publisher = "esbenp";
      name = "prettier-vscode";
      version = "1.8.1";
      sha256 = "0qcm2784n9qc4p77my1kwqrswpji7bp895ay17yzs5g84cj010ln";
    }
    {
      publisher = "hbenl";
      name = "vscode-test-explorer";
      version = "2.9.3";
      sha256 = "1yf85hgvganxq5n5jff9ckn3smxd6xi79cgn6k53qi5w1r5rahy0";
    }
    {
      publisher = "lextudio";
      name = "restructuredtext";
      version = "106.0.0";
      sha256 = "096r8071202nxi1is6z7dghcmpsh0f0mm3mp3cfh1yj2mnyzlaxa";
    }
    {
      publisher = "lostintangent";
      name = "vsls-pomodoro";
      version = "0.1.0";
      sha256 = "1b73zbkhlhacvi18cx4g3n6randy3hw9cab1gkw5gzb3375w7w3p";
    }
    {
      publisher = "lostintangent";
      name = "vsls-whiteboard";
      version = "0.0.8";
      sha256 = "13fcay9bs861msb5y694casbw66dmhl504xm5cvprssx1qka186p";
    }
    {
      publisher = "mechatroner";
      name = "rainbow-csv";
      version = "1.0.0";
      sha256 = "1fyamgm7zq31r3c00cn6pcb66rrkfhwfmp72qnhrajydmnvcnbg6";
    }
    {
      publisher = "ronnidc";
      name = "nunjucks";
      version = "0.2.3";
      sha256 = "119xgyn1dggw2rcqkn2mnz364iw5jlrxg7pcydbijsqj5d3zdfsf";
    }
    {
      publisher = "serayuzgur";
      name = "crates";
      version = "0.4.2";
      sha256 = "1knspsc98cfw4mhc0yaz0f2185sxdf9kn9qsysfs6c82g9wjaqcj";
    }
    # {
    #   name = "elm-ls-vscode";
    #   publisher = "elmTooling";
    #   version = "2.4.1";
    #   sha256 = "1idhsrl9w8sc0qk58dvmyyjbmfznk3f4gz2zl6s9ksyz9d06vfrd";
    # }

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
    "editor.fontFamily" = "Mensch, Menlo, Iosevka Nerd Font, Consolas, Monaco, 'Courier New', monospace";
    "editor.tabSize" = 2; # Because I prefer smaller tab sizes.
    "editor.formatOnPaste" = false; # Do not mess with my code by default. Will trust automatic rules language by language.
    "editor.formatOnSave" = false; # Do not mess with my code by default. Will trust automatic rules language by language.
    "editor.acceptSuggestionOnEnter" = "off";
    "editor.fontSize" = 16;
    "editor.letterSpacing" = 1.0;
    "editor.lineHeight" = 22;
    "editor.renderWhitespace" = "all";
    "editor.suggestSelection" = "first";
    "editor.tabCompletion" = "onlySnippets";
    "editor.quickSuggestions" = {
      "strings" = true;
    };
    "editor.guides.bracketPairs" = true;

    "breadcrumbs.enabled" = true;
    "debug.console.fontFamily" = "Iosevka Term";
    "debug.console.fontSize" = 16;
    "debug.allowBreakpointsEverywhere" = true;

    "terminal.integrated.fontFamily" = "Iosevka Term, Fira Code";
    "terminal.integrated.fontSize" = 16;
    #"terminal.external.linuxExec" = "konsole";
    #"terminal.external.linuxExec" = "${alacritty}/bin/alacritty";
    "terminal.integrated.cursorStyle" = "line";
    "terminal.integrated.cursorBlinking" = true;
    "terminal.integrated.letterSpacing" = 1.0;
    "terminal.integrated.lineHeight" = 1.2;
    "terminal.integrated.shell.linux" = "/bin/zsh";
    "terminal.integrated.profiles.windows" = {
      "PowerShell" = {
        "source" = "PowerShell";
        "icon" = "terminal-powershell";
        "args" = [ "-NoLogo" ];
      };
    };
    "terminal.integrated.experimentalUseTitleEvent" = true;
    "workbench.editorAssociations" = {
      "*.ipynb" = "jupyter.notebook.ipynb";
    };

    "files.exclude" = {
      "**/result" = true;
      "**/.git" = true;
      "**/.svn" = true;
      "**/.hg" = true;
      "**/CVS" = true;
      "**/.DS_Store" = true;
      "**/node_modules" = true;
      "**/shims-tsx.d.ts" = true;
      "**/shims-vue.d.ts" = true;
      "**/.browserslistrc" = true;
      "**/.eslintrc.js" = true;
      "**/.gitignore" = true;
      "**/babel.config.js" = true;
      "**/package-lock.json" = true;
      "**/README.md" = true;
      "**/tsconfig.json" = true;
      "**/.github" = true;
      "**/.classpath" = true;
      "**/.factorypath" = true;
      "**/.project" = true;
      "**/.settings" = true;
      "**/*.exe" = true;
      "**/*.o" = true;
    };

    "files.associations" = {
      "*.config" = "makefile";
    };

    "git.autofetch" = true;
    "window.title" = "\${activeEditorLong}\${separator}\${rootName}"; # Let me use the free space!
    "explorer.confirmDragAndDrop" = false; # Don't bother me when I want to drag-and-drop files.
    "files.trimFinalNewlines" = true; # Keep files trimmed.
    "files.insertFinalNewline" = true; # Because POSIX compliance (todo: read why is that really important, maybe to identify the last line?)
    #"files.autoSave" = "onFocusChange"; # Because I am lazy and I often source control the files.
    "files.autoSave" = "onWindowChange";
    "workbench.editor.highlightModifiedTabs" = true; # Better highlight on modified tabs.
    "workbench.editor.enablePreview" = false; # I often prefer small files therefore I thank the extra space.
    "workbench.statusBar.feedback.visible" = false;
    "workbench.activityBar.visible" = true;
    "workbench.colorTheme"= "Gruvbox Light (Medium)";
    "workbench.iconTheme" = "Gruvbox Light";
    "workbench.editor.wrapTabs" = true;
    "workbench.editor.tabSizing" = "fit";
    "workbench.editor.decorations.colors" = true;
    "workbench.editor.decorations.badges" = true;
    "workbench.editor.enablePreviewFromCodeNavigation" = true;
    "workbench.startupEditor" = "newUntitledFile";
    "workbench.settings.editor" = "json";
    "workbench.colorCustomizations" = {
      "editorBracketHighlight.foreground1" = "#FFD700";
      "editorBracketHighlight.foreground2" = "#DA70D6";
      "editorBracketHighlight.foreground3" = "#87CEFA";
      "editorBracketHighlight.foreground4" = "#FA8072";
      "editorBracketHighlight.foreground5" = "#7CFC00";
      "editorBracketHighlight.foreground6" = "#FF8C00";
    };
    "workbench.editor.untitled.experimentalLanguageDetection" = true;
    "workbench.sideBar.location" = "left";
    "window.menuBarVisibility" = "toggle";
    #"window.menuBarVisibility" = "default";
    "window.titleBarStyle" = "custom";
    "window.zoomLevel" = 0;

    "telemetry.enableCrashReporter" = false;
    "telemetry.enableTelemetry" = false;
    "extensions.ignoreRecommendations" = true;
    "npm.fetchOnlinePackageInfo" = false;

    "css.validate" = false;
    "tailwindCSS.includeLanguages" = {
      "astro" = "html";
    };

    "discord.workspaceExcludePatterns" = [ "nixpkgs" ];


    "bracket-pair-colorizer-2.colorMode" = "Consecutive";
    "bracket-pair-colorizer-2.forceIterationColorCycle" = true;
    "bracket-pair-colorizer-2.showBracketsInGutter" = true;

    "evenBetterToml.formatter.alignEntries" = true;
    "evenBetterToml.formatter.compactArrays" = false;
    "evenBetterToml.formatter.compactInlineTables" = false;
    "evenBetterToml.formatter.indentTables" = true;
    "evenBetterToml.formatter.reorderKeys" = false;

    "gitlens.defaultDateStyle" = "absolute";
    "gitlens.views.fileHistory.location" = "explorer";
    "gitlens.defaultDateFormat" = "H:mm:ss dd.MM.yy";
    "gitlens.hovers.currentLine.over" = "line";
    "gitlens.statusBar.alignment" = "left";

    "scm.diffDecorations" = "all";
    "vsintellicode.modify.editor.suggestSelection" = "automaticallyOverrodeDefaultValue";

    # Markdown
    "markdown.preview.scrollEditorWithPreview" = true; # Syncronize editor with preview.
    "markdown.preview.scrollPreviewWithEditor" = true; # Syncronize preview with editor.editor with preview.

    "rust-analyzer.cargo.allFeatures" = true;
    "rust-analyzer.checkOnSave.command" = "clippy";
    "rust-analyzer.debug.engine" = "vadimcn.vscode-lldb";
    "rust-analyzer.updates.channel" = "stable";
    "rust-analyzer.lens.methodReferences" = true;
    "rust-analyzer.lens.references" = true;
    "rust-analyzer.trace.extension" = true;
    "rust-analyzer.procMacro.enable" = true;
    "rust-analyzer.server.path" = "${pkgs.rust-analyzer}/bin/rust-analyzer";

    "go.useLanguageServer" = true;
    "javascript.validate.enable" = false;
    "python.languageServer" = "Microsoft";
    "python.showStartPage" = false;
    "python.insidersChannel" = "off";
    "pascal.format.indent" = 4;
    "pascal.formatter.engine" = "ptop";
    "snapcode.transparentBackground" = true;
    "dart.previewFlutterUiGuidesCustomTracking" = true;
    "dart.warnWhenEditingFilesOutsideWorkspace" = false;
    "dart.previewLsp" = true;
    "dart.flutterCreateAndroidLanguage" = "kotlin";
    "dart.flutterCreateIOSLanguage" = "swift";
    "dart.previewFlutterUiGuides" = true;

    # "oneDarkPro.editorTheme" = "oneDarkPro";
    # "oneDarkPro.vivid" = true;
    # "oneDarkPro.bold" = true;
    "deno.enable" = true;
    "deno.lint" = true;
    "deno.unstable" = true;
    "deno.path" = "${pkgs.deno}/bin/deno";
    "deno.suggest.imports.hosts" = {
      "https://deno.land" = false;
    };

    "yaml.schemaStore.enable" = true;
    "yaml.schemas" = {
      "https://json.schemastore.org/github-workflow.json" = ".github/workflows/*.yaml";
    };

    "nix.enableLanguageServer" = true;
    "nix.formatterPath" = "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt";
    "nix.serverPath" = "${pkgs.rnix-lsp}/bin/rnix-lsp";
    "[typescript]" = {
      "editor.defaultFormatter" = "denoland.vscode-deno";
      "editor.formatOnSave" = true;
    };
    "[c]" = {
      "editor.defaultFormatter" = "ms-vscode.cpptools";
    };
    "[cpp]" = {
      "editor.defaultFormatter" = "ccls-project.ccls";
    };

    "[javascript]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
    };

    "[json]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
    };

    "[jsonc]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
    };

    "[markdown]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
    };

    "[python]" = {
      "editor.renderFinalNewline" = true;
      "editor.rulers" = [ 88 ];
      "editor.trimAutoWhitespace" = true;
      "files.trimFinalNewlines" = true;
      "files.trimTrailingWhitespace" = true;
      "files.insertFinalNewline" = true;
    };

    "[rust]" = {
      "editor.defaultFormatter" = "matklad.rust-analyzer";
      "editor.renderFinalNewline" = true;
      "editor.rulers" = [ 99 ];
      "editor.trimAutoWhitespace" = true;
      "files.trimFinalNewlines" = true;
      "files.trimTrailingWhitespace" = true;
      "files.insertFinalNewline" = true;
    };

    "[nix]" = {
      "editor.defaultFormatter" = "jnoortheen.nix-ide";
    };

    "[shellscript]" = {
      "editor.tabSize" = 2;
      "files.eol" = "\n";
    };

    "code-runner.runInTerminal" = true;
    "code-runner.executorMap" = {
      # "javascript" = "${pkgs.nodejs-18_x}/bin/node";
      # "java" = "cd $dir && ${pkgs.graalvm17-ce}/bin/javac $fileName && mv $fileNameWithoutExt $fileNameWithoutExt.o && ${pkgs.graalvm17-ce}/bin/java $fileNameWithoutExt.o";
      # "c" = "cd $dir && /usr/bin/gcc $fileName -o $fileNameWithoutExt.o && $dir$fileNameWithoutExt.o";
      # "cpp" = "cd $dir && /usr/bin/g++ $fileName -o $fileNameWithoutExt.o && $dir$fileNameWithoutExt.o";
      # # "objective-c" = "cd $dir && gcc -framework Cocoa $fileName -o $fileNameWithoutExt.o && $dir$fileNameWithoutExt.o";
      # # "php" = "${php}/bin/php";
      # "python" = "${pkgs.python39}/bin/python -u";
      # # "perl" = "${perl}/bin/perl";
      # # "perl6" = "perl6";
      # #"ruby" = "${ruby}/bin/ruby";
      # "go" = "${pkgs.go_1_17}/bin/go run";
      #"lua" = "${lua}/bin/lua";
      # "groovy" = "${groovy}/bin/groovy";
      # "powershell" = "${powershell}/bin/powershell -ExecutionPolicy ByPass -File";
      # "bat" = "cmd /c";
      "shellscript" = "${pkgs.zsh}/bin/zsh";
      # "fsharp" = "${fsharp}/bin/fsi";
      # "csharp" = "scriptcs";
      # "vbscript" = "cscript //Nologo";
      # "typescript" = "${nodePackages.typescript}/bin/ts-node";
      # "coffeescript" = "coffee";
      # "scala" = "${scala}/bin/scala";
      # "swift" = "${swift}/bin/swift";
      # "julia" = "${julia}/bin/julia";
      # "crystal" = "${crystal}/bin/crystal";
      # "ocaml" = "${ocaml}/bin/ocaml";
      # "r" = "${rWrapper}/bin/Rscript";
      # "applescript" = "osascript";
      # "clojure" = "${clojure}/bin/lein exec";
      # "haxe" = "${haxe}/bin/haxe --cwd $dirWithoutTrailingSlash --run $fileNameWithoutExt";
      #"rust" = "cd $dir && ${pkgs.rust-bin}/bin/rustc $fileName && mv $fileNameWithoutExt $fileNameWithoutExt.o && $dir$fileNameWithoutExt.o";
      # "racket" = "${racket}/bin/racket";
      # "scheme" = "${scheme48}/bin/csi -script";
      # "ahk" = "autohotkey";
      # "autoit" = "autoit3";
      # "dart" = "${dart}/bin/dart";
      # "pascal" = "cd $dir && ${fpc}/bin/fpc $fileName && mv $fileNameWithoutExt $fileNameWithoutExt.o && $dir$fileNameWithoutExt.o";
      # "d" = "cd $dir && dmd $fileName && mv $fileNameWithoutExt $fileNameWithoutExt.o && $dir$fileNameWithoutExt.o";
      # "haskell" = "${haskell}/bin/runhaskell";
      # "nim" = "${nim}/bin/nim compile --verbosity:0 --hints:off --run";
      # "lisp" = "${lisp}/bin/sbcl --script";
      "kit" = "kitc --run";
      # "v" = "${vlang}/bin/v run";
      # "sass" = "${sass}/bin/sass --style expanded";
      # "scss" = "${sass}/bin/scss --style expanded";
      # "less" = "cd $dir && ${lessc}/bin/lessc $fileName $fileNameWithoutExt.css";
      # "FortranFreeForm" = "cd $dir && gfortran $fileName -o $fileNameWithoutExt.o && $dir$fileNameWithoutExt.o";
      # "fortran-modern" = "cd $dir && ${gfortran}/bin/gfortran $fileName -o $fileNameWithoutExt.o && $dir$fileNameWithoutExt.o";
      # "fortran_fixed-form" = "cd $dir && gfortran $fileName -o $fileNameWithoutExt.o && $dir$fileNameWithoutExt.o";
      # "fortran" = "cd $dir && ${gfortran}/bin/gfortran $fileName -o $fileNameWithoutExt.o && $dir$fileNameWithoutExt.o";
    };
  };

  keybindings = [
    { key = "cmd+g"; command = "workbench.scm.focus"; }
    { key = "cmd+b"; command = "workbench.files.action.focusFilesExplorer"; }
    { key = "cmd+escape"; command = "workbench.action.closeSidebar"; }
    { key = "f13"; command = "workbench.action.showCommands"; }
    { key = "f14"; command = "workbench.action.quickOpen"; }
    { key = "alt+left"; command = "workbench.action.navigateBack"; }
    { key = "alt+right"; command = "workbench.action.navigateForward"; }
    #{ key = "Enter"; command = "rust-analyzer.onEnter"; when = "editorTextFocus && !suggestWidgetVisible && editorLangId == rust"; }
  ];
}
