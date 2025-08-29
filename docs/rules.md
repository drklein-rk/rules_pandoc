<!-- Generated with Stardoc: http://skydoc.bazel.build -->

Bazel rules to convert files with [pandoc](https://pandoc.org/).

<a id="pandoc"></a>

## pandoc

<pre>
load("@rules_pandoc//pandoc:defs.bzl", "pandoc")

pandoc(<a href="#pandoc-name">name</a>, <a href="#pandoc-srcs">srcs</a>, <a href="#pandoc-data">data</a>, <a href="#pandoc-out">out</a>, <a href="#pandoc-args">args</a>, <a href="#pandoc-embed_resources">embed_resources</a>, <a href="#pandoc-metadata">metadata</a>, <a href="#pandoc-read">read</a>, <a href="#pandoc-standalone">standalone</a>, <a href="#pandoc-template">template</a>, <a href="#pandoc-title">title</a>,
       <a href="#pandoc-write">write</a>)
</pre>

This is the main rule to interactive with `pandoc`.

**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="pandoc-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/concepts/labels#target-names">Name</a> | required |  |
| <a id="pandoc-srcs"></a>srcs |  Source files that are passed as input to `pandoc`.   | <a href="https://bazel.build/concepts/labels">List of labels</a> | required |  |
| <a id="pandoc-data"></a>data |  Additional files to add to the conversion, e.g.: header, footer, css files.   | <a href="https://bazel.build/concepts/labels">List of labels</a> | optional |  `[]`  |
| <a id="pandoc-out"></a>out |  The output file to write   | <a href="https://bazel.build/concepts/labels">Label</a> | required |  |
| <a id="pandoc-args"></a>args |  Additional arguments passed to `pandoc`, subject to location expansion   | List of strings | optional |  `[]`  |
| <a id="pandoc-embed_resources"></a>embed_resources |  Embed external resources (e.g. style files) into the output document. See the documentation for the [`--embed-resources`](https://pandoc.org/MANUAL.html#option--embed-resources[) option for details.   | Boolean | optional |  `False`  |
| <a id="pandoc-metadata"></a>metadata |  Metadata to give to the conversion. This represents the `--metadata` option of pandoc.   | <a href="https://bazel.build/rules/lib/dict">Dictionary: String -> String</a> | optional |  `{}`  |
| <a id="pandoc-read"></a>read |  The format to read the sources as. Run `pandoc --list-input-formats` for more information   | String | required |  |
| <a id="pandoc-standalone"></a>standalone |  Convert the input to a standalone document. See the documentation for the [`--standalone`](https://pandoc.org/MANUAL.html#option--standalone) option for details.   | Boolean | optional |  `False`  |
| <a id="pandoc-template"></a>template |  The template to use to render the output file.   | <a href="https://bazel.build/concepts/labels">Label</a> | optional |  `None`  |
| <a id="pandoc-title"></a>title |  -   | String | optional |  `""`  |
| <a id="pandoc-write"></a>write |  The format to write the output as. Run `pandocs --list-output-formats` for more information   | String | required |  |


<a id="PandocDocumentInfo"></a>

## PandocDocumentInfo

<pre>
load("@rules_pandoc//pandoc:defs.bzl", "PandocDocumentInfo")

PandocDocumentInfo(<a href="#PandocDocumentInfo-template">template</a>, <a href="#PandocDocumentInfo-sources">sources</a>, <a href="#PandocDocumentInfo-output">output</a>, <a href="#PandocDocumentInfo-title">title</a>)
</pre>

Pandoc document information

**FIELDS**

| Name  | Description |
| :------------- | :------------- |
| <a id="PandocDocumentInfo-template"></a>template |  Path to the used template file, None if the default template is used    |
| <a id="PandocDocumentInfo-sources"></a>sources |  depset of files that are used as input to `pandoc`    |
| <a id="PandocDocumentInfo-output"></a>output |  output file    |
| <a id="PandocDocumentInfo-title"></a>title |  Document title    |


