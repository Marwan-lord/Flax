{ inputs, lib, config, pkgs, ... }:

{
  imports = [
    ./shell.nix
    ./hypr.nix
    ./pkgs.nix
    ./foot.nix
  ];
  home.username = "marwan";
  home.homeDirectory = "/home/marwan";

  home.stateVersion = "24.11"; 

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

  programs.home-manager.enable = true;
}
