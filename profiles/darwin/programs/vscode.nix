{pkgs, ...}: {
  enable = true;
  package = pkgs.vscode;

  # Notes:
  # - Does not unistall extensions once removed.
  # - Update using the following: export temp=$(mktemp) && curl -s https://raw.githubusercontent.com/NixOS/nixpkgs/master/pkgs/misc/vscode-extensions/update_installed_exts.sh > $temp && chmod +x $temp && $temp $(whereis codium)
  # https://github.com/NixOS/nixpkgs/blob/master/pkgs/misc/vscode-extensions/default.nix
  extensions = with pkgs.vscode-extensions;
    [
      # Languages
      #scalameta.metals # Scala Language Server
      #scala-lang.scala # Scala Language
      bbenoist.nix
      # jnoortheen.nix-ide
      arrterian.nix-env-selector
      kamadorueda.alejandra
      mkhl.shfm

      dracula-theme.theme-dracula
      #file-icons.file-icons
      foxundermoon.shell-format
      redhat.vscode-yaml
      #timonwong.shellcheck
      #tomoki1207.pdf
      xaver.clang-format
      #haskell.haskell
      #justusadam.language-haskell
      #ms-azuretools.vscode-docker
      #ms-kubernetes-tools.vscode-kubernetes-tools
      #ms-python.vscode-pylance
      #aaron-bond.better-comments
      #foam.foam-vscode
      #formulahendry.auto-close-tag
      msjsdiag.debugger-for-chrome
      octref.vetur
      shardulm94.trailing-spaces
      golang.go
      #hashicorp.terraform
      editorconfig.editorconfig
      #james-yu.latex-workshop
      #nash.awesome-flutter-snippets
      #github.vscode-codeql
      #ms-vscode.cpptools
      #dzhavat.css-initial-value
      #dart-code.dart-code
      #dart-code.flutter
      #icrawl.discord-vscode
      mikestead.dotenv
      dbaeumer.vscode-eslint
      tamasfe.even-better-toml
      #zignd.html-css-class-completion
      #mathiasfrohlich.kotlin
      vadimcn.vscode-lldb
      yzhang.markdown-all-in-one
      #b4dm4n.nixpkgs-fmt
      ibm.output-colorizer
      #alefragnani.pascal
      #alefragnani.pascal-formatter
      #jeroen-meijer.pubspec-assist
      ms-python.python
      #msjsdiag.vscode-react-native
      humao.rest-client
      matklad.rust-analyzer
      #matklad.rust-analyzer-nightly
      #svelte.svelte-vscode
      bradlc.vscode-tailwindcss
      #pflannery.vscode-versionlens
    ]
    ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
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
        name = "rewrap";
        publisher = "stkb";
        version = "17.8.0";
        sha256 = "1y168ar01zxdd2x73ddsckbzqq0iinax2zv3d95nhwp9asjnbpgn";
      }
      {
        name = "doxdocgen";
        publisher = "cschlosser";
        version = "1.4.0";
        sha256 = "1d95znf2vsdzv9jqiigh9zm62dp4m9jz3qcfaxn0n0pvalbiyw92";
      }
      {
        name = "better-cpp-syntax";
        publisher = "jeff-hykin";
        version = "1.15.19";
        sha256 = "13v1lqqfvgkf5nm89b39hci65fnz4j89ngkg9p103l1p1fhncr41";
      }
      {
        name = "remote-containers";
        publisher = "ms-vscode-remote";
        version = "0.248.0";
        sha256 = "147hcm98bbd5ww1xps9myay6324n4c5mj6f4zpkkb4c93k2ffxj3";
      }
      {
        name = "cmake-tools";
        publisher = "ms-vscode";
        version = "1.12.24";
        sha256 = "1dlg9yyvcf70k6ykvz0s7zlhm7qjvj6mv34bnl3gdwc1282rs42c";
      }
      # {
      #   name = "cmake";
      #   publisher = "twxs";
      #   version = "0.0.17";
      #   sha256 = "11hzjd0gxkq37689rrr2aszxng5l9fwpgs9nnglq3zhfa1msyn08";
      # }
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
        publisher = "bungcip";
        name = "better-toml";
        version = "0.3.2";
        sha256 = "08lhzhrn6p0xwi0hcyp6lj9bvpfj87vr99klzsiy8ji7621dzql3";
      }
      {
        name = "gitignore";
        publisher = "codezombiech";
        version = "0.9.0";
        sha256 = "0ww0x28m83fv5zdqkmz108rsxb60fyy5y0ksknb2xchirzwhayi0";
      }
      {
        name = "prettier-vscode";
        publisher = "esbenp";
        version = "9.8.0";
        sha256 = "1rkjzmcvmjzd7l6bi05ymr1sibps3c6lzxhbmjp0zpzv02wl9jgv";
      }
      {
        name = "vscode-test-explorer";
        publisher = "hbenl";
        version = "2.21.1";
        sha256 = "022lnkq278ic0h9ggpqcwb3x3ivpcqjimhgirixznq0zvwyrwz3w";
      }
      {
        name = "restructuredtext";
        publisher = "lextudio";
        version = "190.1.4";
        sha256 = "1y25b2i16xjb1cbmkxd822jh10jdclk3h16hf62s65l00z69gfxv";
      }
      {
        publisher = "lostintangent";
        name = "vsls-pomodoro";
        version = "0.1.0";
        sha256 = "1b73zbkhlhacvi18cx4g3n6randy3hw9cab1gkw5gzb3375w7w3p";
      }
      {
        name = "vsls-whiteboard";
        publisher = "lostintangent";
        version = "0.0.12";
        sha256 = "13xyi2bd4c4jfmad9bzjgvj60mrahdmfs1h2xsgiv286vpq6pk4a";
      }
      {
        name = "rainbow-csv";
        publisher = "mechatroner";
        version = "2.4.0";
        sha256 = "0idl63rfn068zamyx5mw3524k3pb98gv32dfbrszxyrrx4kbh1fd";
      }
      {
        name = "nunjucks";
        publisher = "ronnidc";
        version = "0.3.1";
        sha256 = "0dlsri0dcligjz3x1ddpjhyvna6dmdswhb86c9k73y22r12fd1zd";
      }
      {
        name = "crates";
        publisher = "serayuzgur";
        version = "0.5.10";
        sha256 = "1dbhd6xbawbnf9p090lpmn8i5gg1f7y8xk2whc9zhg4432kdv3vd";
      }
      {
        name = "elm-ls-vscode";
        publisher = "elmTooling";
        version = "2.4.1";
        sha256 = "1idhsrl9w8sc0qk58dvmyyjbmfznk3f4gz2zl6s9ksyz9d06vfrd";
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
    "http.proxy" = "127.0.0.1:7890";
    "http.proxySupport" = "on";
    "editor.minimap.enabled" = false;
    "editor.fontLigatures" = true;
    "editor.fontFamily" = "Mensch, Menlo, Consolas, Monaco, 'Courier New', monospace";
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
    "editor.accessibilitySupport" = "on";
    "editor.quickSuggestions" = {
      "strings" = true;
    };

    "diffEditor.maxComputationTime" = 0;
    "diffEditor.wordWrap" = "off";
    "editor.bracketPairColorization.enabled" = true;
    "editor.guides.bracketPairs" = "active";
    "editor.maxTokenizationLineLength" = 10000;
    "editor.unicodeHighlight.ambiguousCharacters" = false;
    "editor.wordWrap" = "on";
    "eslint.format.enable" = true;
    "eslint.lintTask.enable" = true;
    "explorer.confirmDelete" = false;
    "git.confirmSync" = false;
    "git.enableSmartCommit" = true;
    "go.toolsManagement.autoUpdate" = true;
    "javascript.updateImportsOnFileMove.enabled" = "always";
    "redhat.telemetry.enabled" = false;
    "security.workspace.trust.untrustedFiles" = "open";
    "terminal.integrated.defaultProfile.linux" = "zsh";
    "terminal.integrated.defaultProfile.osx" = "zsh";
    "terminal.integrated.fontSize" = 12;
    "typescript.updateImportsOnFileMove.enabled" = "always";

    "editor.rulers" = [80 120];
    "telemetry.enableTelemetry" = false;
    "telemetry.enableCrashReporter" = false;
    "editor.useTabStops" = false;
    "workbench.fontAliasing" = "antialiased";
    "files.trimTrailingWhitespace" = true;
    "terminal.integrated.fontFamily" = "PragmataPro Liga";

    "debug.console.fontFamily" = "PragmataPro Liga";
    "debug.console.fontSize" = 16;
    "debug.allowBreakpointsEverywhere" = true;
    "debug.javascript.autoAttachFilter" = "smart";
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
        "args" = ["-NoLogo"];
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
    "explorer.confirmDragAndDrop" = false; # Don't bother me when I want to drag-and-drop files.
    "files.trimFinalNewlines" = true; # Keep files trimmed.
    "files.insertFinalNewline" = true; # Because POSIX compliance (todo: read why is that really important, maybe to identify the last line?)
    #"files.autoSave" = "onFocusChange"; # Because I am lazy and I often source control the files.
    "files.autoSave" = "onWindowChange";
    "workbench.editor.highlightModifiedTabs" = true; # Better highlight on modified tabs.
    "workbench.editor.enablePreview" = false; # I often prefer small files therefore I thank the extra space.
    "workbench.statusBar.feedback.visible" = false;
    "workbench.activityBar.visible" = true;
    "workbench.colorTheme" = "Gruvbox Light (Medium)";
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
    "window.zoomLevel" = 0.5;

    "extensions.ignoreRecommendations" = true;
    "npm.fetchOnlinePackageInfo" = false;

    "css.validate" = false;
    "tailwindCSS.includeLanguages" = {
      "astro" = "html";
    };

    "discord.workspaceExcludePatterns" = ["nixpkgs"];

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
    #"rust-analyzer.server.path" = "${pkgs.rust-analyzer}/bin/rust-analyzer";
    "rust-analyzer.server.path" = "rust-analyzer";
    "go.useLanguageServer" = true;
    "javascript.validate.enable" = false;
    "python.languageServer" = "Default";
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

    "deno.enable" = true;
    "deno.lint" = true;
    "deno.unstable" = true;
    "deno.path" = "${pkgs.deno}/bin/deno";
    "deno.suggest.imports.hosts" = {
      "https://deno.land" = false;
    };
    "alejandra.program" = "alejandra";
    "purescript.formatter" = "purs-tidy";

    "settingsSync.keybindingsPerPlatform" = false;

    "telemetry.telemetryLevel" = "off";

    "terminal.integrated.drawBoldTextInBrightColors" = false;

    "yaml.schemaStore.enable" = true;
    "yaml.schemas" = {
      "https://json.schemastore.org/github-workflow.json" = ".github/workflows/*.yaml";
    };

    "nix.enableLanguageServer" = true;
    "nix.serverPath" = "${pkgs.rnix-lsp}/bin/rnix-lsp";

    "[css]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
    };
    "[html]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
    };

    "[typescriptreact]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
    };

    "[typescript]" = {
      "editor.defaultFormatter" = "denoland.vscode-deno";
      "editor.formatOnSave" = true;
    };

    "[javascript]" = {
      "editor.defaultFormatter" = "dbaeumer.vscode-eslint";
    };

    "[json]" = {
      "editor.defaultFormatter" = "vscode.json-language-features";
    };
    "[jsonc]" = {
      "editor.defaultFormatter" = "vscode.json-language-features";
    };

    "[properties]" = {
      "editor.defaultFormatter" = "foxundermoon.shell-format";
    };

    "[go]" = {
      "editor.defaultFormatter" = "golang.go";
    };

    "[c]" = {
      "editor.defaultFormatter" = "ms-vscode.cpptools";
    };
    "[cpp]" = {
      "editor.defaultFormatter" = "ccls-project.ccls";
    };

    "[markdown]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
    };

    "[python]" = {
      "editor.renderFinalNewline" = true;
      "editor.rulers" = [88];
      "editor.trimAutoWhitespace" = true;
      "files.trimFinalNewlines" = true;
      "files.trimTrailingWhitespace" = true;
      "files.insertFinalNewline" = true;
    };

    "[rust]" = {
      "editor.defaultFormatter" = "matklad.rust-analyzer";
      "editor.renderFinalNewline" = true;
      "editor.rulers" = [99];
      "editor.trimAutoWhitespace" = true;
      "files.trimFinalNewlines" = true;
      "files.trimTrailingWhitespace" = true;
      "files.insertFinalNewline" = true;
    };

    "[nix]" = {
      #"editor.defaultFormatter" = "jnoortheen.nix-ide";
      "editor.defaultFormatter" = "kamadorueda.alejandra";
    };

    "[shellscript]" = {
      "editor.defaultFormatter" = "mkhl.shfmt";
      "editor.tabSize" = 2;
      "files.eol" = "\n";
    };
    "[yaml]" = {
      "editor.wordBasedSuggestionsMode" = "currentDocument";
    };

    "[elixir]" = {
      "editor.defaultFormatter" = "JakeBecker.elixir-ls";
    };

    "[haskell]" = {
      "editor.defaultFormatter" = "haskell.haskell";
    };
    "[ignore]" = {
      "editor.defaultFormatter" = "foxundermoon.shell-format";
    };
  };

  keybindings = [
    {
      key = "cmd+g";
      command = "workbench.scm.focus";
    }
    {
      key = "cmd+b";
      command = "workbench.files.action.focusFilesExplorer";
    }
    {
      key = "cmd+escape";
      command = "workbench.action.closeSidebar";
    }
    {
      key = "f13";
      command = "workbench.action.showCommands";
    }
    {
      key = "f14";
      command = "workbench.action.quickOpen";
    }
    {
      key = "alt+left";
      command = "workbench.action.navigateBack";
    }
    {
      key = "alt+right";
      command = "workbench.action.navigateForward";
    }
    {
      key = "shift+cmd+d";
      command = "editor.action.copyLinesDownAction";
      when = "editorTextFocus && !editorReadonly";
    }
    #{ key = "Enter"; command = "rust-analyzer.onEnter"; when = "editorTextFocus && !suggestWidgetVisible && editorLangId == rust"; }
  ];
}
