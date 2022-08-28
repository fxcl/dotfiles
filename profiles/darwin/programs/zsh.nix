{ pkgs, ... }:

{
  enable = true;
  enableCompletion = true;
  enableAutosuggestions = true;
  enableSyntaxHighlighting = true;

  history = {
    size = 10000000;
    save = 10000000;
    extended = true;
    ignorePatterns = [
      "ls"
      "cd"
      "cd -"
      "pwd"
      "exit"
      "date"
      "* --help"
      "man *"
      "zstyle *"
    ];
  };

  shellAliases = {
    # Reload
    "reshell!" = "exec $SHELL -l";
    cat = "bat";
    ".." = "cd ..";
    "..." = "cd ../..";

    git = "hub";
    gs = "git status";
    gc = "git commit";
    gp = "git push";
    gl = "git pull";

    status = "git status";
    commit = "git commit";
    push = "git push";
    pull = "git pull";

    mvnag = "mvn archetype:generate";

    k = "kubectl";
    kaf = "kubectl apply -f";
    kgns = "kubectl get namespaces";
    kgs = "kubectl get svc";
    kgsa = "kubectl get svc --all-namespaces";
    kgi = "kubectl get ingress";
    kgia = "kubectl get ingress --all-namespaces";
    kgcm = "kubectl get configmaps";
    kgcma = "kubectl get configmaps --all-namespaces";
    kgsec = "kubectl get secret";
    kgseca = "kubectl get secret --all-namespaces";
    kgd = "kubectl get deployment";
    kgda = "kubectl get deployment --all-namespaces";
    kgss = "kubectl get statefulset";
    kgssa = "kubectl get statefulset --all-namespaces";
    kgpvc = "kubectl get pvc";
    kgpvca = "kubectl get pvc --all-namespaces";
    kgds = "kubectl get daemonset";
    kgdsw = "kgds --watch";
    kgall = "kubectl get all --all-namespaces";
    kunusedrs = "kubectl get replicaset -o jsonpath=\"{ .items[?(@.spec.replicas==0)].metadata.name }\"";

    rgrep = "grep -Rn";
    hgrep = "fc -El 0 | grep";
    history = "fc -l 1";
    sha256sum = "shasum -a 256";

    emptytrash = "sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'";

    nix-cleanup = "nix-collect-garbage -d --delete-older-than 30d";
    nixupgrade = "nix-channel --update && nix-env -u && nix-collect-garbage -d";

  };

  sessionVariables = {
    LESS = "--RAW-CONTROL-CHARS --quit-if-one-screen";
    GITHUB_TOKEN = "";
    CLOUDFLARE_EMAIL = "me@gnux.cn";
    CLOUDFLARE_API_KEY = "";

    EDITOR = "vim";
    PAGER = "less";
    CLICOLOR = "1";
    GREP_COLOR = "1;33";
    IGNOREEOF = "1";

    # These are the defaults, and xdg.enable does set them, but due to load
    # order, they're not set before environment.variables are set, which could
    # cause race conditions.
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_BIN_HOME = "$HOME/.local/bin";
    #XDG_RUNTIME_DIR="/tmp/$(id -u)-runtime-dir";
    #XDG_RUNTIME_DIR="$HOME/.run";

    NPM_CONFIG_USERCONFIG = "$XDG_CONFIG_HOME/npm/config";
    NPM_CONFIG_TMP = "$XDG_RUNTIME_DIR/npm";
    NPM_CONFIG_CACHE = "$XDG_CACHE_HOME/npm";
    NPM_CONFIG_PREFIX = "$XDG_CACHE_HOME/npm";
    NODE_REPL_HISTORY = "$XDG_CACHE_HOME/node/repl_history";

    IPYTHONDIR = "$XDG_CONFIG_HOME/ipython";
    PIP_CONFIG_FILE = "$XDG_CONFIG_HOME/pip/pip.conf";
    PYLINTRC = "$XDG_CONFIG_HOME/pylint/pylintrc";
    PYTHONSTARTUP = "$XDG_CONFIG_HOME/python/pythonrc";
    JUPYTER_CONFIG_DIR = "$XDG_CONFIG_HOME/jupyter";
    PIP_LOG_FILE = "$XDG_DATA_HOME/pip/log";
    PYLINTHOME = "$XDG_DATA_HOME/pylint";
    PYTHON_EGG_CACHE = "$XDG_CACHE_HOME/python-eggs";
    RUSTUP_HOME = "$XDG_DATA_HOME/rustup";
    CARGO_HOME = "$XDG_DATA_HOME/cargo";

    M2_HOME = "$XDG_CACHE_HOME/maven";
    NIX_PAGER = "less --RAW-CONTROL-CHARS --quit-if-one-screen";
  };
  envExtra = ''
    export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
    export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
    export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"
    export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
    export HOMEBREW_INSTALL_CLEANUP=1
    export HOMEBREW_NO_INSECURE_REDIRECT=1
    export HOMEBREW_NO_ANALYTICS=1
    #export HOMEBREW_CASK_OPTS=--require-sha
    export HOMEBREW_CASK_OPTS=""
    export HOMEBREW_INSTALL_BADGE="🍵"
    export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/library
  '';
  oh-my-zsh = {
    enable = true;

    plugins = [
      # "systemd"
      "sudo"
      "history-substring-search"
      "encode64"
      "rsync"
      "tmux"
    ];
  };
}
