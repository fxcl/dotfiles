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
    bbenoist.nix # Nix
    # requires rnix-lsp
    jnoortheen.nix-ide
    a5huynh.vscode-ron
    antfu.icons-carbon
    #brettm12345.nixfmt-vscode
    dracula-theme.theme-dracula
    eamodio.gitlens
    elmtooling.elm-ls-vscode
    esbenp.prettier-vscode
    file-icons.file-icons
    foxundermoon.shell-format
    github.vscode-pull-request-github
    haskell.haskell
    jock.svg
    justusadam.language-haskell
    matklad.rust-analyzer
    #ms-azuretools.vscode-docker
    #ms-kubernetes-tools.vscode-kubernetes-tools
    #ms-python.vscode-pylance
    #ms-vscode.cpptools
    redhat.vscode-yaml
    serayuzgur.crates
    tamasfe.even-better-toml
    timonwong.shellcheck
    tomoki1207.pdf
    vadimcn.vscode-lldb
    xaver.clang-format
    xaver.clang-format
    yzhang.markdown-all-in-one
    # aaron-bond.better-comments
    foam.foam-vscode
    formulahendry.auto-close-tag
    msjsdiag.debugger-for-chrome
    octref.vetur
    shardulm94.trailing-spaces
    golang.go
    hashicorp.terraform
  ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
      name = "nix-env-selector";
      publisher = "arrterian";
      version = "1.0.7";
      sha256 = "0mralimyzhyp4x9q98x3ck64ifbjqdp8cxcami7clvdvkmf8hxhf";
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
    "editor.tabSize" = 2; # Because I prefer smaller tab sizes.
    "editor.formatOnPaste" = false; # Do not mess with my code by default. Will trust automatic rules language by language.
    "editor.formatOnSave" = false; # Do not mess with my code by default. Will trust automatic rules language by language.
    "editor.acceptSuggestionOnEnter" = "off";
    "editor.fontSize" = 16;
    "editor.letterSpacing" = 1.0;
    "editor.lineHeight" = 22;
    "editor.renderWhitespace" = "all";
    "editor.suggestSelection" = "first";

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
    "workbench.activityBar.visible" = true;
    "workbench.colorTheme" = "Ayu Dark Bordered";
    "workbench.iconTheme" = "ayu";
    "workbench.settings.editor" = "json";

    "window.menuBarVisibility" = "default";
    "window.titleBarStyle" = "custom";

    "terminal.external.linuxExec" = "konsole";
    "terminal.integrated.cursorStyle" = "line";
    "terminal.integrated.cursorBlinking" = true;
    "terminal.integrated.fontFamily" = "Fira Code";
    "terminal.integrated.fontSize" = 16;
    "terminal.integrated.letterSpacing" = 1.0;
    "terminal.integrated.lineHeight" = 1.2;
    "terminal.integrated.shell.linux" = "/bin/zsh";

    "telemetry.enableCrashReporter" = false;
    "telemetry.enableTelemetry" = false;
    "extensions.ignoreRecommendations" = true;
    "npm.fetchOnlinePackageInfo" = false;

    "debug.allowBreakpointsEverywhere" = true;

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
    "scm.diffDecorations" = "all";

    "vsintellicode.modify.editor.suggestSelection" = "automaticallyOverrodeDefaultValue";


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

    "python.languageServer" = "Microsoft";
    "python.showStartPage" = false;

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

    "[shellscript]" = {
      "editor.tabSize" = 2;
      "files.eol" = "\n";
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
