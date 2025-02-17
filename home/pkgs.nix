{ inputs, config, pkgs, lib, ... }:

{
   home.packages = with pkgs; [
    hello
    dolphin-emu
    clang
    qemu
    clang-tools
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
    upower
    ungoogled-chromium
  ];
}

