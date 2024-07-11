{ lib, pkgs, ... }:
let 
user = "subwave";
in
{
  home = {
    packages = with pkgs; [
      home-manager
      neovim
      hello
    ];

    # This needs to actually be set to your username
    username = "${user}";
    homeDirectory = "/home/${user}";

    file = with builtins; {
    	".config/user-dirs.dirs".text = readFile "config/user-dirs.dirs";
    };

    # You do not need to change this if you're reading this in the future.
    # Don't ever change this after the first build.  Don't ask questions.
    stateVersion = "24.05";
  };
}
