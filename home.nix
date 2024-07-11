{ lib, pkgs, unstable, ... }:
let 
	user = "subwave";
	conf = ".config";
in
	{
	home = {
		packages = with pkgs; [
			home-manager
			tree
			ripgrep

			tmux		

			unstable.neovim

			tree-sitter

			nodejs

			zathura
		];

		# This needs to actually be set to your username
		username = "${user}";
		homeDirectory = "/home/${user}";

		file = with builtins; {
			"${conf}/kitty" = {
				source = ./config/kitty;
			};

			"${conf}/nvim" = {
				source = ./config/nvim;
				recursive = true;
			};

			# You still need to install tpm and run <C-x>I to install packages
			"./.tmux.conf".text = readFile ./config/tmux.conf;

			"${conf}/zathura/zathurarc".text = readFile ./config/zathurarc;
		};

		# You do not need to change this if you're reading this in the future.
		# Don't ever change this after the first build.  Don't ask questions.
		stateVersion = "24.05";
	};
}
