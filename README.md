# rocker_demo

Minimal RStudio project running in a `rocker/rstudio` devcontainer, with [renv](https://rstudio.github.io/renv/) for reproducible package management.

## Getting started

Open the project (`demo.Rproj`) in RStudio. `renv` activates automatically via `.Rprofile` and restores the exact package versions from `renv.lock`:

```r
renv::restore()
```

### Opening in a Codespace

Click **Code → Codespaces → Create codespace on main** (or use the GitHub CLI: `gh codespace create`). The devcontainer builds from `rocker/rstudio`, and the RStudio Server port (8787) is auto-forwarded — a notification/link should appear once it's up.

If RStudio doesn't come up automatically, open a terminal in the codespace and run:

```sh
sudo rstudio-server start   # or: sudo rstudio-server restart
```

then open the forwarded port 8787 from the **Ports** tab.

## Adding packages

1. Install as usual: `install.packages("pkg")` or `renv::install("pkg")`.
2. Use it in your code.
3. Record it in the lockfile: `renv::snapshot()`.
4. Commit `renv.lock` (never commit `renv/library/`, which is already gitignored).

Check `renv::status()` any time to see if the lockfile is out of sync with your code or library.

## Managing secrets

Never hardcode API keys, tokens, or credentials in `.R`/`.Rmd` files or commit them.

- Put secrets in a local `.Renviron` file (already gitignored) as `KEY=value` lines.
- Read them in code with `Sys.getenv("KEY")`.
- Restart R after editing `.Renviron` for changes to take effect.

## Best practices

- Snapshot (`renv::snapshot()`) after every dependency change, and commit `renv.lock` alongside the code that needs it.
- Run `renv::restore()` after pulling changes that touch `renv.lock`.
- Keep `renv.lock` in version control; keep `renv/library/` and `.Renviron` out of it.
- Don't `renv::install()` packages you don't snapshot, and don't hand-edit `renv.lock`.
