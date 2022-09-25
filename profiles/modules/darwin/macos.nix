{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.macos;
  me = "kelvin";
in

{
  options = with lib; {
    my.modules.macos = {
      enable = mkEnableOption ''
        Whether to enable macos module
      '';
    };

    # system.defaults.dock.wvous-tl-corner = mkOption {
    #   type = types.nullOr types.int;
    #   default = null;
    #   description = ''
    #     Hot corner action for top left corner
    #   '';
    # };

    # system.defaults.dock.wvous-bl-corner = mkOption {
    #   type = types.nullOr types.int;
    #   default = null;
    #   description = ''
    #     Hot corner action for bottom left corner
    #   '';
    # };

    # system.defaults.dock.wvous-tr-corner = mkOption {
    #   type = types.nullOr types.int;
    #   default = null;
    #   description = ''
    #     Hot corner action for top right corner
    #   '';
    # };

    # system.defaults.dock.wvous-br-corner = mkOption {
    #   type = types.nullOr types.int;
    #   default = null;
    #   description = ''
    #     Hot corner action for bottom right corner
    #   '';
    # };

    system.defaults.dock.largesize = mkOption {
      type = types.nullOr types.int;
      default = null;
      description = ''
        Large size of the icons in the dock.  The default is 64.
      '';
    };

    system.defaults.dock.magnification = mkOption {
      type = types.nullOr types.bool;
      default = null;
      description = ''
        Enable magnification for the icons in the dock.  The default is false.
      '';
    };
  };

  config = with lib;
    mkIf cfg.enable {
      environment.variables = {
        LANG = "en_US.UTF-8";
        LC_TIME = "en_GB.UTF-8";
      };

      homebrew = {
        taps = [
          "homebrew/bundle"
          "homebrew/cask"
          "homebrew/core"
          "homebrew/services"
        ];

        casks = [
          "swiftdefaultappsprefpane"
        ];

        brews = [
          "mas"
        ];

        masApps = {
          #"1Password 7" = 1333542190;
          #"Xcode" = 497799835;
          #"The Unarchiver" = 425424353;
        };
      };

      system = {
        defaults = {

          # System - Enable font smoothing
          # Enables subpixel font rendering on non-Apple LCDs
          NSGlobalDomain.AppleFontSmoothing = 1;

          # Keyboard - Enable full keyboard access for all controls.
          # (e.g., enable Tab in modal dialogs)
          NSGlobalDomain.AppleKeyboardUIMode = 3;

          # Keyboard - Disable press-and-hold for keys in favor of key repeat
          NSGlobalDomain.ApplePressAndHoldEnabled = false;

          # Finder - Show filename extensions.
          NSGlobalDomain.AppleShowAllExtensions = true;

          # System - Automatically show scroll bars
          NSGlobalDomain.AppleShowScrollBars = "Automatic";

          # System - What temperature unit to use
          NSGlobalDomain.AppleTemperatureUnit = "Celsius";

          # Keyboard - Set a short Delay until key repeat.
          NSGlobalDomain.InitialKeyRepeat = 15;

          # Keyboard - Set a fast keyboard repeat rate.
          NSGlobalDomain.KeyRepeat = 1;

          # System - Disable automatic capitalization as it’s annoying when typing code
          NSGlobalDomain.NSAutomaticCapitalizationEnabled = false;

          # System - Disable smart dashes as they’re annoying when typing code
          NSGlobalDomain.NSAutomaticDashSubstitutionEnabled = false;

          # System - Disable automatic period substitution as it’s annoying when typing code
          NSGlobalDomain.NSAutomaticPeriodSubstitutionEnabled = false;

          # System - Disable smart quotes as they’re annoying when typing code
          NSGlobalDomain.NSAutomaticQuoteSubstitutionEnabled = false;

          # System - Disable auto-correct
          NSGlobalDomain.NSAutomaticSpellingCorrectionEnabled = false;

          # iCloud - Don't save new documents to iCloud by default
          NSGlobalDomain.NSDocumentSaveNewDocumentsToCloud = false;

          # System - Expand save panel by default.
          NSGlobalDomain.NSNavPanelExpandedStateForSaveMode = true;
          NSGlobalDomain.NSNavPanelExpandedStateForSaveMode2 = true;

          # System - Decrease window resize duration
          # NSGlobalDomain.NSWindowResizeTime = "0.001";

          # Printer - Expand print panel by default.
          NSGlobalDomain.PMPrintingExpandedStateForPrint = true;
          NSGlobalDomain.PMPrintingExpandedStateForPrint2 = true;

          # NSGlobalDomain.AppleMeasurementUnits = "Centimeters";
          # NSGlobalDomain.AppleMetricUnits = 1;
          # NSGlobalDomain.NSDisableAutomaticTermination = false;
          # NSGlobalDomain.NSScrollAnimationEnabled = false;
          # NSGlobalDomain.NSTableViewDefaultSizeMode = 2;
          # NSGlobalDomain.NSTextShowsControlCharacters = true;
          # NSGlobalDomain.NSUseAnimatedFocusRing = false;
          # NSGlobalDomain."com.apple.mouse.tapBehavior" = 1;
          # NSGlobalDomain."com.apple.trackpad.enableSecondaryClick" = true;
          # NSGlobalDomain."com.apple.trackpad.trackpadCornerClickBehavior" = 1;

          # Trackpad - Disable natural scrolling
          # NSGlobalDomain."com.apple.swipescrolldirection" = false;

          # System - Disable 'Are you sure you want to open this application?' dialog
          LaunchServices.LSQuarantine = false;

          # Dock - Don’t show recent applications in Dock
          dock.show-recents = false;

          # Dock - Make icons of hidden applications translucent
          dock.showhidden = true;

          # Dock - Don’t automatically rearrange Spaces based on most recent use
          dock.mru-spaces = false;

          # Dock - Orient to the bottom
          dock.orientation = "bottom";

          # Dock - Minimize apps to their icon
          dock.minimize-to-application = true;

          dock.tilesize = 48;

          dock.wvous-tl-corner = 2;
          dock.wvous-bl-corner = 3;
          dock.wvous-tr-corner = 2;
          dock.wvous-br-corner = 3;

          # Finder - Disable the warning when changing a file extension
          finder.FXEnableExtensionChangeWarning = false;

          # Finder - Add quit option
          finder.QuitMenuItem = true;

          finder.AppleShowAllExtensions = true;
          finder._FXShowPosixPathInTitle = true;

          # Screencapture - Save screenshots to the desktop
          screencapture.location = "/Users/${config.my.username}/Pictures/Screenshots";

          SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;

          loginwindow.DisableConsoleAccess = true;
          loginwindow.GuestEnabled = false;
          # LoginwindowText = "";
          loginwindow.PowerOffDisabledWhileLoggedIn = true;
          loginwindow.RestartDisabledWhileLoggedIn = true;
          loginwindow.ShutDownDisabledWhileLoggedIn = true;
          loginwindow.SHOWFULLNAME = true;

          trackpad.ActuationStrength = 1;
          trackpad.Clicking = true;
          trackpad.FirstClickThreshold = 1;
          trackpad.SecondClickThreshold = 1;
          trackpad.TrackpadRightClick = true;
          trackpad.TrackpadThreeFingerDrag = true;
        };

      };

      # Suppose to fix applications not showing in the applications folder
      # https://github.com/LnL7/nix-darwin/issues/139#issuecomment-666771621
      # https://github.com/LnL7/nix-darwin/issues/214
      system.activationScripts.applications.text =
        let
          env = pkgs.buildEnv {
            name = "applications";
            paths = config.environment.systemPackages ++ config.users.users.${me}.packages;
            pathsToLink = "/Applications";
          };
        in
        pkgs.lib.mkForce ''
          # Set up applications.
          echo "setting up ~/Applications/Nix..." >&2
          rm -rf ~/Applications/Nix
          mkdir -p ~/Applications/Nix
          srcs=()
          while read src; do
            srcs+=("$src")
          done < <(find ${env}/Applications -maxdepth 1 -type l)
          if [[ "''${#srcs[@]}" != 0 ]]; then
            /bin/cp -LR "''${srcs[@]}" ~/Applications/Nix
          fi
        '';
    };
}
