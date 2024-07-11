.PHONY: update
update:
	home-manager switch --flake .#subwave-base
	cp ext-config/user-dirs.dirs ~/.config/user-dirs.dirs
	mkdir -p ~/ext/templates 
	mkdir -p ~/ext/public
	mkdir -p ~/media/music
	mkdir -p ~/media/pics
	mkdir -p ~/media/vids
	mkdir -p ~/downloads
	mkdir -p ~/docs
	mkdir -p ~/desktop

clean:
	nix-collect-garbage -d

font:
	fc-cache --force

setup-apps: 
	mkdir -p ~/.local/share/applications/nix-apps
	ln -s ~/.nix-profile/share/applications ~/.local/share/applications/nix-apps
