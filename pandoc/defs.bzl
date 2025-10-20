"""
Rules and Providers for working with [pandoc](https://pandoc.org/).
"""

load("//pandoc/private:pandoc.bzl", _PandocDocumentInfo = "PandocDocumentInfo", _pandoc = "pandoc")

pandoc = _pandoc

PandocDocumentInfo = _PandocDocumentInfo
