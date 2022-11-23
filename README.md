<p align="center">
  <img src="/assets/images/logo.png">
</p>

# Wilco Developers Documentation

Welcome! This is the repository that generates [dev.trywilco.com]. It contains all the source code and Markdown files we use to build and serve our documentation.

## Wilco ❤️ Developers

The documentation in this repository is meant to help anyone build new and amazing quests in Wilco, but we could also use your help improving it. 

On each page of the website, you have an edit button, which will lead you directly to GitHub's editor. You can also [create an issue], and we'll take a look at it right away.

## Local Development

This repository uses [Jekyll] with [Just the Docs] template to generate and serve a static HTML website directly from [GitHub Pages].

Assuming [Ruby], [Jekyll] and [Bundler] are installed on your computer:

1.  Clone this repository.

2.  Run `bundle install`.

3.  Run `bundle exec jekyll serve` to build your site and preview it at `localhost:4000`.

    The built site is stored in the directory `_site`.

## Deployment

Any commits to main trigger an automatic rebuild and deployment to [dev.trywilco.com]. You can see the [deployment status here](https://github.com/trywilco/wilco-docs/deployments).

## Additional Resources
- [Jekyll Documentation]
- [Just the Docs]

[dev.trywilco.com]: https://dev.trywilco.com
[create an issue]: https://github.com/trywilco/wilco-docs/issues/new/choose
[Jekyll]: https://jekyllrb.com
[Jekyll Documentation]: https://jekyllrb.com/docs/
[Just the Docs]: https://just-the-docs.github.io/just-the-docs/
[GitHub Pages]: https://docs.github.com/en/pages
[Ruby]: https://www.ruby-lang.org/en/documentation/installation/
[Bundler]: https://bundler.io
