define(`GITHUB_URL', `https://github.com/drklein-rk/rules_pandoc/')dnl
define(`HTML',`<!doctype html>
<html>
divert(`1')</html>
divert
')dnl
define(`FOR', `$for($1)$ ifelse(`$#', `1', ``$$1$'', ``$2'') $endfor$')dnl
define(`STYLE_LINK', `<link rel="stylesheet" href="$1" />')dnl
define(`META', `<meta name="DC.$1" content="$2" />')dnl
define(`HEAD', `dnl
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>$title$ - rules_pandoc</title>
  FOR(`header-includes')
  META(`Source', `$source$')
  META(`Title', `$title$')
  STYLE_LINK(`https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.fuchsia.min.css')
  FOR(`css', STYLE_LINK(`$css$'))
  <style>
  pre {
    border: 1px solid var(--pico-form-element-active-border-color);
  }
  include(`$1')
  </style>
</head>')dnl
define(`BODY', `dnl
<body>
    FOR(`include-before')
    <section class="container">
      <h1 class="title">$title$</h1>
    </section>
    <section class="container">
      <main>$1</main>
    </section>
    FOR(`include-after')
</body>')dnl
define(`ARTICLE', `<article>$body$</article>
      <aside>
        <section class="content-wrapper">
          <nav id="$idprefix$TOC" role="doc-toc">
            $if(toc-title)$
            <h4 id="$idprefix$toc-title">$toc-title$</h4>
            $endif$ $table-of-contents$
          </nav>
          <hr />
          <a href="GITHUB_URL`blob/main/$source$'">Page source</a>
        </section>
      </aside>')dnl
