"""
# Rules

Bazel rules to convert files with [pandoc](https://pandoc.org/).
"""

load("//pandoc/private:pandoc.bzl", _pandoc = "pandoc")

pandoc = _pandoc
