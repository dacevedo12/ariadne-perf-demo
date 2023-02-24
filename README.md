Ariadne/graphql-python performance issue with middlewares

# How to run

## With nix (recommended)

- sh <(curl -L https://nixos.org/nix/install) --no-daemon
- nix-env -if https://github.com/fluidattacks/makes/archive/22.11.tar.gz
- m . /api

## With pip

- Install hypercorn==0.14.3
- Install ariadne==0.17.1
- Install graphql-core==3.2.3
- cd api/src
- hypercorn --reload app:APP
