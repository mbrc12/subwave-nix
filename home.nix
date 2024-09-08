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

			tectonic
			pplatex

			# see list of fonts here 
			# https://github.com/NixOS/nixpkgs/blob/e2dd4e18cc1c7314e24154331bae07df76eb582f/pkgs/data/fonts/nerdfonts/shas.nix
			(nerdfonts.override { fonts = [ "FiraCode" "Iosevka" "JetBrainsMono"]; })
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

	programs = {
		git = {
			enable = true;
			userEmail = "mbrc12@gmail.com";
			userName = "Mriganka Basu Roy Chowdhury";

			extraConfig = {
				init.defaultBranch = "main";
			};
		};
	};

	fonts.fontconfig.enable = true;
}
