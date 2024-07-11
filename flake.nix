{
	description = "My Home Manager configuration";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-24.05";

		unstable.url = "nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager/release-24.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { nixpkgs, unstable, home-manager, ... }:
		let
			lib = nixpkgs.lib;
			system = "x86_64-linux";
			pkgs = import nixpkgs { inherit system; };
		in {
			homeConfigurations = {
				subwave-base = home-manager.lib.homeManagerConfiguration {
					inherit pkgs;	
					modules = [ ./home.nix ];
					extraSpecialArgs = {
						unstable = import unstable { 
							inherit system;
							config.allowUnfree = true;
						};
					};
				};
			};
		};
}
