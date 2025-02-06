{ inputs, lib, config, pkgs, ... }:

{
  home.username = "marwan";
  home.homeDirectory = "/home/marwan";

  home.stateVersion = "24.11"; 

  programs.btop = {
    settings = {
      color_theme = "nord";
      vim_keys = true;
    };
  };

  home.packages = with pkgs; [
    hello
    dolphin-emu
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
   home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # programs.bash.enable = true;
  #
  # programs.bash.initExtra = ''
  #   [[ -f ~/.profile ]] && . ~/.profile
  #   '';
  # home.sessionVariables = {
  #   EDITOR = "vim";
  #   MANPAGER="vim -M +MANPAGER - ";
  #   BAT_THEME="Nord";
  # };



  programs = {
    nushell.enable = true;
    nushell.extraConfig = ''
       let carapace_completer = {|spans|
         carapace $spans.0 nushell $spans | from json
       }

       $env.config = {
        show_banner: false,
        completions: {
        case_sensitive: false # case-sensitive completions
        quick: true    # set to false to prevent auto-selecting completions
        partial: true    # set to false to prevent partial filling of the prompt
        algorithm: "fuzzy"    # prefix or fuzzy
        external: {
        # set to false to prevent nushell looking into $env.PATH to find more suggestions
            enable: true
        # set to lower can improve completion performance at the cost of omitting some options
            max_results: 100
            completer: $carapace_completer # check 'carapace_completer'
          }
        }
       }

       $env.config.buffer_editor = "vim"
       $env.MANPAGER = "bat --plain"

       $env.PATH = ($env.PATH |
       split row (char esep) |
       prepend /home/myuser/.apps |
       append /usr/bin/env
       )
    '';

      nushell.shellAliases = {
        vim = "vi";
        la = "la --all";

      };

      carapace.enable = true;
      carapace.enableNushellIntegration = true;
      starship.enable = true;

      starship.settings = {
        character = {
          success_symbol = " (blue)";
        };
        git_status = {
          conflicted = "👿 $count ";
          ahead = "⇡ $count ";
          behind = "⇣ $count ";
          untracked = "🤷 $count ";
          stashed = "📦 $count ";
          modified = "פֿ $count ";
          staged = "[ $count ]";
          renamed = " $count ";
          deleted = "🗑 $count ";
        };
      };
    };

  programs.home-manager.enable = true;
}
