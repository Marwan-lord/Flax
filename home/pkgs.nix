{inputs, config, pkgs, lib, ...}:

{
   home.packages = with pkgs; [
    hello
    dolphin-emu
    clang
    qemu
    clang-tools
  ];
}

