.PHONY: update
update:
	home-manager switch --flake .#subwave-base
clean:
	nix-collect-garbage -d
