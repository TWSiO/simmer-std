{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "simmer-std"
, dependencies = [ "console", "effect", "psci-support", "simmer" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
