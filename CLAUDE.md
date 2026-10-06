# CLAUDE.md

Personal academic website of Orestis Kopsacheilis (Assistant Professor of Economics, University of Crete).
Live at https://orestiskps.github.io. Built with Jekyll on a trimmed-down copy of the **al-folio** theme.

## How publishing works

- Pushing to `main` triggers `.github/workflows/deploy.yml`: GitHub Actions runs `bundle exec jekyll build`, purges unused CSS, and publishes `_site/` to the `gh-pages` branch. The site updates a few minutes after the push.
- Only pushes touching `assets/**`, `_sass/**`, `_scripts/**`, `*.bib`, `*.html`, `*.js`, `*.liquid`, `*.md`, `*.yml` or the Gemfile trigger a deploy.
- A failed build leaves the old site online. Check the run on GitHub (Actions tab) after pushing.
- **Ruby, Bundler and `gh` are not installed on this machine**, so the site cannot be built or previewed locally. `.claude/launch.json` has a `jekyll serve` config for when Ruby is installed. Until then, keep changes small and verify the live site after each deploy.
- Remote is `git@github.com:OrestisKps/OrestisKps.github.io.git` (SSH). As of 2026-10-06 this machine has no SSH key for GitHub, so `git push` from here fails; the owner pushes.
- Deploy status can be read without `gh`: `curl -s "https://api.github.com/repos/OrestisKps/OrestisKps.github.io/actions/runs?per_page=3"`.
- The repo lives in a Google Drive–synced folder. Avoid running git on it from two machines at once.
- Only commit or push when the owner asks. Draft changes (e.g. a new CV PDF) may sit uncommitted until they say "ship it".

## What is actually used

Three pages in `_pages/`:

| Page | Layout | Notes |
| --- | --- | --- |
| `about.md` (home, `/`) | `about-rail` | Single scrolling page: About / Research / Teaching sections; nav anchors set in `_config.yml` |
| `cv.md` (`/cv/`) | `page` | Download link + iframe embed of the CV PDF in `assets/pdf/` |
| `404.md` | `page` | |

Supporting files:

- `_bibliography/papers.bib`: publications, rendered by jekyll-scholar via `_layouts/bib.liquid`. Thumbnails come from `preview = {...}` → `assets/img/publication_preview/`.
- `_data/socials.yml` (email, Scholar ID, LinkedIn, ORCID), `_data/courses.yml` (teaching, images in `assets/img/teaching/`), `_data/venues.yml`, `_data/coauthors.yml`.
- `_sass/`: custom typography and colours. Fonts are self-hosted in `assets/fonts` and `assets/webfonts`.
- `_config.yml`: site title/description, nav, feature flags (`enable_*`), analytics (GoatCounter), Google verification.

Unused al-folio leftovers were moved to `_archive/` (paths mirror their old locations; Jekyll ignores the folder). Archive rather than delete. Some leftovers remain on purpose:
- `_layouts/bib.liquid` needs `video.liquid`, `figure.liquid` and the `file_exists`, `remove_accents`, `inspirehep_citations` and `google_scholar_citations` tags from `_plugins/`. Liquid parses tags even inside switched-off branches, so removing those plugins breaks the build.
- `assets/css/jupyter.css` is loaded by `common.js`.
- Unused gems sit in the Gemfile's `:unused_plugins` group, so they aren't loaded. Removing them from the Gemfile would require regenerating `Gemfile.lock`, which needs Ruby.

## The CV

- LaTeX source: `assets/CV/` (main file `cv-llt.tex`; sections in `employment.tex`, `education.tex`, `skills.tex`, etc.; styling in `settings.sty`). It is excluded from the Jekyll build in `_config.yml`, so the source is never published.
- Build with **pdfLaTeX** (not XeLaTeX), outside the repo so no build junk lands in it:
  ```bash
  cd assets/CV && latexmk -pdf -f -interaction=nonstopmode -outdir="$TMP/cvbuild" cv-llt.tex
  ```
  `-f` is needed: the source logs about 170 pre-existing LaTeX errors (an undefined `lightblue` colour in `settings.sty` and `\or` errors in the rubric environment), but the PDF comes out correct. Check the output visually after every build.
- The published PDF is `assets/pdf/CV.pdf`. To update the online CV, copy the build output there and commit it. `_pages/cv.md` must point at that file. The previous dated copy, `CV_202608.pdf`, is in `_archive/`.
- The date line at the end of the CV uses `\today`, so it changes with every rebuild.

## Conventions

- Commit messages: imperative, describe the effect (see `git log`).
- Keep British spelling in site and CV text ("behavioural", "organiser").
- Before deleting theme leftovers, check references with `git grep` (layouts via `layout:`, includes via `include`, JS via `_includes/scripts.liquid`, feature flags in `_config.yml`). Plain `grep -r` over this G: drive is very slow; prefer `git grep`.
