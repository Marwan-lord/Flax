{lib, ...}:

{
   home.packages = with pkgs; [
    hello
    dolphin-emu
    clang
    clang-tools
  ];
}

