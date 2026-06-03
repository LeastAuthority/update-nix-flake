{
  inputs = {
    # The nixpkgs channels we want to consume
    nixpkgs-26_05.url = "github:NixOS/nixpkgs/nixos-26.05";

    # Some links to the above channels for consistent naming in outputs
    nixpkgs.follows = "nixpkgs-26_05";
  };
  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells."${system}".default = pkgs.mkShell {
        packages = with pkgs; [
          bash
        ];
      };
    };
}
