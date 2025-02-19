# Images and figures

(content-blocks-images)=
## Images

MyST Markdown provides a few different syntaxes for including images in your documents, as explained below.

The first is the standard Markdown syntax, by which

```md
![fishy](../images/fun-fish.png)
```

results in

![fishy](../images/fun-fish.png)

This will correctly copy the image to the build folder and will render it in all output formats (HTML, TeX, etc).
However, it is limited in the configuration that can be applied. For example, the image width cannot be set with this syntax.

As discussed in [this section](content:myst/directives), MyST allows for directives such as `image` and `figure` to be used (see [the Sphinx documentation](inv:sphinx#rst-primer) for available options).

As an example,

````md
```{image} ../images/fun-fish.png
:alt: fishy
:class: bg-primary mb-1
:width: 200px
:align: center
```
````

will include the following _customized_ figure:

```{image} ../images/fun-fish.png
:alt: fishy
:class: bg-primary mb-1
:width: 200px
:align: center
```

These directives allow you to control aspects of the image with [directive arguments](directive-arguments).


(figures:raw-html)=
### Raw HTML images

The image syntax described above gives you more customizability, but note that this syntax will not show the image in common Markdown viewers (for example when the files are viewed on GitHub).

A workaround is to use HTML directly, and MyST can parse HTML images directly via the `html_image` extension.

:::{warning}
Using raw HTML is usually a bad choice (see [this explanation](raw-html-in-markdown)), so be careful before doing so!
:::

To parse raw HTML image syntax, enable the `html_image` extension to your list of extensions in `_config.yml`:

```yaml
parse:
  myst_enable_extensions:
    # don't forget to list any other extensions you want enabled,
    # including those that are enabled by default! See here: https://jupyterbook.org/en/stable/customize/config.html
    - html_image
```

HTML images will be parsed like any other image. For example:

```html
<img src="../images/fun-fish.png" alt="fishy" class="bg-primary" width="200px">
```

will correctly render

<img src="../images/fun-fish.png" alt="fishy" class="bg-primary mb-1" width="200px">

This will also be output in PDF LaTeX builds!

Allowed attributes are equivalent to the `image` directive: `src`, `alt`, `class`, `width` and `height`.
Any other attributes will be ignored.

(content-blocks-images/formats)=
### Supported image formats

Standard rasterized image formats, such as `.png` and `jpg`, are supported for both HTML and LaTeX/PDF output formats.
By contrast, vector formats such as `.svg`, `.pdf` and `.eps` are normally builder specific.
See the `supported_image_types` specification for each Sphinx builder [here](inv:sphinx#builders).

To support multiple builders, Jupyter Book allows you to use a `*` asterisk as the extension. For example, with the HTML

```html
<img src="../images/fun-fish.*" alt="fishy" class="bg-primary mb-1" width="200px">
```

all images matching the provided pattern will then be searched for and each builder chooses the best image out of the available candidates.

The code above produced the following image:

<img src="../images/fun-fish.*" alt="fishy" class="bg-primary mb-1" width="200px">

You can use a tool such as [imagemagick](https://imagemagick.org), to convert your images to multiple formats prior to building your book.

Alternatively, you may wish to check out these Sphinx extensions:

- [sphinx.ext.imgconverter](inv:sphinx:py:module#sphinx.ext.imgconverter)
- [sphinxcontrib-svg2pdfconverter](https://github.com/missinglinkelectronics/sphinxcontrib-svg2pdfconverter)

## Figures

MyST Markdown also lets you include **figures** in your page. Figures are
like images, except that they are easier to reference elsewhere in your
book, and they include things like captions. To include a figure, use this
syntax:

````md
```{figure} ../images/C-3PO_droid.png
---
height: 150px
name: directive-fig
---
Here is my figure caption!
```
````

which will produce the following:

```{figure} ../images/C-3PO_droid.png
---
height: 150px
name: directive-fig
---
Here is my figure caption!
```

## Markdown figures

Markdown figures combine [colon style admonitions](admonitions:colons) and [HTML image parsing](figures:raw-html), to produce a "Markdown friendly" syntax for figures,
with equivalent behaviour to the `figure` directive above.

:::{note}
Using this feature requires that [HTML image parsing is enabled](figures:raw-html).
:::

The figure block must contain **only** two components; an image, in either Markdown or HTML syntax, and a single paragraph for the caption. See below for an example.

As with admonitions, the figure can have additional classes set.
The "title" of the admonition is used as the label that can be targeted by your cross-references.

For example, the code

```md
:::{figure-md} markdown-fig
<img src="../images/fun-fish.png" alt="fishy" class="bg-primary mb-1" width="200px">

This is a caption in **Markdown**!
:::
```

generates this figure:

:::{figure-md} markdown-fig
<img src="../images/fun-fish.png" alt="fishy" class="bg-primary mb-1" width="200px">

This is a caption in **Markdown**!
:::

As we see here, we can reference the figure:

[Go to the fish!](markdown-fig)

We just have to use the title of the admonition as target:

```md
[Go to the fish!](markdown-fig)
```

(figures:referencing)=
## Referencing figures

You can then refer to your figures by using the `{ref}` role or Markdown style references like:

```md
- {ref}`directive-fig`
- [](markdown-fig)
```

which will replace the reference with the figure caption like so:

- {ref}`directive-fig`
- [](markdown-fig)

(figures:numref)=
### Numbered references

Another convenient way to create cross-references is with the `{numref}` role,
which refers to the labelled objects by the numbers they automatically get.
For example, `` {numref}`directive-fig` `` will produce a reference like: {numref}`directive-fig`.

If an explicit text is provided, this caption will serve as the title of the reference. For example,

```md
- {ref}`Fly to the droid <directive-fig>`
- [Swim to the fish](markdown-fig)
```

produces the following cross-references:

- {ref}`Fly to the droid <directive-fig>`
- [Swim to the fish](markdown-fig)

With `numref` you can also access the figure number and caption individually:
the sequences "%s" and "{number}" will be replaced with the figure number, while "{name}" will be replaced with the figure caption.

For example, ``{numref}`Figure {number}: {name} <directive-fig>` `` will produce {numref}`Figure {number}: {name} <directive-fig>`.

(figures:listoffigures)=
### List of figures or tables

If you are writing a large document such as a thesis or book, it may be useful to create a [List of Figures](https://www.overleaf.com/learn/latex/Lists_of_tables_and_figures) or "List of Tables" index in the LaTeX build output.
This is not currently possible by default because there is not support "short titles" in the figure/table captions.
However, see [this GitHub comment](https://github.com/sphinx-doc/sphinx/issues/10540#issuecomment-1159757219) for a workaround.

## Margin captions and figures

You can include a figure caption on the margin using `:figclass: margin-caption`, as seen in {numref}`margin_caption_figure`:

```{figure} ../images/cool.jpg
---
height: 150px
figclass: margin-caption
name: margin_caption_figure
---
Here is my figure caption!
```

Another option is to include figures on the margin by using `:figclass: margin` as seen in {numref}`margin_figure`:

```{figure} ../images/cool.jpg
---
width: 60%
figclass: margin
name: margin_figure
---
Here is my figure caption!
```

## Figure scaling and aligning

Figures can also be aligned by using the option `:align: right` or `:align: left`. By default, figures are aligned to the center (see {numref}`directive-fig`).

To align a figure on the left, you'd write

````md
```{figure} ../images/cool.jpg
---
scale: 50%
align: left
---
Here is my figure caption!
```
````

to get

```{figure} ../images/cool.jpg
---
scale: 50%
align: left
---
Here is my figure caption!
```

Similarly, if you write

````md
```{figure} ../images/cool.jpg
---
scale: 50%
align: right
---
Here is my figure caption!
```
````

your figure becomes right-aligned:

```{figure} ../images/cool.jpg
---
scale: 50%
align: right

---
Here is my figure caption!
```

## Figure parameters

The following options are supported:

`scale` : _integer percentage_
:  Uniformly scale the figure. The default is "100" which indicates no scaling. The symbol "%" is optional.

`width` : _length or percentage_
:  You can set the figure width in the following units: "em", "ex", "px","in" ,"cm", "mm", "pt", "pc", "%".

`height` : _length_
:  You can set the figure height in the following units: "em", "ex", "px", "in", "cm", "mm", "pt", "pc".

`alt` : _text_
:  Text to be displayed if the figure cannot be displayed or if the reader is using assistive technologies. Generally entails a short description of the figure.

`align` : _"left", "center", or "right"_
:  Align the figure left, center, or right. Default alignment is center.

`name` : _text_
:  A unique identifier for your figure that you can use to reference it with `{ref}` or `{numref}` roles. Cannot contain spaces or special characters.

`figclass` : _text_
:  Value of the figure's class attribute which can be used to add custom CSS or JavaScript. Predefined options include:
  * _"margin"_ : Display figure on the margin
  * _"margin-caption"_ : Display figure caption on the margin
