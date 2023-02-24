{
  inputs,
  makePythonPypiEnvironment,
  makeScript,
  projectPath,
  ...
}: let
  self_h2 = inputs.nixpkgs.python311Packages.h2.overridePythonAttrs (old: rec {
    src = inputs.nixpkgs.fetchFromGitHub {
      owner = "python-hyper";
      repo = old.pname;
      rev = "bc005afad8302549facf5afde389a16759b2ccdb";
      hash = "sha256-Q+bw8SjLQGPl7zX7NpM25723moV6N5lQ6VNIpNNCTdI=";
    };
  });
  self_hypercorn = inputs.nixpkgs.python311Packages.hypercorn.overridePythonAttrs (_: rec {
    doCheck = false;
    propagatedBuildInputs = [
      inputs.nixpkgs.python311Packages.priority
      inputs.nixpkgs.python311Packages.toml
      inputs.nixpkgs.python311Packages.wsproto
      self_h2
    ];
  });
  pythonEnvironment = makePythonPypiEnvironment {
    name = "apiEnvironment";
    sourcesYaml = ./sources.yaml;
    searchPathsRuntime = {
      bin = [
        self_hypercorn
      ];
    };
  };
in
  makeScript {
    entrypoint = ./entrypoint.sh;
    name = "api";
    searchPaths = {
      bin = [inputs.nixpkgs.python311];
      source = [pythonEnvironment];
    };
  }
