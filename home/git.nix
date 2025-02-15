{ config, pkgs, ...}: 

{
    programs.git = {
        enable = true;
        userName = "Marwan Mohamed";
        userEmail = "merolokamino@gmail.com";
    };
}
