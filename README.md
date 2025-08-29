# Bazel rules for Pandoc

<!--

NOTE:   The following headings are set to level 3 because we later shift them
        by -1 (see //docs:pages.bzl). This will make them to level 2 headings
        and the level 1 heading above appear as the title of the document.

-->

### Installation

Put `rules_pandoc` as a new dependency in your `MODULE.bazel`.

```starlark
bazel_dep(name = "rules_pandoc", version = "0.0.0")
```

### Usage

Load and use in a `BUILD.bazel` file.

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

### Resources

- [Pandoc Manual](https://pandoc.org/MANUAL.html)
