{
  buildPythonPackage,
  fetchFromGitHub,
  # Buildtime dependencies
  git,
  pytestCheckHook,
  setuptools-scm,
  # Runtime dependencies
  anytree,
  ezdxf,
  ipython,
  numpy,
  ocp,
  ocpsvg,
  py-lib3mf,
  scipy,
  svgpathtools,
  trianglesolver,
  vtk,
}: let
  pname = "build123d";
  version = "0.5.0";
  src = fetchFromGitHub {
    owner = "gumyr";
    repo = pname;
    rev = "v${version}";
    deepClone = true;
    hash = "sha256-h9dQ0DYq4tbh/F7qFgK4Z6eYOHF5TIBcbeepW56gaqQ";
  };
in
  buildPythonPackage {
    inherit src pname version;
    format = "pyproject";

    nativeBuildInputs = [
      git
      pytestCheckHook
      setuptools-scm
    ];

    propagatedBuildInputs = [
      anytree
      ezdxf
      ipython
      numpy
      ocp
      ocpsvg
      py-lib3mf
      scipy
      svgpathtools
      trianglesolver
      vtk
    ];
  }
