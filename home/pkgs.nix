{ inputs, config, pkgs, lib, ... }:

{
   home.packages = with pkgs; [
    hello
    dolphin-emu
    clang
    qemu
    clang-tools
    xdg-desktop-portal-gtk
    xdg-desktop-portal
    xdg-desktop-portal-hyprland
    bacon
    kakoune-lsp
    kitty
    lua 
    python3
    man-pages
    man-pages-posix
    yt-dlp
    nwg-look
    hyprcursor
  ];
}

