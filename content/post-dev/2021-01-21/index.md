---
title: Jan 21, 2021
author: Luna L. Sanchez-Reyes
date: "2021-01-21"

tags:
- Reproducibility
- Open Science
- Python
- Mac


---

Today I'm trying to install Physcraper in a new computer, a 2015 MacBook Air.
The goal is to check for installation issues

The computer still has python 2 as default.
How to make python 3 the default?


We worked on a bunch of issues from documentation, on a separate branch.

At the same time, EJM fixed errors on main branch and to merg main into our working branch I did

```
git checkout working_branch
git merge main
git push
```

That's it, no need to commit.
If there are merging issues you just have to fix them and then you do have to commit, then merge, then push `r emo::ji("star2")`




