.PHONY: update
update:
	home-manager switch --flake .#subwave-base
	cp ext-config/user-dirs.dirs ~/.config/user-dirs.dirs
	mkdir -p ~/ext 
	mkdir -p ~/media
clean:
	nix-collect-garbage -d
