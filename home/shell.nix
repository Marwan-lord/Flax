{lib, ...}: {

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
  
       $env.config.table.mode = 'psql'
       $env.config.buffer_editor = "nvim"
       $env.config.edit_mode = 'vi'
       $env.MANPAGER = "bat --plain"
       $env.BAT_THEME = "Nord"
       $env.PATH = ($env.PATH |
       split row (char esep) |
       prepend /home/myuser/.apps |
       append /usr/bin/env
       )
    '';
      nushell.shellAliases = {
        vim = "nvim";
        la = "ls --all";
        lsgen = "nix profile history --profile /nix/var/nix/profiles/system";
        delold = "sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than 14d";
      };
      carapace.enable = true;
      carapace.enableNushellIntegration = true;
      starship.enable = true;

      starship.settings = {
        character = {
          success_symbol = "[ ](blue)";
          error_symbol = "[ ](red)";
        };

        git_branch = {
          symbol = " ";
        };

        git_status = {
          conflicted = "👿 $count ";
          ahead = "⇡ $count ";
          behind = "⇣ $count ";
          untracked = "🤷 $count ";
          stashed = "📦 $count ";
          modified = "פֿ $count ";
          staged = " $count" ;
          renamed = "  $count ";
          deleted = "🗑  $count ";
        };
      };
    };
}
