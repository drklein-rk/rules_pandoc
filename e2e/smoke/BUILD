"""Provides a simple way to test your rules as an external workspace.
Add a basic smoke-test target below.
"""

load("@bazel_skylib//rules:build_test.bzl", "build_test")
load("@rules_pandoc//pandoc:defs.bzl", "pandoc")

pandoc(
    name = "readme_html",
    srcs = ["README.md"],
    out = "README.html",
    read = "gfm",
    write = "html5",
)

build_test(
    name = "smoke_test",
    targets = [
        ":readme_html",
    ],
)
