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

<div class="grid"><div>

Load and use the `pandoc` rule.

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

</div><div>

Use Pandoc from the `resolved_toolchain`.

```starlark
genrule(
    name = "html",
    srcs = ["README.md"],
    outs = ["index.html"],
    cmd = """\
        $(PANDOC_BIN) --from gfm \
        --to html --out $(OUTS) < $(SRCS)""",
    toolchains = ["@rules_pandoc//pandoc:resolved_toolchain"],
)
```

</div></div>

### Acknowledgement

- The [Pandoc Logo] used on this site was created by Albert Krewinkel ([tarleb])
  and published under CC BY-SA 4.0 license.
- We use the amazing [PicoCSS] (fuchsia) to style this page.

[tarleb]: https://github.com/tarleb
[Pandoc Logo]: https://github.com/tarleb/pandoc-logo
[PicoCSS]: https://github.com/picocss/pico
