---
date: "2019-11-01T00:00:00Z"
draft: false
linktitle: Answering the questions
menu:
  example:
    parent: Release
    weight: 1
title: 
toc: true
type: docs
weight: 1
---


In this tutorial, I'll share ways to answer questions upon running `devtools::release()`

Most of them are pretty straight forward. Some required additional google search foo 

## Have you checked for spelling errors (with `spell_check()`)?

## Have you run `R CMD check` locally?

## Were devtool's checks successful?

## Have you checked on R-hub (with `check_rhub()`)?

## Have you checked on win-builder (with `check_win_devel()`)?

## Have you updated `NEWS.md` file?

## Have you updated `DESCRIPTION`?

## Have you updated `cran-comments.md?`

## Have you updated website in `docs/`?

```
install.packages("pkgdown")
pkgdown::build_site()
```

## Were Git checks successful?

### Checking uncommitted files...

```
WARNING: All files should be tracked and committed before release. Please add and commit.
```

Make sure you have commited everything, i.e., that you are up to date with master.


### Checking synchronisation with remote branch...

```
ERROR: Error in 'git2r_remote_fetch': unsupported URL protocol
```
https://github.com/ropensci/git2r/issues/300


## Is your email address maintainers-email@whatever.com?



