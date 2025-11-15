"""Unit tests for starlark helpers
See https://bazel.build/rules/testing#testing-starlark-utilities
"""

load("@rules_testing//lib:test_suite.bzl", "test_suite")
load("//pandoc/private:versions.bzl", "TOOL_VERSIONS")

def _smoke_test(env):
    env.expect.that_str(TOOL_VERSIONS.keys()[0]).equals("3.7.0.2")

def versions_test_suite(name):
    test_suite(
        name = name,
        basic_tests = [
            _smoke_test,
        ],
    )
