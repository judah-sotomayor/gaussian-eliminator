# Getting Started

The easiest development experience is through Nix. Just get nix installed and run `nix shell`, or use direnv.

If you're not familiar with common lisp development, usually work is directed around the REPL.
Emacs comes with good support for this out of the box, Vim has some modes as well.

To get going with a repl straight out of a terminal:

``` sh
sbcl
(asdf:load-system :gaussian-eliminator)
(in-package :gaussian-eliminator)
```

This will load the system and put you in its main package.
