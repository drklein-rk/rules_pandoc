"Helper macro to generate HTML pages"

load("//pandoc:defs.bzl", "pandoc")

def page(name, src, template = ":page_template", title = None, args = [], data = [], **kwargs):
    pandoc(
        name = name,
        read = "gfm+definition_lists",
        srcs = [src],
        args = args + [
            "--include-after-body=$(location :_includes/footer.html)",
            "--include-before-body=$(location :_includes/nav.html)",
        ],
        template = template,
        standalone = True,
        metadata = {
            "title": title or "",
            "toc-title": "Content",
            "source": "$(location %s)" % src,
        },
        write = "html5",
        data = [
            ":_includes/footer.html",
            ":_includes/nav.html",
        ] + data,
        **kwargs
    )
