<!-- Generated with Stardoc: http://skydoc.bazel.build -->

# Rules

Bazel rules to convert files with [pandoc](https://pandoc.org/).

<a id="pandoc"></a>

## pandoc

<pre>
load("@rules_pandoc//pandoc:defs.bzl", "pandoc")

pandoc(<a href="#pandoc-name">name</a>, <a href="#pandoc-srcs">srcs</a>, <a href="#pandoc-data">data</a>, <a href="#pandoc-out">out</a>, <a href="#pandoc-args">args</a>, <a href="#pandoc-bundle">bundle</a>, <a href="#pandoc-read">read</a>, <a href="#pandoc-write">write</a>)
</pre>



**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="pandoc-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/concepts/labels#target-names">Name</a> | required |  |
| <a id="pandoc-srcs"></a>srcs |  Source files that are passed as input to `pandoc`.   | <a href="https://bazel.build/concepts/labels">List of labels</a> | required |  |
| <a id="pandoc-data"></a>data |  Additional files to add to the conversion, e.g.: header, footer, css files.   | <a href="https://bazel.build/concepts/labels">List of labels</a> | optional |  `[]`  |
| <a id="pandoc-out"></a>out |  The output file to write   | <a href="https://bazel.build/concepts/labels">Label</a> | required |  |
| <a id="pandoc-args"></a>args |  Additional arguments passed to `pandoc`, subject to location expansion   | List of strings | optional |  `[]`  |
| <a id="pandoc-bundle"></a>bundle |  Bundle all assets givent to `pandoc` into the output file. This sets the arguments `--standalone` and `--embed-resources`.   | Boolean | optional |  `False`  |
| <a id="pandoc-read"></a>read |  The format to read the sources as. Run `pandoc --list-input-formats` for more information   | String | required |  |
| <a id="pandoc-write"></a>write |  The format to write the output as. Run `pandocs --list-output-formats` for more information   | String | required |  |


