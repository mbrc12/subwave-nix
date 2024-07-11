{ lib, pkgs, ... }:
let 
	user = "subwave";
in
	{
	home = {
		packages = with pkgs; [
			home-manager
			tree
			ripgrep

			tmux		

			neovim
			tree-sitter

			nodejs

			zathura

			fira-sans
			fira-code-nerdfont
		];

		# This needs to actually be set to your username
		username = "${user}";
		homeDirectory = "/home/${user}";

		file = with builtins; {
			".config/kitty" = {
				source = ./config/kitty;
			};

			".config/nvim" = {
				source = ./config/nvim;
				recursive = true;
			};

			# You still need to install tpm and run <C-x>I to install packages
			"./.tmux.conf".text = readFile ./config/tmux.conf;

			"./config/zathura/zathurarc".text = readFile ./config/zathurarc;
		};

		# You do not need to change this if you're reading this in the future.
		# Don't ever change this after the first build.  Don't ask questions.
		stateVersion = "24.05";
	};
}
