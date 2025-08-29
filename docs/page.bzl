"Helper macro to generate HTML pages"

load("//pandoc:defs.bzl", "pandoc")

def page(name, src, template = "page", title = None, args = [], data = [], **kwargs):
    pandoc(
        name = name,
        read = "gfm",
        srcs = [src],
        args = args + [
            "--include-after-body=$(location :_includes/footer.html)",
            "--include-before-body=$(location :_includes/header.html)",
        ],
        template = ":_templates/%s.html" % template,
        standalone = True,
        metadata = {
            "title": title or "",
            "toc-title": "Content",
            "source": "$(location %s)" % src,
        },
        write = "html5",
        data = [
            ":_includes/footer.html",
            ":_includes/header.html",
        ] + data,
        **kwargs
    )
