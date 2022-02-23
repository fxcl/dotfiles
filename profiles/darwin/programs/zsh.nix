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
    GITHUB_TOKEN = "";

    CLOUDFLARE_EMAIL = "me@gnux.cn";
    CLOUDFLARE_API_KEY = "";

    EDITOR = "vim";
    PAGER = "less";
    CLICOLOR = "1";
    GREP_COLOR = "1;33";
    IGNOREEOF = "1";
  };
  envExtra = ''
    export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
    export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"
    export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
    export HOMEBREW_INSTALL_CLEANUP=1
    export HOMEBREW_NO_INSECURE_REDIRECT=1
    export HOMEBREW_NO_ANALYTICS=1
    #export HOMEBREW_CASK_OPTS=--require-sha
    export HOMEBREW_CASK_OPTS=""
    export HOMEBREW_INSTALL_BADGE="🍵"
    export XDG_CONFIG_HOME="$HOME"/.config
    export XDG_DATA_HOME="$XDG_CONFIG_HOME"/local/share
    export XDG_CACHE_HOME="$XDG_CONFIG_HOME"/cache
    export XDG_RUNTIME_DIR="/tmp/$(id -u)-runtime-dir"


    . "/Users/kelvin/.asdf/asdf.sh"
  '';
  oh-my-zsh = {
    enable = true;

    plugins = [
      "systemd"
      "sudo"
      "history-substring-search"
      "encode64"
      "rsync"
      "tmux"
    ];
  };
}
