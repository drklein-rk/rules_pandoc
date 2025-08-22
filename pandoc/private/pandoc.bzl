"""
# Pandoc

Bazel rules to convert files with [pandoc](https://pandoc.org/).
"""

load("@aspect_bazel_lib//lib:expand_make_vars.bzl", "expand_locations")

_PANDOC_TOOLCHAIN = "//pandoc:toolchain_type"

def _pandoc_implementation(ctx):
    inputs = ctx.files.srcs + ctx.files.data
    toolchain = ctx.toolchains[_PANDOC_TOOLCHAIN].pandocinfo
    output = ctx.outputs.out

    args = ctx.actions.args()
    args.add("--output", output)
    args.add("--read", ctx.attr.read)
    args.add("--write", ctx.attr.write)
    for a in ctx.attr.args:
        args.add_all([expand_locations(ctx, a, ctx.attr.data)])

    if ctx.attr.bundle:
        args.add("--standalone")
        args.add("--embed-resources")

    args.add_all(ctx.files.srcs)

    ctx.actions.run(
        outputs = [output],
        inputs = inputs,
        arguments = [args],
        mnemonic = "PandocConvert",
        executable = toolchain.tool_files[0],
    )

    return [
        DefaultInfo(
            files = depset([output]),
        ),
    ]

pandoc = rule(
    attrs = {
        "srcs": attr.label_list(
            allow_files = True,
            mandatory = True,
            doc = """\
Source files that are passed as input to `pandoc`.""",
        ),
        "out": attr.output(
            mandatory = True,
            doc = "The output file to write",
        ),
        "args": attr.string_list(
            mandatory = False,
            default = [],
            doc = """\
Additional arguments passed to `pandoc`, subject to location expansion""",
        ),
        "read": attr.string(
            mandatory = True,
            doc = """\
The format to read the sources as.
Run `pandoc --list-input-formats` for more information""",
        ),
        "write": attr.string(
            mandatory = True,
            doc = """\
The format to write the output as.
Run `pandocs --list-output-formats` for more information""",
        ),
        "bundle": attr.bool(
            default = False,
            doc = """\
Bundle all assets givent to `pandoc` into the output file.
This sets the arguments `--standalone` and `--embed-resources`.""",
        ),
        "data": attr.label_list(
            allow_files = True,
            mandatory = False,
            doc = """\
Additional files to add to the conversion, e.g.: header, footer, css files.""",
        ),
    },
    implementation = _pandoc_implementation,
    toolchains = [_PANDOC_TOOLCHAIN],
)
