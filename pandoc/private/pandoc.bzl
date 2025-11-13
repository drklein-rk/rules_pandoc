"Pandoc Rules"

load("@bazel_lib//lib:expand_make_vars.bzl", "expand_locations")

_PANDOC_TOOLCHAIN = "//pandoc:toolchain_type"

PandocDocumentInfo = provider(
    doc = "Pandoc document information",
    fields = {
        "template": "Path to the used template file, None if the default template is used",
        "sources": "depset of files that are used as input to `pandoc`",
        "output": "output file",
        "title": "Document title",
    },
)

def _pandoc_implementation(ctx):
    inputs = ctx.files.srcs + ctx.files.data
    toolchain = ctx.toolchains[_PANDOC_TOOLCHAIN].pandocinfo
    output = ctx.outputs.out

    args = ctx.actions.args()
    args.add("--output", output)
    args.add("--read", ctx.attr.read)
    args.add("--write", ctx.attr.write)

    for a in ctx.attr.args:
        args.add_all([expand_locations(ctx, a, ctx.attr.data + ctx.attr.srcs)])

    if ctx.attr.metadata:
        for (k, v) in ctx.attr.metadata.items():
            args.add("--metadata", "{key}={value}".format(key = k, value = expand_locations(ctx, v, ctx.attr.data)))

    if ctx.attr.template:
        args.add("--template", ctx.file.template)
        inputs.append(ctx.file.template)

    if ctx.attr.standalone:
        args.add("--standalone")

    if ctx.attr.embed_resources:
        args.add("--embed-resources")

    if ctx.attr.metadata_file:
        args.add("--metadata-file", ctx.file.metadata_file)
        inputs.append(ctx.file.metadata_file)

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
        PandocDocumentInfo(
            template = depset([ctx.file.template]) if ctx.attr.template else None,
            sources = depset(ctx.files.srcs),
            title = ctx.attr.title,
            output = output,
        ),
    ]

pandoc = rule(
    doc = """\
This is the main rule to interactive with `pandoc`.""",
    attrs = {
        "srcs": attr.label_list(
            allow_files = True,
            mandatory = True,
            doc = """\
Source files that are passed as input to `pandoc`.""",
        ),
        "template": attr.label(
            allow_single_file = True,
            doc = """\
The template to use to render the output file.""",
        ),
        "title": attr.string(
            mandatory = False,
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
        "standalone": attr.bool(
            default = False,
            doc = """\
Convert the input to a standalone document.
See the documentation for the [`--standalone`](https://pandoc.org/MANUAL.html#option--standalone) option for details.""",
        ),
        "embed_resources": attr.bool(
            default = False,
            doc = """\
Embed external resources (e.g. style files) into the output document.
See the documentation for the [`--embed-resources`](https://pandoc.org/MANUAL.html#option--embed-resources[) option for details.""",
        ),
        "metadata": attr.string_dict(
            mandatory = False,
            doc = """\
Metadata to give to the conversion. This represents the `--metadata` option of pandoc.""",
        ),
        "metadata_file": attr.label(
            allow_single_file = True,
            mandatory = False,
            doc = """\
A file containing metadata in YAML format (or JSON) to pass to pandoc.""",
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
