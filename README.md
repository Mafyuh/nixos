# nixos

### Provision
```
nix run github:nix-community/nixos-anywhere -- --flake '.#$(hostname)' --build-on-remote nixos@$(hostname)
```

### Deploy
```console
nix develop
deploy .#$(hostname)
```

### Update
```console
nix flake update
```
