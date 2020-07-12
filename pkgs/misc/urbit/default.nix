{ stdenv, fetchgit, curl, cacert }:

let

  pname = "urbit";

  version = "0.10.7";

  urbit-derivs = (fetchgit
  {
    url = "https://github.com/urbit/urbit.git";
    rev = "urbit-v${version}";
    sha256 = "172jdg9csray0imjsqyf8dlbf787q0cx0l9p0hpbj3f4gwzsl8l8";
    fetchSubmodules = true;
    leaveDotGit = true;
    postFetch = ''
      cd $out/bin
      curl -OL https://github.com/urbit/urbit/raw/$rev/bin/ivory.pill
    '';
  }
  ).overrideAttrs (oldAttrs: {
  nativeBuildInputs = oldAttrs.nativeBuildInputs or [] ++ [ curl cacert ]; });

in

  with import urbit-derivs;

  urbit.overrideAttrs (_: {
    inherit pname version;

    meta = with stdenv.lib; {
      description = "A personal server operating function";
      homepage = https://urbit.org;
      license = licenses.mit;
      maintainers = with maintainers; [ jtobin ];
      platforms = with platforms; linux ++ darwin;
    };
  })