{fetchNixpkgs, ...}: {
  extendingMakesDirs = ["/"];
  inputs = {
    nixpkgs = fetchNixpkgs {
      rev = "aff767f7eafd128672c2cfe5d33bec6d8d98e594";
      sha256 = "sha256-KRJfqdthSSVtY6D4qZNGYk8MZSMWYFqk6QcCNqY6WOE=";
    };
  };
}
