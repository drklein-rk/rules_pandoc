"""Provides a simple way to test your rules as an external workspace.
Add a basic smoke-test target below.
"""

load("@bazel_skylib//rules:build_test.bzl", "build_test")
load("@rules_pandoc//pandoc:defs.bzl", "pandoc")

pandoc(
    name = "html_out_1",
    srcs = ["README.md"],
    out = "out1.html",
    read = "gfm",
    write = "html5",
)

genrule(
    name = "html_out_2",
    srcs = ["README.md"],
    outs = ["out2.html"],
    cmd = """\
        $(PANDOC_BIN) --from gfm \
        --to html --out $(OUTS) < $(SRCS)""",
    toolchains = ["@rules_pandoc//pandoc:resolved_toolchain"],
)

build_test(
    name = "smoke_test",
    targets = [
        ":html_out_1",
        ":html_out_2",
    ],
)
