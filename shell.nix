{ pkgs ? import <nixpkgs> { } }:

let
  django = pkgs.python3Packages.django_6.overrideAttrs (_: rec {
    version = "6.1.3";
    src = pkgs.fetchPypi {
      pname = "django";
      inherit version;
      hash = "sha256-tdLZ41KVBl0TsZJ7Pxmlm9EZ9zeqYpne8UzMoa48jA0=";
    };
    patches = [ ];
    postPatch = ''
      substituteInPlace pyproject.toml \
        --replace-fail "setuptools>=83" "setuptools"
    '';
    doCheck = false;
    doInstallCheck = false;
    checkPhase = ":";
    installCheckPhase = ":";
  });
in
pkgs.mkShell {
  packages = [
    (pkgs.python3.withPackages (_: [
      django
    ]))
  ];
}
