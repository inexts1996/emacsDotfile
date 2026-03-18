# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

Doom Emacs personal configuration (`~/.doom.d`). The four core files follow Doom's standard structure:

- **`init.el`** — Declares which Doom modules are enabled (the only file requiring `doom sync` after changes)
- **`config.el`** — Personal settings: theme, fonts, keybindings, package configuration (no `doom sync` needed)
- **`packages.el`** — Declares additional packages to install via straight.el (requires `doom sync`)
- **`custom.el`** — Emacs customize-generated settings (currently empty)

## Key Commands

```sh
doom sync          # Run after changing init.el or packages.el
doom upgrade       # Update Doom and packages
doom doctor        # Diagnose common issues
doom env           # Regenerate envvar file
doom build         # Byte-compile packages
```

## Active Module Highlights

Completion: `corfu +orderless`, `vertico`. Editor: `evil +everywhere`, `format +onsave`, `fold`, `snippets`. Tools: `lsp`, `magit`, `(eval +overlay)`, `lookup`. Languages: `csharp +lsp`, `emacs-lisp`, `lua`, `json`, `markdown`, `org`, `sh`. UI: `minimap`, `workspaces`, `zen`, `(vc-gutter +pretty)`. App: `(rss +org)`.

## Current Configuration

- **Theme:** `doom-monokai-pro` (rose-pine available but commented out)
- **Font:** LXGW WenKai Mono Screen (size 18, variable-pitch size 16)
- **Line numbers:** relative
- **Frame size:** 120 columns × 40 rows
- **Org directory:** `~/org/`

## Themes Directory

`themes/` is a separate git repo cloned from `donniebreve/rose-pine-doom-emacs`. It provides `doom-rose-pine`, `doom-rose-pine-moon`, and `doom-rose-pine-dawn` themes.

## Conventions

- Wrap package configuration in `after!` blocks so Doom defaults load first
- Use `use-package!` for new package configs, `map!` for keybindings
- No custom packages are declared yet in `packages.el` — only boilerplate comments exist
