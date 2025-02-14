# MkDocs Material + PlantUML

A distribution combining [mkdocs-material](https://squidfunk.github.io/mkdocs-material/) and [PlantUML](http://plantuml.com/).

## Quick start

Follow the setup instructions from mkdocs-material. Add `plantuml_-_markdown` to the `markdown_extensions` list in `mkdocs.yml`.

```yaml
markdown_extensions:
    - plantuml_markdown
```

Then generate your site using the following command:

```bash
docker run --rm -v $(PWD):/docs ghcr.io/ejlevin1/mkdocs-material-plantuml:main build
```

Add a UML block like so:

    ```plantuml
      Goofy ->  MickeyMouse: calls
      Goofy <-- MickeyMouse: responds
    ```

UML will be rendered as an inline image:

![Example](assets/example.png)


## Further examples

See examples at [mikitex70/plantuml-markdown](https://github.com/mikitex70/plantuml-markdown) and [PlantUML](http://plantuml.com/)

## Credits

* [squidfunk/mkdocs-material](https://squidfunk.github.io/mkdocs-material/)
* [mikitex70/plantuml-markdown](https://github.com/mikitex70/plantuml-markdown)
* [PlantUML](http://plantuml.com/)



