.PHONY: update
update:
	home-manager switch --flake .#subwave-base
	cp ext-config/user-dirs.dirs ~/.config/user-dirs.dirs
	mkdir -p ~/ext 
	mkdir -p ~/media

clean:
	nix-collect-garbage -d

font:
	fc-cache --force

setup-apps: 
	mkdir -p ~/.local/share/applications/nix-apps
	ln -s ~/.nix-profile/share/applications ~/.local/share/applications/nix-apps
