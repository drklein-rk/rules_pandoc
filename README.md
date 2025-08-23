# Bazel rules for pandoc

## Installation

```starlark
bazel_dep(name = "rules_pandoc", version = "0.0.0")
```

## Usage

```starlark
load("@rules_pandoc//pandoc:defs.bzl", "pandoc")

pandoc(
    name = "html",
    srcs = ["README.md"],
    out = "index.html",
    read = "gfm",
    write = "html5",
)
```
